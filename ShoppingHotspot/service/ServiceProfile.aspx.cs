using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingHotspot.service
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!this.Page.User.Identity.IsAuthenticated)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }
                if (!IsPostBack)
                {
                    string conn = "";
                    conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBTourandTravels;Integrated Security=True";

                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();

                    txtFirstname.Text = Session["FirstName"].ToString();
                    TxtLastname.Text = Session["LastName"].ToString();
                    lblUsername.Text = txtFirstname.Text + TxtLastname.Text;
                    TxtEmail.Text = Session["email"].ToString();
                    TxtPassword.Text = Session["password"].ToString();
                    TxtPhone.Text = Session["phone"].ToString();
                    TxtAddress.Text = Session["Address"].ToString();
                    txtGender.Text = Session["Gender"].ToString();
                    txttype.Text = Session["type"].ToString();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";

            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();

            string id = Session["ID"].ToString();

            SqlCommand objcmd = new SqlCommand("update tblUsers set FirstName= '" + txtFirstname.Text + "',LastName= '" + TxtLastname.Text + "',Password= '" + TxtPassword.Text + "',Phone= '" + TxtPhone.Text + "',Address= '" + TxtAddress.Text + "',ModifiedOn= '" + DateTime.Now + "',Gender= '" + txtGender.Text + "' where Id =   '" + id + "' ", objsqlconn);
            try
            {
                objcmd.ExecuteNonQuery();

                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully updated')</script>");

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