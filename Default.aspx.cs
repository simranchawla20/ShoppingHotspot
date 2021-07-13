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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSlider();
            }
        }
        public void BindSlider()
        {
            string con = "";
            con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(con);
            sqlconn.Open();

            SqlCommand cmdd = new SqlCommand("Select * from tblSlider", sqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            RepeaterSlider.DataSource = dtt;
            RepeaterSlider.DataBind();
        }
    }
}