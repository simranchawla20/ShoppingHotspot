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
    public partial class DeliveryAdmin : System.Web.UI.Page
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
            string query = "select * from tblDelInfo";
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GrdDelInfo.DataSource = dt;
                        GrdDelInfo.DataBind();
                    }
                }
            }
        }

        protected void GrdDelInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdDelInfo.PageIndex = e.NewPageIndex;
            bindGrid();
        }

        protected void btnAddDelInfo_Click(object sender, EventArgs e)
        {
            try
            {
                string conn = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                String Userid = Convert.ToString(Session["id"]);
                if (btnDelInfo.Text == "Add info")
                {

                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();

                    
                    SqlCommand objcmd = new SqlCommand("Insert into tblDelInfo(title,Info,hcol1,pcol1,hcol2,pcol2,hcol3,pcol3) Values('" + txtTitle.Text + "','" + txtDelInfo.Text + "','" + txtHcol1.Text + "','" + txtPcol1.Text + "','" + txtHcol2.Text + "','" + txtPcol2.Text + "','" + txtHcol3.Text + "','" + txtPcol3.Text + "')", objsqlconn);
                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Added')</script>");
                }
                else if (btnDelInfo.Text == "Update info")
                {
                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();

                    
                    SqlCommand objcmd = new SqlCommand("update tblDelInfo set Info='" + txtDelInfo.Text + "',title='" + txtTitle.Text + "',hcol1='" + txtHcol1.Text + "',pcol1='" + txtPcol1.Text + "',hcol2='" + txtHcol2.Text + "',pcol2='" + txtPcol2.Text + "',hcol3='" + txtHcol3.Text + "',pcol3='" + txtPcol3.Text + "'", objsqlconn);
                    objcmd.ExecuteNonQuery();
                    clear();
                    bindGrid();
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully Updated')</script>");
                    btnDelInfo.Text = "Add info";
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void clear()
        {
            txtDelInfo.Text = "";
            txtTitle.Text = "";
           
            txtHcol1.Text = "";
            txtPcol1.Text = "";
            txtHcol2.Text = "";
            txtPcol2.Text = "";
            txtHcol3.Text = "";
            txtPcol3.Text = "";
        }

        protected void GrdDelInfo_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string conn = "";
            conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            string id = e.CommandArgument.ToString();
            SqlConnection objsqlconn = new SqlConnection(conn);
            objsqlconn.Open();

            if (e.CommandName == "select")
            {

                SqlCommand cmdd = new SqlCommand("Select * from tblDelInfo where id='" + id + "'", objsqlconn);
                SqlDataAdapter daa = new SqlDataAdapter(cmdd);
                DataTable dtt = new DataTable();
                daa.Fill(dtt);

                if (dtt.Rows.Count > 0)
                {
                    txtDelInfo.Text = Convert.ToString(dtt.Rows[0][1]);
                    txtTitle.Text = Convert.ToString(dtt.Rows[0][2]);
                    txtHcol1.Text = Convert.ToString(dtt.Rows[0][3]);
                    txtPcol1.Text = Convert.ToString(dtt.Rows[0][4]);
                    txtHcol2.Text = Convert.ToString(dtt.Rows[0][5]);
                    txtPcol2.Text = Convert.ToString(dtt.Rows[0][6]);
                    txtHcol3.Text = Convert.ToString(dtt.Rows[0][7]);
                    txtPcol3.Text = Convert.ToString(dtt.Rows[0][8]);
                    btnDelInfo.Text = "Update info";
                }
            }

        }
    }
}