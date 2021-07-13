using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingHotspot.User
{
    public partial class updateAddress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!this.Page.User.Identity.IsAuthenticated)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }
                bindGrid();
            }
        }
        public void bindGrid()
        {
            string connetionString;


            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";



            //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string query = "select * from [dbo].[tblAddress]";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdUsers.DataSource = dt;
                        GrdUsers.DataBind();
                    }
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string conn = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                String Userid = Convert.ToString(Session["id"]);
                if (btnAdd.Text == "Add")
                {

                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();
                   
                    SqlCommand objcmd = new SqlCommand("Insert into tblAddress(userId,Address,AddressType,status,Country,state,city,pincode,landMark,createdOn,ModifiedOn) Values('" + Userid + "','" + txtAddress.Text + "','" + AddressType.Text + "','" + true + "','" + TxtCountry.Text + "','" + txtState.Text + "','" + txtCity.Text + "','" + txtPincode.Text + "','" + txtLandMark.Text + "','" + DateTime.Now + "','" + DateTime.Now + "')", objsqlconn);
                    objcmd.ExecuteNonQuery();
                    clear();

                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Added')</script>");
                }
                else if(btnAdd.Text == "Update")
                {
                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();

                    SqlCommand objcmd = new SqlCommand("update tblAddress set Address='" + txtAddress.Text + "',AddressType='" + AddressType.Text + "',Country='" + TxtCountry.Text + "',state='" + txtState.Text + "',city='" + txtCity.Text + "',pincode='" + txtPincode.Text + "',landMark='" + txtLandMark.Text + "',ModifiedOn='" + DateTime.Now + "'", objsqlconn);
                    objcmd.ExecuteNonQuery();
                    clear();

                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Updated')</script>");
                }
                    
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void clear()
        {
            txtAddress.Text = "";
            AddressType.Text = "";
            TxtCountry.Text = "";
            txtState.Text = "";
            txtCity.Text = "";
            txtPincode.Text = "";
            txtLandMark.Text = "";
        }

        protected void GrdUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = e.CommandArgument.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();


            if (e.CommandName == "Active")
            {
                SqlCommand objcmd = new SqlCommand("update tblAddress set status= '" + true + "' where Id = " + id + " ", objsqlconn);
                try
                {
                    objcmd.ExecuteNonQuery();

                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully enabled')</script>");

                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    objsqlconn.Close();
                }
            }
            else if (e.CommandName == "UnActive")
            {
                SqlCommand objcmd = new SqlCommand("update tblAddress set status= '" + false + "' where Id = " + id + " ", objsqlconn);
                try
                {
                    objcmd.ExecuteNonQuery();

                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully disabled')</script>");

                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    objsqlconn.Close();
                }
            }
            else if (e.CommandName == "select")
            {
                string con = "";
                con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                SqlConnection sqlconn = new SqlConnection(con);
                sqlconn.Open();

                SqlCommand cmdd = new SqlCommand("Select * from tblAddress where id='" + id + "'", sqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);

                if (dtt.Rows.Count > 0)
                {

                    txtAddress.Text = Convert.ToString(dtt.Rows[0][2]);
                    AddressType.Text = Convert.ToString(dtt.Rows[0][3]);
                    TxtCountry.Text = Convert.ToString(dtt.Rows[0][8]);
                    txtState.Text = Convert.ToString(dtt.Rows[0][9]);
                    txtCity.Text = Convert.ToString(dtt.Rows[0][10]);
                    txtPincode.Text = Convert.ToString(dtt.Rows[0][11]);
                    txtLandMark.Text = Convert.ToString(dtt.Rows[0][12]);
                    btnAdd.Text = "Update";
                }
            }

        }
        protected void GrdUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = GrdUsers.DataKeys[e.RowIndex].Value.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>return(confirm('Are you sure you want to delete the selected Address?'));</script>");


            SqlCommand objcmd = new SqlCommand("delete from tblAddress where Id = " + id + " ", objsqlconn);
            try
            {
                objcmd.ExecuteNonQuery();

                bindGrid();
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully deleted')</script>");

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objsqlconn.Close();
            }
        }
    }
}