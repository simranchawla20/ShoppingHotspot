using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingHotspot
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            try
            {
                string conn = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                SqlConnection objsqlconn = new SqlConnection(conn);
                objsqlconn.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblAdmin where Email='" + txtUsername.Text + "' and Password ='" + TxtPassword.Text + "'", objsqlconn);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    String AdminId = Convert.ToString(dt.Rows[0][0]);
                    Session["AdminName"] = Convert.ToString(dt.Rows[0][1]) + Convert.ToString(dt.Rows[0][2]);
                    FormsAuthentication.RedirectFromLoginPage(AdminId, true);
                    Response.Redirect("Admin/AdminDashboard.aspx");
                }
                else if (dt.Rows.Count == 0)
                {
                    SqlCommand cmdd = new SqlCommand("Select * from tblUsers where Email='" + txtUsername.Text + "' and Password ='" + TxtPassword.Text + "'", objsqlconn);

                    SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                    DataTable dtt = new DataTable();
                    daa.Fill(dtt);
                    if (dtt.Rows.Count > 0)
                    {
                        if (Convert.ToBoolean(dtt.Rows[0][10]) == true)
                        {
                           
                            Session["id"] = dtt.Rows[0][0];
                            String UserId = Convert.ToString(dtt.Rows[0][0]);
                            Session["username"] = Convert.ToString(dtt.Rows[0][1]) + Convert.ToString(dtt.Rows[0][2]);
                            Session["email"] = dtt.Rows[0][3];
                            FormsAuthentication.RedirectFromLoginPage(UserId, true);

                            String UserTypeId = Convert.ToString(dtt.Rows[0][12]);
                            SqlCommand CMD = new SqlCommand("Select * from tblUserType where id='" + UserTypeId + "'", objsqlconn);

                            SqlDataAdapter DA = new SqlDataAdapter(CMD);
                            DataTable DT = new DataTable();
                            DA.Fill(DT);
                            if (Convert.ToString(DT.Rows[0][1]) == "user")
                            {
                                String cartVAlue = Request.QueryString["type"];
                                if (Convert.ToString(Session["AddCart"]) == "AddToCart" || Convert.ToString(Session["ViewCart"]) == "ViewCart" || cartVAlue == "ViewCart") 
                                {
                                    string connn = "";
                                    connn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                                    SqlConnection objsqlconnn = new SqlConnection(connn);
                                    objsqlconnn.Open();

                                    string CartUserId = Convert.ToString(Session["id"]);

                                    SqlCommand comd = new SqlCommand("select MAX(id) as MaxID from tblCartProduct", objsqlconnn);
                                    SqlDataAdapter dda = new SqlDataAdapter(comd);
                                    DataTable ddt = new DataTable();
                                    dda.Fill(ddt);
                                    String MaxId = Convert.ToString(ddt.Rows[0][0]);
                                    SqlCommand objcmd = new SqlCommand("update tblCartProduct set UserId ='" + CartUserId + "' where id='" + MaxId + "'", objsqlconnn);
                                    objcmd.ExecuteNonQuery();
                                   
                                    Response.Redirect("CartProduct.aspx");
                                }
                                else
                                {
                                    Response.Redirect("User/userDashboard.aspx");
                                }
                                
                            }
                            else if(Convert.ToString(DT.Rows[0][1]) == "Seller")
                            {
                                Response.Redirect("Seller/SellerDashboard.aspx");
                            }
                            else
                            {
                                Response.Redirect("service/ServiceDashboard.aspx");
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('You account is disabled. Waiting for Admin Approval.')</script>");
                        }

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password')</script>");
                    }
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
    }
}