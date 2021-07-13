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
    public partial class CartProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                BindProducts();
                diplayOrderSummary();
            }
        }

        
            public void BindProducts()
        {
            string con = "";
            con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(con);
            sqlconn.Open();
            string CartUserId = Convert.ToString(Session["id"]);
            SqlCommand cmdd = new SqlCommand("select * from tblCartProduct where UserId= '" + CartUserId + "'", sqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            RepeaterCartProducts.DataSource = dtt;
            RepeaterCartProducts.DataBind();

        }
        public void diplayOrderSummary()
        {
            string con = "";
            con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(con);
            sqlconn.Open();
            SqlCommand cmdd = new SqlCommand("SELECT SUM(CAST(TotalPrice as int)) FROM tblCartProduct", sqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            lblSubTotal.Text = Convert.ToString(dtt.Rows[0][0]);
            lblGrandTotal.Text = Convert.ToString(dtt.Rows[0][0]);
        }

        [System.Web.Services.WebMethod]
        public static string UpdateQuantity(string ID, string Quantity, string Price)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";

            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();
            int totalPrice = Convert.ToInt32(Quantity) * Convert.ToInt32(Price);
            string tp = Convert.ToString(totalPrice);
            SqlCommand objcmd = new SqlCommand("update tblCartProduct set Quantity= '" + Quantity + "',TotalPrice= '" + tp + "' where id= '" + ID + "' ", objsqlconn);
            try
            {
                objcmd.ExecuteNonQuery();

                return "success";
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
        [System.Web.Services.WebMethod]
        public static string RemoveCart(string ID)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";

            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();
            

            SqlCommand objcmd = new SqlCommand("delete from tblCartProduct where id= '" + ID + "' ", objsqlconn);
            try
            {
                objcmd.ExecuteNonQuery();

                return "success";
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