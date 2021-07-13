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
    public partial class TermsAndCondition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string conn = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";

                SqlConnection objsqlconn = new SqlConnection(conn);
                objsqlconn.Open();
                SqlCommand cmdd = new SqlCommand("Select * from tblTermCond", objsqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);
                cond.InnerText = dtt.Rows[0][1].ToString();
                title.InnerText = dtt.Rows[0][2].ToString();
                Hcol1.InnerText = dtt.Rows[0][3].ToString();
                Pcol1.InnerText = dtt.Rows[0][4].ToString();
                Hcol2.InnerText = dtt.Rows[0][5].ToString();
                Pcol2.InnerText = dtt.Rows[0][6].ToString();
                Hcol3.InnerText = dtt.Rows[0][7].ToString();
                Pcol3.InnerText = dtt.Rows[0][8].ToString();
            }
        }
    }
}