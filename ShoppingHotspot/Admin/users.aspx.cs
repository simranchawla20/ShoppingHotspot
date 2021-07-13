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
    public partial class users : System.Web.UI.Page
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



            //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string query = "select usr.id,  usr.FirstName, usr.LastName, usr.Email, usr.Phone, usr.Password, usr.Address, usr.CreatedOn, usr.ModifiedOn, usr.DeletedOn, usr.status, usr.Gender,typ.UserType from [dbo].[tblUsers] as usr inner join [dbo].[tblUserType] as typ on usr.userTypeId=typ.id";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdUsers.DataSource = dt;
                        GrdUsers.DataBind();
                    }
                }
            }
        }

        protected void GrdUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdUsers.PageIndex = e.NewPageIndex;
            bindGrid();
        }
        protected void GrdUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = e.CommandArgument.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();


            if (e.CommandName == "Active")
            {
                SqlCommand objcmd = new SqlCommand("update tblUsers set Status= '" + true + "' where Id = " + id + " ", objsqlconn);
                try
                {
                    objcmd.ExecuteNonQuery();

                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Approved User')</script>");

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
            else if (e.CommandName == "UnActive")
            {
                SqlCommand objcmd = new SqlCommand("update tblUsers set Status= '" + false + "' where Id = " + id + " ", objsqlconn);
                try
                {
                    objcmd.ExecuteNonQuery();

                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Approved User')</script>");

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
            else if (e.CommandName == "select")
            {
                string con = "";
                con = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                SqlConnection sqlconn = new SqlConnection(con);
                sqlconn.Open();

                SqlCommand cmdd = new SqlCommand("Select * from tblUsers where id='" + id + "'", sqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);

                if (dtt.Rows.Count > 0)
                {
                    
                    Session["FirstName"] = dtt.Rows[0][1];
                    Session["LastName"] = dtt.Rows[0][2];
                    Session["email"] = dtt.Rows[0][3];
                    Session["phone"] = dtt.Rows[0][4];
                    Session["password"] = dtt.Rows[0][5];
                    Session["Address"] = dtt.Rows[0][6];
                    Session["Status"] = dtt.Rows[0][10];
                    Session["Gender"] = dtt.Rows[0][11];
                    Response.Redirect("UpdateUser.aspx?id="+ dtt.Rows[0][0] + "");
                }
            }
           
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string connetionString;


            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";



            //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string query = "select usr.id,  usr.FirstName, usr.LastName, usr.Email, usr.Phone, usr.Password, usr.Address,usr.CreatedOn, usr.ModifiedOn, usr.DeletedOn, usr.status, usr.Gender,typ.UserType from[dbo].[tblUsers] as usr inner join[dbo].[tblUserType] as typ on usr.userTypeId=typ.id WHERE FirstName LIKE '%" + txtsearch.Text + "%'";

            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdUsers.DataSource = dt;
                        GrdUsers.DataBind();
                    }
                }
            }
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(conn);
            sqlconn.Open();
            SqlCommand command1 = new SqlCommand("select count(id) from tblusers WHERE FirstName LIKE '%" + txtsearch.Text + "%'", sqlconn);
            Int32 countusers = Convert.ToInt32(command1.ExecuteScalar());

            lblSearchedusers.Visible = true;
            txtSearchedusers.Text = countusers.ToString();
            txtSearchedusers.Visible = true;
        }
       

        protected void GrdUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = GrdUsers.DataKeys[e.RowIndex].Value.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>return(confirm('Are you sure you want to delete the selected item?'));</script>");


            SqlCommand objcmd = new SqlCommand("delete from tblUsers where Id = " + id + " ", objsqlconn);
            try
            {
                objcmd.ExecuteNonQuery();

                bindGrid();
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully deleted')</script>");

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