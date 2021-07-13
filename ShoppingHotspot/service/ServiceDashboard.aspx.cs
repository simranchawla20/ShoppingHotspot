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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!this.Page.User.Identity.IsAuthenticated)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }
                string con = "";
                con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                SqlConnection sqlconn = new SqlConnection(con);
                sqlconn.Open();
                String id = Convert.ToString(Session["id"]);
                SqlCommand cmdd = new SqlCommand("select usr.id,  usr.FirstName, usr.LastName, usr.Email, usr.Phone, usr.Password, usr.Address, usr.Gender,typ.UserType from[dbo].[tblUsers] as usr inner join[dbo].[tblUserType] as typ on usr.userTypeId=typ.id where usr.id='" + id + "'", sqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);

                if (dtt.Rows.Count > 0)
                {
                    Session["ID"] = dtt.Rows[0][0];
                    Session["FirstName"] = dtt.Rows[0][1];
                    Session["LastName"] = dtt.Rows[0][2];
                    lblUsername.Text = dtt.Rows[0][1].ToString() + dtt.Rows[0][2].ToString();
                    Session["email"] = dtt.Rows[0][3];
                    Session["phone"] = dtt.Rows[0][4];
                    Session["password"] = dtt.Rows[0][5];
                    Session["Address"] = dtt.Rows[0][6];
                    Session["Gender"] = dtt.Rows[0][7];
                    Session["type"] = dtt.Rows[0][8];
                }
            }
        }
    }
}