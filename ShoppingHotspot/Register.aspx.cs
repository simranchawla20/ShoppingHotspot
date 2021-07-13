using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingHotspot
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                bindUserTypeDDL();
            }
            
        }

        public void bindUserTypeDDL()
        {
            string connetionString;


            connetionString = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
            SqlConnection con = new SqlConnection(connetionString);

            string com = "select id,UserType from tblUserType";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlUserType.DataSource = dt;
            ddlUserType.DataBind();
            ddlUserType.DataTextField = "UserType";
            ddlUserType.DataValueField = "id";
            ddlUserType.DataBind();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string conn = "";
                conn = @"Data Source=DESKTOP-536RKL2;Initial Catalog=DBshoppingHotspot;Integrated Security=True";
                if (btnSubmit.Text == "Register")
                {

                    SqlConnection objsqlconn = new SqlConnection(conn);
                    objsqlconn.Open();
                    SqlCommand cmdd = new SqlCommand("Select * from tblUsers where Email='" + TxtEmail.Text + "'", objsqlconn);
                    SqlDataAdapter da = new SqlDataAdapter(cmdd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('This Email Id is already Exist!')</script>");
                    }
                    else
                    {
                        SqlCommand objcmd = new SqlCommand("Insert into tblUsers(FirstName,LastName,Email,Password,Phone,Address,CreatedOn,ModifiedOn,status,Gender,userTypeId) Values('" + txtFirstname.Text + "','" + TxtLastname.Text + "','" + TxtEmail.Text + "','" + TxtPassword.Text + "','" + TxtPhone.Text + "','" + TxtAddress.Text + "','" + DateTime.Now + "','" + DateTime.Now + "','" + false + "','" + txtGender.Text + "','" + ddlUserType.SelectedValue + "')", objsqlconn);
                        objcmd.ExecuteNonQuery();
                        clear();
                        //lblMessage.Text = "successfully registered";
                        //lblMessage.Visible = true;
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('successfully registered')</script>");

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
            txtFirstname.Text = "";
            TxtLastname.Text = "";
            TxtEmail.Text = "";
            TxtPassword.Text = "";
            TxtConfPassword.Text = "";
            TxtPhone.Text = "";
            TxtAddress.Text = "";
            txtGender.ClearSelection();
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}