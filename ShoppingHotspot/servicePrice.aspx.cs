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
    public partial class servicePrice : System.Web.UI.Page
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
            string servicetypeName = Request.QueryString["ServiceType"];
            lblSeriveTypeByQueryString.Text = servicetypeName;
            string connetionString;
            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string query = "select srcvNme.ServiceName,srcvNme.Price from tblService as ServTyp inner join tblServicePrice as srcvNme on ServTyp.id=srcvNme.ServiceTypeId where ServTyp.title='"+ servicetypeName + "'";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdServicePrice.DataSource = dt;
                        GrdServicePrice.DataBind();
                    }
                }
            }
        }
        protected void GrdServicePrice_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdServicePrice.PageIndex = e.NewPageIndex;
            bindGrid();
        }

    }
}