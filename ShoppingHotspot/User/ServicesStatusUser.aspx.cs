using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingHotspot.User
{
    public partial class ServicesStatusUser : System.Web.UI.Page
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
            string id = Session["ID"].ToString();
            string query = "select usr.FirstName,usr.Email,usr.Phone,AsgnJb.JobAssigned,AsgnJb.Status,AsgnJb.AssignedDate from tblAssignJob as AsgnJb INNERJOIN tblUsers as usr on AsgnJb.EmployeeNameId=usr.id ";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdServiceStatus.DataSource = dt;
                        GrdServiceStatus.DataBind();
                    }
                }
            }
        }
        protected void GrdServiceStatus_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdServiceStatus.PageIndex = e.NewPageIndex;
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
                SqlCommand objcmd = new SqlCommand("update tblAssignJob set status= '" + "In Progress" + "' where Id = " + idx + 1 + " ", objsqlconn);
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