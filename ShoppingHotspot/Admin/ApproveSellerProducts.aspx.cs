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
    public partial class ApproveSellerProducts : System.Web.UI.Page
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
            string query = "select * from tblSellerProducts";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdSellerProduct.DataSource = dt;
                        GrdSellerProduct.DataBind();
                    }
                }
            }
        }
        protected void GrdSellerProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdSellerProduct.PageIndex = e.NewPageIndex;
            bindGrid();
        }
        protected void GrdSellerProduct_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = e.CommandArgument.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();


            if (e.CommandName == "Active")
            {
                SqlCommand objcmd = new SqlCommand("update tblSellerProducts set status= '" + true + "' where Id = " + id + " ", objsqlconn);
                try
                {
                    objcmd.ExecuteNonQuery();

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
            else if (e.CommandName == "UnActive")
            {
                SqlCommand objcmd = new SqlCommand("update tblSellerProducts set status= '" + false + "' where Id = " + id + " ", objsqlconn);
                try
                {
                    objcmd.ExecuteNonQuery();

                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully disApproved ')</script>");

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
        protected void GrdSellersProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = GrdSellerProduct.DataKeys[e.RowIndex].Value.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>return(confirm('Are you sure you want to delete the selected Offer?'));</script>");


            SqlCommand objcmd = new SqlCommand("delete from tblSellerProducts where Id = " + id + " ", objsqlconn);
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