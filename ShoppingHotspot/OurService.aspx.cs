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
    public partial class OurService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindServices();
            }
        }
        public void BindServices()
        {
            string con = "";
            con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(con);
            sqlconn.Open();

            SqlCommand cmdd = new SqlCommand("Select * from tblService where status='true'", sqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            RepeaterService.DataSource = dtt;
            RepeaterService.DataBind();
        }
    }
}