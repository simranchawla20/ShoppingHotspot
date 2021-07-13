using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingHotspot.Seller
{
    public partial class SeeProductsSeller : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindGrid();
            }
        }
        public void bindGrid()
        {
            string connetionString;

            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            String UsrId = Session["ID"].ToString();
            string query = "select * from tblSellerProducts where UserId='"+ UsrId + "'";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdProducts.DataSource = dt;
                        GrdProducts.DataBind();
                    }
                }
            }
        }
        protected void GrdProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdProducts.PageIndex = e.NewPageIndex;
            bindGrid();
        }
    }
}