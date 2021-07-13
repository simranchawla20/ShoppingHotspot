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
    public partial class WebForm1 : System.Web.UI.Page
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
            string query = "select * from [dbo].[tblOffer]";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdOffer.DataSource = dt;
                        GrdOffer.DataBind();
                    }
                }
            }
        }

        protected void GrdOffer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdOffer.PageIndex = e.NewPageIndex;
            bindGrid();
        }

        protected void btnAddOffer_Click(object sender, EventArgs e)
        {
            try
            {
                string conn = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                String Userid = Convert.ToString(Session["id"]);
                if (btnAddOffer.Text == "Add")
                {

                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();

                    SqlCommand objcmd = new SqlCommand("Insert into tblOffer(offerName,createdOn,expiresOn,status) Values('" + txtOffer.Text + "','" + DateTime.Now + "','" + txtExpiresOn.Text + "','" + true + "')", objsqlconn);

                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Added')</script>");
                }
                else if (btnAddOffer.Text == "Update Offer")
                {
                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();
                    string OfferId = Session["offerId"].ToString();
                    SqlCommand objcmd = new SqlCommand("update tblOffer set offerName='" + txtOffer.Text + "',expiresOn='" + txtExpiresOn.Text + "'where id='" + OfferId + "'", objsqlconn);
                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Updated offer')</script>");
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void clear()
        {
            txtOffer.Text = "";
            txtExpiresOn.Text = "";
        }


        protected void GrdOffer_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = e.CommandArgument.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();


            if (e.CommandName == "Active")
            {
                SqlCommand objcmd = new SqlCommand("update tblOffer set status= '" + true + "' where Id = " + id + " ", objsqlconn);
                try
                {
                    objcmd.ExecuteNonQuery();

                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully enabled offer')</script>");

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
                SqlCommand objcmd = new SqlCommand("update tblOffer set status= '" + false + "' where Id = " + id + " ", objsqlconn);
                try
                {
                    objcmd.ExecuteNonQuery();

                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully disabled offer')</script>");

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

                SqlCommand cmdd = new SqlCommand("Select * from tblOffer where id='" + id + "'", sqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);

                if (dtt.Rows.Count > 0)
                {
                    Session["offerId"] = Convert.ToString(dtt.Rows[0][0]);
                    txtOffer.Text = Convert.ToString(dtt.Rows[0][2]);
                    txtExpiresOn.Text = Convert.ToString(dtt.Rows[0][3]);
                    btnAddOffer.Text = "Update Offer";
                }
            }

        }
        protected void GrdOffer_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = GrdOffer.DataKeys[e.RowIndex].Value.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>return(confirm('Are you sure you want to delete the selected Offer?'));</script>");


            SqlCommand objcmd = new SqlCommand("delete from tblOffer where Id = " + id + " ", objsqlconn);
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
