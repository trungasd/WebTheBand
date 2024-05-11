using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebTheBand.loginForm
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string cn = "Data Source=localhost;Initial Catalog=TheBandShop;Integrated Security=True";
            using (SqlConnection cnt = new SqlConnection(cn))
            {
                try
                {
                    cnt.Open();

                    string phone = txtphone.Text;
                    string pass = txtpass.Text;

                    if (string.IsNullOrEmpty(phone) || string.IsNullOrEmpty(pass))
                    {
                        lblError.Text = "Vui lòng điền thông tin để đăng nhập";
                    }
                    else
                    {
                        // Kiểm tra thông tin đăng nhập cho người dùng
                        string query = "SELECT * FROM DangKy WHERE Phone = @phone AND Password = @pass";
                        using (SqlCommand cmd = new SqlCommand(query, cnt))
                        {
                            cmd.Parameters.AddWithValue("@phone", phone);
                            cmd.Parameters.AddWithValue("@pass", pass);
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.HasRows)
                                {
                                    // Đăng nhập thành công cho người dùng
                                    reader.Read();
                                    string userName = reader["Name"].ToString();
                                    Session["IsLoggedIn"] = true;
                                    Session["UserName"] = userName;

                                    Response.Redirect("~/Default.aspx");
                                }
                                else
                                {
                                    // Đăng nhập thất bại
                                    lblError.Text = "Mật khẩu hoặc số điện thoại không đúng";
                                }
                            }
                        }

                        // Kiểm tra thông tin đăng nhập cho admin
                        string admin = "admin";
                        string passadmin = txtpass.Text;
                        string queryAdmin = "SELECT * FROM accountAdmin WHERE admin = @admin AND pass = @passadmin";
                        using (SqlCommand cmdAdmin = new SqlCommand(queryAdmin, cnt))
                        {
                            cmdAdmin.Parameters.AddWithValue("@admin", admin);
                            cmdAdmin.Parameters.AddWithValue("@passadmin", passadmin);
                            using (SqlDataReader readerAdmin = cmdAdmin.ExecuteReader())
                            {
                                if (readerAdmin.HasRows)
                                {
                                    // Đăng nhập thành công cho admin
                                    Session["IsAdmin"] = true;
                                    Response.Redirect("~/adminForm/admin.aspx");
                                }
                            }
                        }
                    }
                }
                catch (SqlException ex)
                {
                    lblError.Text = "Lỗi SQL: " + ex.Message;
                }
            }
        }
    }
}
