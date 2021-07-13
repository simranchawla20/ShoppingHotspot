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
    public partial class category : System.Web.UI.Page
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
                    if (!IsPostBack)// if not refresh i.e not from this page to this page
                    {
                        bindPositionDDL();
                    }
                }
            }
        }
        public void bindPositionDDL()
        {
            string connetionString;


            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            //string query = "select * from [dbo].[tblPosition]";
            SqlConnection con = new SqlConnection(connetionString);

            string com = "select Id,Position from tblPosition";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlPosition.DataSource = dt;
            ddlPosition.DataBind();
            ddlPosition.DataTextField = "Position";
            ddlPosition.DataValueField = "Id";
            ddlPosition.DataBind();

        }

        public void bindGrid()
        {
            string connetionString;


            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string query = "select * from [dbo].[tblCategory]";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdCategory.DataSource = dt;
                        GrdCategory.DataBind();
                    }
                }
            }
        }

        protected void GrdCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdCategory.PageIndex = e.NewPageIndex;
            bindGrid();
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            try
            {
                string conn = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                // String Userid = Convert.ToString(Session["id"]);
                if (btnAddCategory.Text == "Add Category")
                {

                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();
                    string position = ddlPosition.SelectedValue;

                    SqlCommand objcmd = new SqlCommand("Insert into tblCategory(categoryName,CreatedOn,modifiedOn,status,pos) Values('" + txtCategory.Text + "','" + DateTime.Now + "','" + DateTime.Now + "','" + true + "','" + ddlPosition.SelectedValue + "')", objsqlconn);

                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    bindPositionDDL();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Added')</script>");
                }
                else if (btnAddCategory.Text == "Update Category")
                {
                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();
                    string position = ddlPosition.SelectedValue;
                    SqlCommand objcmd = new SqlCommand("update tblCategory set categoryName='" + txtCategory.Text + "',pos='" + ddlPosition.SelectedValue + "',modifiedOn='" + DateTime.Now + "'", objsqlconn);
                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    bindPositionDDL();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Updated Category')</script>");
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void clear()
        {
            txtCategory.Text = "";
            ddlPosition.ClearSelection();
        }

        protected void GrdCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = e.CommandArgument.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();

            if (e.CommandName == "select")
            {

                SqlCommand cmdd = new SqlCommand("Select * from tblCategory where id='" + id + "'", objsqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);

                if (dtt.Rows.Count > 0)
                {
                   
                    txtCategory.Text = Convert.ToString(dtt.Rows[0][1]);
                    ddlPosition.SelectedValue = Convert.ToString(dtt.Rows[0][5]);
                    btnAddCategory.Text = "Update Category";
                }
            }

        }
    }
}