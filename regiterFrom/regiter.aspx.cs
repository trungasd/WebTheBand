using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebTheBand.regiterFrom
{
    public partial class regiter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnregiter_Click(object sender, EventArgs e)
        {
            String cns = "Data Source=localhost;Initial Catalog=TheBandShop;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(cns))
            {
                connection.Open();

                string name = txtname.Text;
                string pass = txtpass.Text;
                string checkpass = txtcheckpass.Text;
                string phone = txtphone.Text;

                if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(pass) || string.IsNullOrEmpty(checkpass))
                {
                    lblError.Text = "Vui lòng điền đầy đủ thông tin đăng ký.";
                }
                else if (pass != checkpass  )
                {
                    lblError.Text = "Mật khẩu và mật khẩu xác thực không giống. Vui lòng kiểm tra lại.";
                }
                else
                {
                    lblError.Text = "Đăng ký thành công";
                    string insertQuery = "INSERT INTO DangKy (Name, Password, Checkpass, Phone) VALUES (@Name, @Password, @Checkpass, @Phone)";

                    using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Password", pass);
                        cmd.Parameters.AddWithValue("@Checkpass", checkpass);
                        cmd.Parameters.AddWithValue("@Phone", phone);

                        cmd.ExecuteNonQuery();

                        Session["IsLoggedIn"] = true;
                        Session["UserName"] = txtname.Text;
                        Response.Redirect("~/Default.aspx");
                    }
                }
            }
        }

        protected void btnmain_Click(object sender, EventArgs e)
        {
            
        }
    }
}