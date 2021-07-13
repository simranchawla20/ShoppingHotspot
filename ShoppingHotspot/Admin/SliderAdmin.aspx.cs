using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingHotspot.Admin
{
    public partial class SliderAdmin : System.Web.UI.Page
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
            string query = "select * from tblSlider";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdSlider.DataSource = dt;
                        GrdSlider.DataBind();
                    }
                }
            }
        }

        protected void GrdSlider_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdSlider.PageIndex = e.NewPageIndex;
            bindGrid();
        }

        protected void btnAddSlider_Click(object sender, EventArgs e)
        {
            try
            {
                string conn = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";

                if (btnAddSlider.Text == "Add Slider")
                {
                    if (FileUpload1.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("sliderImages//" + FileUpload1.FileName));
                        Label1.Text = "Image Added";
                        Label1.ForeColor = System.Drawing.Color.ForestGreen;
                        string imageName = FileUpload1.FileName;

                        SqlConnection objsqlconn = new SqlConnection(conn);
                        objsqlconn.Open();
                        SqlCommand objcmd = new SqlCommand("Insert into tblSlider(Image,Text) Values('" + imageName + "','" + txtText1.Text + "')", objsqlconn);
                        objcmd.ExecuteNonQuery();
                        clear();
                        bindGrid();
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Added')</script>");
                    }
                    else
                    {
                        Label1.Text = "Please Select your file";
                        Label1.ForeColor = System.Drawing.Color.Red;
                    }
                }

                else if (btnAddSlider.Text == "Update Slider")
                {

                    if (FileUpload1.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("sliderImages//" + FileUpload1.FileName));
                        Label1.Text = "Image Added";
                        Label1.ForeColor = System.Drawing.Color.ForestGreen;
                        string imageName = FileUpload1.FileName;

                        SqlConnection objsqlconn = new SqlConnection(conn);
                        objsqlconn.Open();

                        string SliderId = Session["SliderId"].ToString();

                        SqlCommand objcmd = new SqlCommand("update tblSlider set Image='" + imageName + "',Text='" + txtText1.Text + "' where id='" + SliderId + "'", objsqlconn);
                        objcmd.ExecuteNonQuery();
                        clear();
                        bindGrid();
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Updated')</script>");
                        btnAddSlider.Text = "Add Slider";
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
            txtText1.Text = "";
            ImgSlider.ImageUrl = "";

        }
        protected void GrdSlider_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = e.CommandArgument.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();

            if (e.CommandName == "select")
            {

                SqlCommand cmdd = new SqlCommand("Select * from tblSlider where id='" + id + "'", objsqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);

                if (dtt.Rows.Count > 0)
                {

                    Session["SliderId"] = Convert.ToString(dtt.Rows[0][0]);

                    txtText1.Text = Convert.ToString(dtt.Rows[0][2]);
                    ImgSlider.ImageUrl = "~/Admin/sliderImages/" + dtt.Rows[0][1];//it is only shown that which image is there,as fileuploader can't be updated.
                    btnAddSlider.Text = "Update Slider";
                }
            }

        }

        protected void GrdSlider_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = GrdSlider.DataKeys[e.RowIndex].Value.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();
            //ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>return(confirm('Are you sure you want to delete the selected Offer?'));</script>");


            SqlCommand objcmd = new SqlCommand("delete from tblSlider where Id = " + id + " ", objsqlconn);
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