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
    public partial class ProductAdmin : System.Web.UI.Page
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
            string query = "select * from tblBrand";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdBrand.DataSource = dt;
                        GrdBrand.DataBind();
                    }
                }
            }
        }
        protected void GrdBrand_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdBrand.PageIndex = e.NewPageIndex;
            bindGrid();
        }
        protected void btnAddBrand_Click(object sender, EventArgs e)
        {
            try
            {
                string conn = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                String Userid = Convert.ToString(Session["id"]);
                if (btnAddBrand.Text == "Add Brand")
                {

                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();

                    SqlCommand objcmd = new SqlCommand("Insert into tblBrand(BrandName,AddedOn) Values('" + txtBrand.Text + "','" + DateTime.Now + "')", objsqlconn);

                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Added')</script>");
                }
                else if (btnAddBrand.Text == "Update Brand")
                {
                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();
                    string BrandId = Session["BrandId"].ToString();
                    SqlCommand objcmd = new SqlCommand("update tblBrand set BrandName='" + txtBrand.Text + "'where id='" + BrandId + "'", objsqlconn);
                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Updated Brand')</script>");
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void clear()
        {
            txtBrand.Text = "";
        }

        protected void GrdBrand_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = e.CommandArgument.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();

            if (e.CommandName == "select")
            {

                SqlCommand cmdd = new SqlCommand("Select * from tblBrand where id='" + id + "'", objsqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);

                if (dtt.Rows.Count > 0)
                {

                    Session["BrandId"] = Convert.ToString(dtt.Rows[0][0]);

                    txtBrand.Text = Convert.ToString(dtt.Rows[0][1]);

                    btnAddBrand.Text = "Update Brand";
                }
            }

        }

        protected void GrdBrand_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = GrdBrand.DataKeys[e.RowIndex].Value.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();
            //ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>return(confirm('Are you sure you want to delete the selected Offer?'));</script>");


            SqlCommand objcmd = new SqlCommand("delete from tblBrand where Id = " + id + " ", objsqlconn);
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