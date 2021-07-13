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
    public partial class ServicePriceAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)// if not refresh i.e not from this page to this page
                            //(basically used to avoid running lines which are in this, when it is loaded again)
                            //i.e if we have selected the item in ddl and then reload page, ddl will remain as it is with its selected value.
                            //No need to select its value again as when reloaded(i.e from this to this page)bindServicePriceDDL(); did not run bcoz of isPostBack.
            {
                if (!this.Page.User.Identity.IsAuthenticated)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }
                else
                {
                    bindGrid();
                    bindServicePriceDDL();
                    
                }
            }
        }
        public void bindGrid()
        {
            string connetionString;
            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string query = "select srcvNme.id,ServTyp.title,srcvNme.ServiceName,srcvNme.Price,srcvNme.Status,srcvNme.CreatedOn,srcvNme.ModifiedOn from tblService as ServTyp inner join tblServicePrice as srcvNme on ServTyp.id=srcvNme.ServiceTypeId";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdServicePrice.DataSource = dt;
                        GrdServicePrice.DataBind();
                    }
                }
            }
        }

        protected void GrdServicePrice_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdServicePrice.PageIndex = e.NewPageIndex;
            bindGrid();
        }

        public void bindServicePriceDDL()
        {
            string connetionString;


            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection con = new SqlConnection(connetionString);

            string com = "select id,title from tblService";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlServiceType.DataSource = dt;
            ddlServiceType.DataBind();
            ddlServiceType.DataTextField = "title";
            ddlServiceType.DataValueField = "id";
            ddlServiceType.DataBind();

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string conn = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";

                if (btnAdd.Text == "Add")
                {

                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();
                    string ServiceType = ddlServiceType.SelectedValue;

                    SqlCommand objcmd = new SqlCommand("Insert into tblServicePrice(ServiceTypeId,ServiceName,Price,Status,CreatedOn,ModifiedOn) Values('" + ServiceType + "','" + txtServiceName.Text + "','" + txtServicePrice.Text + "','" + true + "','" + DateTime.Now + "','" + DateTime.Now + "')", objsqlconn);

                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    bindServicePriceDDL();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Added a Service')</script>");
                }
                else if (btnAdd.Text == "Update")
                {
                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();
                    string RowId = Session["RowId"].ToString();
                    string ServiceType = ddlServiceType.SelectedValue;
                    SqlCommand objcmd = new SqlCommand("update tblServicePrice set ServiceTypeId='" + ServiceType + "',ServiceName='" + txtServiceName.Text + "',Price='" + txtServicePrice.Text + "',ModifiedOn='" + DateTime.Now + "' where id='" + RowId + "'", objsqlconn);
                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    bindServicePriceDDL();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Updated')</script>");
                    btnAdd.Text = "Add";
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void clear()
        {
            txtServiceName.Text = "";
            txtServicePrice.Text = "";
            ddlServiceType.ClearSelection();
        }

        protected void GrdServicePrice_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = e.CommandArgument.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();

            if (e.CommandName == "Active")
            {
                SqlCommand objcmd = new SqlCommand("update tblServicePrice set Status= '" + true + "' where Id = " + id + " ", objsqlconn);
                try
                {
                    objcmd.ExecuteNonQuery();

                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully enabled service')</script>");

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
                SqlCommand objcmd = new SqlCommand("update tblServicePrice set status= '" + false + "' where Id = " + id + " ", objsqlconn);
                try
                {
                    objcmd.ExecuteNonQuery();

                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully disabled service')</script>");

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

                SqlCommand cmdd = new SqlCommand("Select * from tblServicePrice where id='" + id + "'", sqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);

                if (dtt.Rows.Count > 0)
                {

                    Session["RowId"] = Convert.ToString(dtt.Rows[0][0]);
                    ddlServiceType.SelectedValue = Convert.ToString(dtt.Rows[0][1]);
                    txtServiceName.Text = Convert.ToString(dtt.Rows[0][2]);
                    txtServicePrice.Text = Convert.ToString(dtt.Rows[0][3]);
                    btnAdd.Text = "Update";
                }
            }

        }

        protected void GrdServicePrice_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = GrdServicePrice.DataKeys[e.RowIndex].Value.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();
            //ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>return(confirm('Are you sure you want to delete the selected Offer?'));</script>");


            SqlCommand objcmd = new SqlCommand("delete from tblServicePrice where Id = " + id + " ", objsqlconn);
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