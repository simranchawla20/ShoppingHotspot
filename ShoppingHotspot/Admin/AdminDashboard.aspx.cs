using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingHotspot.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
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
                    string con = "";
                    con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                    SqlConnection sqlconn = new SqlConnection(con);
                    sqlconn.Open();


                    SqlCommand command1 = new SqlCommand("select count(id) from tblusers;", sqlconn);
                    Int32 countusers = Convert.ToInt32(command1.ExecuteScalar());
                    lbltotalusers.Text = countusers.ToString();

                    SqlCommand command2 = new SqlCommand("select count(Status) from tblusers WHERE Status='" + "true" + "';", sqlconn);
                    Int32 countActive = Convert.ToInt32(command2.ExecuteScalar());
                    lblActiveUsers.Text = countActive.ToString();

                    SqlCommand command = new SqlCommand("select count(id) from tblusers  WHERE Status='" + "false" + "';", sqlconn);
                    Int32 countDisabled = Convert.ToInt32(command.ExecuteScalar());
                    lblDisabledUsers.Text = countDisabled.ToString();
                }
            }
        }
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}