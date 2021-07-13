using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingHotspot.service
{
    public partial class JobStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUsername.Text = Session["FirstName"].ToString() + Session["LastName"].ToString();
                bindGrid();
            }
        }
        public void bindGrid()
        {
            string connetionString;

            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            String UserId = Convert.ToString(Session["id"]);
            string query = "select * from tblAssignJob where Status='In Progress' AND EmployeeNameId=id";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdJobStatus.DataSource = dt;
                        GrdJobStatus.DataBind();
                    }
                }
            }
        }
        protected void GrdJobStatus_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdJobStatus.PageIndex = e.NewPageIndex;
            bindGrid();
        }
    }
}