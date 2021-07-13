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
    public partial class shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategory();
                BindSubCat1();
                BindSubCat2();
                BindSubCat3();
                BindSubCat4();
                
            }
            if(Request.QueryString["scat"]!=null)
            {
                BindProductsFromTop();
                ProductCountFromTop();
            }
            if (Request.QueryString["sbcat"] != null)
            {
                BindProductsFromSide();
                ProductCountFromSide();
            }

           
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
        public void BindProductsFromTop()
        {
            string con = "";
            con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(con);
            sqlconn.Open();
            string scat = Request.QueryString["scat"];
            string mcat = Request.QueryString["mcat"];
            SqlCommand cmdd = new SqlCommand("select * from [dbo].[tblProduct] as Prod inner join[dbo].[tblSubCategory] as Subcat " +
                "on Subcat.id = Prod.subCat and Subcat.mainCategoryId = Prod.mainCat " +
                "where Prod.subCat ='"+ scat + "'  and Prod.mainCat ='" + mcat + "'", sqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);

            RepeaterProducts.DataSource = dtt;
            RepeaterProducts.DataBind();

        }

        public void ProductCountFromTop()
        {
            string con = "";
            con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(con);
            sqlconn.Open();
            string scat = Request.QueryString["scat"];
            string mcat = Request.QueryString["mcat"];
            SqlCommand cmdd = new SqlCommand("select COUNT(*) from [dbo].[tblProduct] as Prod inner join[dbo].[tblSubCategory] as Subcat " +
                "on Subcat.id = Prod.subCat and Subcat.mainCategoryId = Prod.mainCat " +
                "where Prod.subCat ='" + scat + "'  and Prod.mainCat ='" + mcat + "'", sqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            lblProductCount.Text = Convert.ToString(dtt.Rows[0][0]);

        }

        public void BindProductsFromSide()
        {
            string con = "";
            con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(con);
            sqlconn.Open();
            string scat = Request.QueryString["sbcat"];
            string mcat = Request.QueryString["mncat"];
            SqlCommand cmdd = new SqlCommand("select * from [dbo].[tblProduct] as Prod inner join[dbo].[tblSubCategory] as Subcat " +
                "on Subcat.id = Prod.subCat and Subcat.mainCategoryId = Prod.mainCat " +
                "where Prod.subCat ='" + scat + "'  and Prod.mainCat ='" + mcat + "'", sqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            RepeaterProducts.DataSource = dtt;
            RepeaterProducts.DataBind();

        }

        public void ProductCountFromSide()
        {
            string con = "";
            con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(con);
            sqlconn.Open();
            string scat = Request.QueryString["sbcat"];
            string mcat = Request.QueryString["mncat"];
            SqlCommand cmdd = new SqlCommand("select COUNT(*) from [dbo].[tblProduct] as Prod inner join[dbo].[tblSubCategory] as Subcat " +
                "on Subcat.id = Prod.subCat and Subcat.mainCategoryId = Prod.mainCat " +
                "where Prod.subCat ='" + scat + "'  and Prod.mainCat ='" + mcat + "'", sqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            lblProductCount.Text = Convert.ToString(dtt.Rows[0][0]);

        }

        protected void btncart_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            //cannot access labels in repeater as we used to do like lblName.Text so following is the method.

                string Productname = (item.FindControl("lblProductName") as Label).Text;
            string Price = (item.FindControl("lblPrice") as Label).Text;
            string Image = (item.FindControl("lblPic") as Label).Text;

            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();

             SqlCommand objcmd = new SqlCommand("Insert into tblCartProduct(Image,productName,Price,Quantity,TotalPrice) Values('" + Image + "','" + Productname + "','" + Price + "','" + 1 + "','" + Price + "')", objsqlconn);
             objcmd.ExecuteNonQuery();

            Session["AddCart"] = "AddToCart";
            Response.Redirect("Login.aspx");
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();
            SqlCommand cmd = new SqlCommand("select id from [dbo].[tblSubCategory] WHERE subCategory Like '%"+txtSearch.Text+ "%'", objsqlconn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string subcatId = Convert.ToString(dt.Rows[0][0]);
            objsqlconn.Close();

            SqlConnection sqlconn = new SqlConnection(conn);
            sqlconn.Open();
            SqlCommand cmdd = new SqlCommand("select * from tblProduct WHERE subCat='"+ subcatId + "'", sqlconn);

            SqlDataAdapter daa= new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);

            RepeaterProducts.DataSource = dtt;
            RepeaterProducts.DataBind();
            sqlconn.Close();

            SqlConnection sqlconn1 = new SqlConnection(conn);
            sqlconn1.Open();
            SqlCommand cmdd1 = new SqlCommand("select count(*) from tblProduct WHERE subCat='" + subcatId + "'", sqlconn1);

            SqlDataAdapter daaa = new SqlDataAdapter(cmdd1);
            DataTable dttt = new DataTable();
            daaa.Fill(dttt);
            lblProductCount.Text = Convert.ToString(dttt.Rows[0][0]);
        }

    }
}