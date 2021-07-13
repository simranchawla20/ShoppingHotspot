using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingHotspot.Admin
{
    public partial class AsignJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindUserNameDDL();
            }
        }
        public void bindUserNameDDL()
        {
            string connetionString;

            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection con = new SqlConnection(connetionString);

            string com = "select id,FirstName,LastName from tblUsers where userTypeId NOT IN('2','20')";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlUserName.DataSource = dt;
            ddlUserName.DataBind();
            ddlUserName.DataTextField = "FirstName";
            ddlUserName.DataValueField = "id";
            ddlUserName.DataBind();
            ddlUserName.Items.Insert(0, "---Select User---");

        }
        protected void ddlUserName_SelectedIndexChanged(object sender, EventArgs e)
        {
            string UserId = ddlUserName.SelectedValue;
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();
            SqlCommand cmdd = new SqlCommand("Select typ.UserType,usr.Email,usr.Phone,usr.Gender from tblUsers as usr inner join tblUserType as typ on usr.userTypeId=typ.id  where usr.id='" + UserId + "'", objsqlconn);
            SqlDataAdapter daa = new SqlDataAdapter(cmdd);
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            txtType.Text = Convert.ToString(dtt.Rows[0][0]);
            txtEmail.Text = Convert.ToString(dtt.Rows[0][1]);
            txtPhone.Text = Convert.ToString(dtt.Rows[0][2]);
            txtGender.Text = Convert.ToString(dtt.Rows[0][3]);     
        }
        protected void btnAssignJob_click(object sender, EventArgs e)
        {
            try
            {
                string conn = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                if (btnAssignJob.Text == "Assign Job")
                {

                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();
                    SqlCommand cmdd = new SqlCommand("Select * from tblAssignJob where EmployeeName='" + ddlUserName.SelectedValue + "' AND JobAssigned='" + ddlJobs.SelectedValue + "'", objsqlconn);
                    SqlDataAdapter da = new SqlDataAdapter(cmdd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('This job is already assigned to this Employee only!')</script>");
                    }
                    else
                    {
                        SqlCommand objcmd = new SqlCommand("Insert into tblAssignJob(EmployeeName,JobAssigned,Status,AssignedDate) Values('" + ddlUserName.SelectedValue + "','" + ddlJobs.SelectedValue + "','" + "In Progress" + "','" + DateTime.Now + "')", objsqlconn);
                        objcmd.ExecuteNonQuery();
                        clear();
                        
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Assigned Job')</script>");

                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void clear()
        {
            ddlUserName.ClearSelection();
            txtType.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtGender.Text = "";
            ddlJobs.ClearSelection();
        }

    }
}