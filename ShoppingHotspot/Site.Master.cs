using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingHotspot
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindOffer();
            BindCategory();
            BindSubCat1();
            BindSubCat2();
            BindSubCat3();
            BindSubCat4();
            //BindProducts();
        }
        public void BindOffer()
        {
            string con = "";
            con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(con);
            sqlconn.Open();
            String id = Convert.ToString(Session["id"]);
            SqlCommand cmdd = new SqlCommand("Select * from tblOffer where status='true'", sqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            Repeater1.DataSource = dtt;
            Repeater1.DataBind();
        }

        public void BindSubCat1()
        {
            string con = "";
            con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(con);
            sqlconn.Open();
           
            SqlCommand cmdd = new SqlCommand("Select * from tblSubCategory where mainCategoryId='1'", sqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            Repeater2.DataSource = dtt;
            Repeater2.DataBind();
        }
        public void BindSubCat2()
        {
            string con = "";
            con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(con);
            sqlconn.Open();

            SqlCommand cmdd = new SqlCommand("Select * from tblSubCategory where mainCategoryId='2'", sqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            Repeater3.DataSource = dtt;
            Repeater3.DataBind();
        }
        public void BindSubCat3()
        {
            string con = "";
            con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(con);
            sqlconn.Open();

            SqlCommand cmdd = new SqlCommand("Select * from tblSubCategory where mainCategoryId='3'", sqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            Repeater4.DataSource = dtt;
            Repeater4.DataBind();
        }
        public void BindSubCat4()
        {
            string con = "";
            con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(con);
            sqlconn.Open();

            SqlCommand cmdd = new SqlCommand("Select * from tblSubCategory where mainCategoryId='4'", sqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            Repeater5.DataSource = dtt;
            Repeater5.DataBind();
        }
        //public void BindProducts()
        //{
        //    string con = "";
        //    con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
        //    SqlConnection sqlconn = new SqlConnection(con);
        //    sqlconn.Open();
            
        //    SqlCommand cmdd = new SqlCommand("SELECT * FROM tblCartProduct  ", sqlconn);
        //    SqlDataAdapter daa = new SqlDataAdapter(cmdd);
        //    DataTable dtt = new DataTable();
        //    daa.Fill(dtt);
        //    RepeaterCartProducts.DataSource = dtt;
        //    RepeaterCartProducts.DataBind();

        //}
        

        public void BindCategory()
        {
            for (int i = 1; i <= 4; i++)
            {

                string con = "";
                con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                SqlConnection sqlconn = new SqlConnection(con);
                sqlconn.Open();

                SqlCommand cmdd = new SqlCommand("Select * from tblCategory where pos='" + i + "'", sqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);

                if (dtt.Rows.Count > 0)
                {
                    if (i == 1)
                    {
                        lblCategoryname1.Text = dtt.Rows[0][1].ToString();
                    }
                    if (i == 2)
                    {
                        lblCategoryName2.Text = dtt.Rows[0][1].ToString();
                    }
                    if (i == 3)
                    {
                        lblCategoryName3.Text = dtt.Rows[0][1].ToString();
                    }
                    if (i == 4)
                    {
                        lblCategoryName4.Text = dtt.Rows[0][1].ToString();
                    }
                }
            }
        }
        protected void btnviewcart_Click(object sender, EventArgs e)
        {
            Session["ViewCart"] = "ViewCart";
            Response.Redirect("Login.aspx");
        }
    }
}