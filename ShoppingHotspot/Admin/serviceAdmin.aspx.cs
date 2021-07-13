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
    public partial class serviceAdmin : System.Web.UI.Page
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
            string query = "select * from tblService";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdService.DataSource = dt;
                        GrdService.DataBind();
                    }
                }
            }
        }

        protected void GrdService_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdService.PageIndex = e.NewPageIndex;
            bindGrid();
        }

        protected void btnAddService_Click(object sender, EventArgs e)
        {
            try
            {
                string conn = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                if (btnAddService.Text == "Add Service")
                {

                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();

                    SqlCommand objcmd = new SqlCommand("Insert into tblService(title,description,createdOn,status) Values('" + txtService.Text + "','" + txtDescription.Text + "','" + DateTime.Now + "','" + true + "')", objsqlconn);

                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Added')</script>");
                }
                else if (btnAddService.Text == "Update Service")
                {
                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();

                    SqlCommand objcmd = new SqlCommand("update tblService set title='" + txtService.Text + "',description='" + txtDescription.Text + "'", objsqlconn);
                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Updated Service')</script>");
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void clear()
        {
            txtService.Text = "";
            txtDescription.Text = "";
        }

        protected void GrdService_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = e.CommandArgument.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();

            if (e.CommandName == "Active")
            {
                SqlCommand objcmd = new SqlCommand("update tblService set status= '" + true + "' where Id = " + id + " ", objsqlconn);
                try
                {
                    objcmd.ExecuteNonQuery();

                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully enabled service Type')</script>");

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
                SqlCommand objcmd = new SqlCommand("update tblService set status= '" + false + "' where Id = " + id + " ", objsqlconn);
                try
                {
                    objcmd.ExecuteNonQuery();

                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully disabled service Type')</script>");

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

                SqlCommand cmdd = new SqlCommand("Select * from tblService where id='" + id + "'", sqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);

                if (dtt.Rows.Count > 0)
                {

                    txtService.Text = Convert.ToString(dtt.Rows[0][1]);
                    txtDescription.Text = Convert.ToString(dtt.Rows[0][2]);
                    btnAddService.Text = "Update Service";
                }
            }

        }

        //protected void GrdService_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    string conn = "";
        //    conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
        //    string id = GrdService.DataKeys[e.RowIndex].Value.ToString();
        //    SqlConnection objsqlconn = new SqlConnection(conn);
        //    objsqlconn.Open();
        //    //ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>return(confirm('Are you sure you want to delete the selected Offer?'));</script>");


        //    SqlCommand objcmd = new SqlCommand("delete from tblService where Id = " + id + " ", objsqlconn);
        //    try
        //    {
        //        objcmd.ExecuteNonQuery();

        //        bindGrid();
        //        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully deleted')</script>");

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        objsqlconn.Close();
        //    }
        //}
    }
}