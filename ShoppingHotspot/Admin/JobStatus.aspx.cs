using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingHotspot.Admin
{
    public partial class JobStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!this.Page.User.Identity.IsAuthenticated)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }
                else
                {
                    bindGrid();

                }
            }
        }
        public void bindGrid()
        {
            string connetionString;

            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string query = "select * from tblAssignJob";
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
        protected void SelectedIndexChanged(object sender, EventArgs e)
        {
            //Reference the DropDownList.
            DropDownList dropDownList = sender as DropDownList;

            //Get the ID of the DropDownList.
            string id = dropDownList.ID;

            //Display the Selected Text of DropDownList.
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + dropDownList.SelectedItem.Text + "');", true);




            GridViewRow row = (GridViewRow)dropDownList.Parent.Parent;
            int idx = row.RowIndex;
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();



            string status = dropDownList.SelectedItem.Value;
            if (status == "0")
            {
                SqlCommand objcmd = new SqlCommand("update tblAssignJob set status= '" + "In Progress" + "' where Id = " + idx+1 + " ", objsqlconn);
                objcmd.ExecuteNonQuery();
            }
            else if (status == "1")
            {
                SqlCommand objcmd = new SqlCommand("update tblAssignJob set status= '" + "Completed" + "' where Id = " + idx + 1 + " ", objsqlconn);
                objcmd.ExecuteNonQuery();
            }
            else if (status == "2")
            {
                SqlCommand objcmd = new SqlCommand("update tblAssignJob set status= '" + "Not Completed" + "' where Id = " + idx + 1 + " ", objsqlconn);
                objcmd.ExecuteNonQuery();
            }
            try
            {
                bindGrid();
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully approved')</script>");

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