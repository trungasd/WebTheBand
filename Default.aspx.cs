using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI; 
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebTheBand
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetData();
                CheckLoggedInStatus();
            }
        }
        private void CheckLoggedInStatus()
        {
            if (Session["IsLoggedIn"] != null && (bool)Session["IsLoggedIn"])
            {
                // Người dùng đã đăng nhập, ẩn nút "Đăng nhập" và "Đăng ký"
                btnlogin.Visible = false; // Ẩn nút "Đăng nhập"
                btnregiter.Visible = false; // Ẩn nút "Đăng ký"
                btnlogout.Visible = true; // Hiện nút "Đăng xuất"
                btninfo.Visible = true;
                btncart.Visible = true;
                accountSection.Visible = true;

                if (Session["UserName"] != null)
                {
                    string userName = Session["UserName"].ToString();
                    accountSection.Text = " " + userName;
                }
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            // Xóa thông tin đăng nhập khỏi Session
            Session["IsLoggedIn"] = false;
            Session["Username"] = null;

            // Hiển thị lại nút "Đăng nhập" và "Đăng ký"
            btnlogin.Visible = true;
            btnregiter.Visible = true;

            // Ẩn nút "Logout" và HyperLink1
            btninfo.Visible = false;
            btnlogout.Visible = false;
            btncart.Visible = false;
            accountSection.Visible = false;

            // Chuyển hướng người dùng đến trang mặc định hoặc trang đăng nhập
            Response.Redirect("Default.aspx");
        }





        private void GetData()
        {
            String cns = "Data Source=localhost;Initial Catalog=TheBandShop;Integrated Security=True";
            SqlConnection cn = new SqlConnection(cns);
            try
            {
                cn.Open();
                String cmds = "SELECT * FROM Sanpham";
                SqlCommand cmd = new SqlCommand(cmds, cn);
                cmd.CommandType = System.Data.CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                if(dt.Rows.Count > 0)
                {
                    ProductRepeater.DataSource = dt;
                    ProductRepeater.DataBind();
                }

                cn.Close();
            }
            catch (Exception) { }
        }

    }
}