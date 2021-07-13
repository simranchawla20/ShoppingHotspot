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
    public partial class SubCategory : System.Web.UI.Page
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
                        bindMainCategoryDDL();
                    }
                }
            }
        }
        public void bindGrid()
        {
            string connetionString;


            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string query = "select subcat.id,subcat.subCategory,MainCat.categoryName,subcat.CreatedOn,subcat.ModifiedOn,subcat.status from [dbo].[tblCategory] as MainCat inner join[dbo].[tblSubCategory] as subcat on MainCat.id=subcat.mainCategoryId";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdSubCategory.DataSource = dt;
                        GrdSubCategory.DataBind();
                    }
                }
            }
        }

        protected void GrdSubCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdSubCategory.PageIndex = e.NewPageIndex;
            bindGrid();
        }

        public void bindMainCategoryDDL()
        {
            string connetionString;
         

            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection con = new SqlConnection(connetionString);

            string com = "select id,categoryName from tblCategory";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlMainCat.DataSource = dt;
            ddlMainCat.DataBind();
            ddlMainCat.DataTextField = "categoryName";
            ddlMainCat.DataValueField = "id";
            ddlMainCat.DataBind();

        }
        protected void btnAddSubCategory_Click(object sender, EventArgs e)
        {
            try
            {
                string conn = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                
                if (btnAddSubCategory.Text == "Add SubCategory")
                {

                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();
                    string MainCat = ddlMainCat.SelectedValue;

                    SqlCommand objcmd = new SqlCommand("Insert into tblSubCategory(subCategory,mainCategoryId,CreatedOn,modifiedOn,status) Values('" + txtSubCategory.Text + "','" + MainCat + "','" + DateTime.Now + "','" + DateTime.Now + "','" + true + "')", objsqlconn);

                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    bindMainCategoryDDL();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Added a SubCategory')</script>");
                }
                else if (btnAddSubCategory.Text == "Update SubCategory")
                {
                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();
                    string catId = Session["CatId"].ToString();
                    string MainCat = ddlMainCat.SelectedValue;
                    SqlCommand objcmd = new SqlCommand("update tblSubCategory set subCategory='" + txtSubCategory.Text + "',mainCategoryId='" + MainCat + "',modifiedOn='" + DateTime.Now + "' where id='" + catId + "'", objsqlconn);
                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    bindMainCategoryDDL();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Updated SubCategory')</script>");
                    btnAddSubCategory.Text = "Add SubCategory";
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void clear()
        {
            txtSubCategory.Text = "";
            ddlMainCat.ClearSelection();
        }

        protected void GrdSubCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = e.CommandArgument.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();

            if (e.CommandName == "select")
            {

                SqlCommand cmdd = new SqlCommand("Select * from tblSubCategory where id='" + id + "'", objsqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);

                if (dtt.Rows.Count > 0)
                {

                    Session["CatId"] = Convert.ToString(dtt.Rows[0][0]);
                    ddlMainCat.SelectedValue = Convert.ToString(dtt.Rows[0][2]);
                    txtSubCategory.Text = Convert.ToString(dtt.Rows[0][1]);
                    btnAddSubCategory.Text = "Update SubCategory";
                }
            }

        }
    }
}