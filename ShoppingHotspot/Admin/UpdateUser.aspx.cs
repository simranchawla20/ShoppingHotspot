using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingHotspot.Admin
{
    public partial class UpdateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!this.Page.User.Identity.IsAuthenticated)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }
                else
                {
                    if (!IsPostBack)// if not refresh i.e not from this page to this page
                    {
                        //string conn = "";
                        //conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBTourandTravels;Integrated Security=True";

                        //SqlConnection objsqlconn = new SqlConnection(conn);
                        //objsqlconn.Open();

                        string id = Request.QueryString["id"];
                        lblid.Text = "User Id-" + id;
                        txtFirstname.Text = Session["FirstName"].ToString();
                        TxtLastname.Text = Session["LastName"].ToString();
                        TxtEmail.Text = Session["email"].ToString();
                        TxtPassword.Text = Session["password"].ToString();
                        TxtPhone.Text = Session["phone"].ToString();
                        TxtAddress.Text = Session["Address"].ToString();
                        txtGender.Text = Session["Gender"].ToString();
                        lblname.Text = txtFirstname.Text + " " + TxtLastname.Text;
                        lblemail.Text = TxtEmail.Text;
                    }
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";

            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();

            string id = Session["iD"].ToString();
            //SqlCommand cmdd = new SqlCommand("select * from tblusers where email='" + TxtEmail.Text + "'", objsqlconn);
            //SqlDataAdapter da = new SqlDataAdapter(cmdd);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //if (dt.Rows.Count > 0)
            //{
            //    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('this email id already exists! please change your email')</script>");
            //}
            //else
            //{
                SqlCommand objcmd = new SqlCommand("update tblUsers set FirstName= '" + txtFirstname.Text + "',LastName= '" + TxtLastname.Text + "',Password= '" + TxtPassword.Text + "',Phone= '" + TxtPhone.Text + "',Address= '" + TxtAddress.Text + "',ModifiedOn= '" + DateTime.Now + "',Gender= '" + txtGender.Text + "' where Id =   '" + id + "' ", objsqlconn);
                try
                {
                    objcmd.ExecuteNonQuery();

                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully updated')</script>");
                    lblname.Text = txtFirstname.Text + " " + TxtLastname.Text;
                    lblemail.Text = TxtEmail.Text;
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