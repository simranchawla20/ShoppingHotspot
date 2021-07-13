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
    public partial class ProductAdmin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)// if not refresh i.e not from this page to this page
            {
                bindGrid();
                bindMainCategoryDDL();
            }
                
           
        }
        public void bindMainCategoryDDL()
        {
            //ddlMainCat.Items.Clear();
            
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
            ddlMainCat.Items.Insert(0, "---Select Main Category---");

        }
        public void bindSubCategoryDDL(string MainCatId)
        {
            string connetionString;

            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection con = new SqlConnection(connetionString);
            
            string com = "select id,subCategory from tblSubCategory where mainCategoryId='"+ MainCatId + "'";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlSubCat.DataSource = dt;
            ddlSubCat.DataBind();
            ddlSubCat.DataTextField = "subCategory";
            ddlSubCat.DataValueField = "id";
            ddlSubCat.DataBind();

        }

        protected void ddlMainCat_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ddlSubCat.Items.Clear();
            //ddlSubCat.Items.Add("Select subcategory");
            bindSubCategoryDDL(ddlMainCat.SelectedValue);
        }
        
        public void bindGrid()
        {
            string connetionString;


            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string query = "select * from tblProduct";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdProduct.DataSource = dt;
                        GrdProduct.DataBind();
                    }
                }
            }
        }

        protected void GrdProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdProduct.PageIndex = e.NewPageIndex;
            bindGrid();
        }

        protected void btnaddproduct_click(object sender, EventArgs e)
        {
            try
            {
                string conn = "";
                string imageName = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";

                if (btnaddproduct.Text == "Add product")
                {
                    if (FileUploadPic.HasFile)
                    {
                        FileUploadPic.SaveAs(Server.MapPath("productImages//" + FileUploadPic.FileName));
                        imageName = FileUploadPic.FileName;
                    }

                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();

                    SqlCommand objcmd = new SqlCommand("Insert into tblProduct(mainCat,subCat,ProductName,price,qnty,description,size,pic,productCode,brand,type,season,offerPrice,delivery,promoCode,UploadBy) Values('" + ddlMainCat.SelectedValue + "','" + ddlSubCat.SelectedValue + "','" + txtProduct.Text + "','" + txtPrice.Text + "','" + txtqnty.Text + "','" + txtDescription.Text + "','" + ddlSize.SelectedValue + "','" + imageName + "','" + txtProductCode.Text + "','" + txtBrand.Text + "','" + txtType.Text + "','" + ddLSeason.SelectedValue + "','" + txtOffer.Text + "','" + txtDelivery.Text + "','" + txtPromoCode.Text + "','" + "Admin" + "')", objsqlconn);

                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Added')</script>");
                }
                else if (btnaddproduct.Text == "Update product")
                {
                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();
                    string ProductId = Session["productId"].ToString();
                    FileUploadPic.SaveAs(Server.MapPath("productImages//" + FileUploadPic.FileName));
                    imageName = FileUploadPic.FileName;
                    SqlCommand objcmd = new SqlCommand("update tblProduct set mainCat='" + ddlMainCat.SelectedValue + "',subCat='" + ddlSubCat.SelectedValue + "',ProductName='" + txtProduct.Text + "',price='" + txtPrice.Text + "',qnty='" + txtqnty.Text + "',description='" + txtDescription.Text + "',size='" + ddlSize.SelectedValue + "',pic='" + imageName + "',productCode='" + txtProductCode.Text + "',brand='" + txtBrand.Text + "',type='" + txtType.Text + "',season='" + ddLSeason.SelectedValue + "',offerPrice='" + txtOffer.Text + "',delivery='" + txtDelivery.Text + "',promoCode='" + txtPromoCode.Text + "'where id='" + ProductId + "'", objsqlconn);
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
            ddlMainCat.ClearSelection();
            ddlSubCat.ClearSelection();
            txtProduct.Text = "";
            txtPrice.Text = "";
            txtqnty.Text = "";
            txtDescription.Text = "";
            ddlSize.ClearSelection();
           //file uploader get clear itself; 
            txtProductCode.Text = "";
            txtBrand.Text = "";
            txtType.Text = "";
            ddLSeason.ClearSelection();
            txtOffer.Text = "";
            txtDelivery.Text = "";
            txtPromoCode.Text = "";
        }
        protected void GrdProduct_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = e.CommandArgument.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();

            if (e.CommandName == "select")
            {

                SqlCommand cmdd = new SqlCommand("Select * from tblProduct where id='" + id + "'", objsqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);

                if (dtt.Rows.Count > 0)
                {

                    Session["productId"] = Convert.ToString(dtt.Rows[0][0]);

                    ddlMainCat.SelectedValue = Convert.ToString(dtt.Rows[0][1]);
                    ddlSubCat.SelectedValue = Convert.ToString(dtt.Rows[0][2]);
                    txtProduct.Text = Convert.ToString(dtt.Rows[0][3]);
                    txtPrice.Text = Convert.ToString(dtt.Rows[0][4]);
                    txtqnty.Text = Convert.ToString(dtt.Rows[0][5]);
                    txtDescription.Text = Convert.ToString(dtt.Rows[0][6]);
                    ddlSize.SelectedValue = Convert.ToString(dtt.Rows[0][7]);
                    txtProductCode.Text = Convert.ToString(dtt.Rows[0][9]);
                    txtBrand.Text = Convert.ToString(dtt.Rows[0][10]);
                    txtType.Text = Convert.ToString(dtt.Rows[0][11]);
                    ddLSeason.SelectedValue= Convert.ToString(dtt.Rows[0][12]);
                    txtOffer.Text = Convert.ToString(dtt.Rows[0][13]);
                    txtDelivery.Text = Convert.ToString(dtt.Rows[0][14]);
                    txtPromoCode.Text = Convert.ToString(dtt.Rows[0][15]);
                    ImgProduct.ImageUrl = "~/Admin/productImages/" + dtt.Rows[0][8];//it is only shown that which image is there,as fileuploader can't be updated.
                    btnaddproduct.Text = "Update product";
                }
            }

        }
        protected void GrdProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = GrdProduct.DataKeys[e.RowIndex].Value.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>return(confirm('Are you sure you want to delete the selected Product?'));</script>");


            SqlCommand objcmd = new SqlCommand("delete from tblProduct where Id = " + id + " ", objsqlconn);
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