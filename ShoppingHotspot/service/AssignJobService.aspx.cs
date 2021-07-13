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
    public partial class AssignJobService : System.Web.UI.Page
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
            String UserId= Convert.ToString(Session["id"]);
            string query = "select * from tblAssignJob where EmployeeNameId=id";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdAssignJob.DataSource = dt;
                        GrdAssignJob.DataBind();
                    }
                }
            }
        }
        protected void GrdAssignJob_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdAssignJob.PageIndex = e.NewPageIndex;
            bindGrid();
        }
    }
}