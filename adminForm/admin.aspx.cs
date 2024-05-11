using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebTheBand.adminForm
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        protected void btnadd_Click(object sender, EventArgs e)
        {
            String cns = "Data Source=localhost;Initial Catalog=TheBandShop;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(cns))
            {
                connection.Open();

                string productname = txtnameproduct.Text;
                string productid = txtid.Text;
                string price = txtprice.Text;
                string origin = txtorigin.Text;
                string image = txtimage.Text;

                if (string.IsNullOrEmpty(productname) || string.IsNullOrEmpty(productid) || string.IsNullOrEmpty(price) || string.IsNullOrEmpty(origin))
                {
                    lblError.Text = "Vui lòng điền đầy đủ thông tin.";
                }
                else
                {
                  
                    lblError.Text = "Đã thêm sản phẩm thành công";
                    string insertQuery = "INSERT INTO Sanpham (productname, price, origin, productid, image) VALUES (@productname, @price, @origin, @productid, @image)";

                    using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
                    {
                        cmd.Parameters.AddWithValue("@productname", productname);
                        cmd.Parameters.AddWithValue("@price", price);
                        cmd.Parameters.AddWithValue("@origin", origin);
                        cmd.Parameters.AddWithValue("@productid", productid);
                        cmd.Parameters.AddWithValue("@image", image);

                        cmd.ExecuteNonQuery();
                    }
                   
                }
            }
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            string cns = "Data Source=localhost;Initial Catalog=TheBandShop;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(cns))
            {
                connection.Open();

                string productname = txtnameproduct.Text;
                string productid = txtid.Text;
                string price = txtprice.Text;
                string origin = txtorigin.Text;
                string image = txtimage.Text; // Đường dẫn hình ảnh mới

                if (string.IsNullOrEmpty(productname) || string.IsNullOrEmpty(productid) || string.IsNullOrEmpty(price) || string.IsNullOrEmpty(origin))
                {
                    lblError.Text = "Vui lòng điền đầy đủ thông tin.";
                }
                else
                {
                    // Kiểm tra xem sản phẩm có tồn tại trong cơ sở dữ liệu không (dựa trên productid)
                    string checkProductQuery = "SELECT COUNT(*) FROM Sanpham WHERE productid = @productid";
                    using (SqlCommand checkCmd = new SqlCommand(checkProductQuery, connection))
                    {
                        checkCmd.Parameters.AddWithValue("@productid", productid);
                        int productCount = (int)checkCmd.ExecuteScalar();

                        if (productCount > 0)
                        {
                            // Sản phẩm tồn tại, tiến hành cập nhật thông tin
                            lblError.Text = "Đã sửa sản phẩm thành công";

                            string updateQuery = "UPDATE Sanpham SET productname = @productname, price = @price, origin = @origin, image = @image WHERE productid = @productid";

                            using (SqlCommand cmd = new SqlCommand(updateQuery, connection))
                            {
                                cmd.Parameters.AddWithValue("@productname", productname);
                                cmd.Parameters.AddWithValue("@price", price);
                                cmd.Parameters.AddWithValue("@origin", origin);
                                cmd.Parameters.AddWithValue("@image", image);
                                cmd.Parameters.AddWithValue("@productid", productid);

                                cmd.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            lblError.Text = "Sản phẩm không tồn tại.";
                        }
                    }
                }
            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            string cns = "Data Source=localhost;Initial Catalog=TheBandShop;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(cns))
            {
                connection.Open();

                string productid = txtid.Text;

                if (string.IsNullOrEmpty(productid))
                {
                    lblError.Text = "Vui lòng nhập mã sản phẩm để xóa.";
                }
                else
                {
                    // Kiểm tra xem sản phẩm có tồn tại trong cơ sở dữ liệu không (dựa trên productid)
                    string checkProductQuery = "SELECT COUNT(*) FROM Sanpham WHERE productid = @productid";
                    using (SqlCommand checkCmd = new SqlCommand(checkProductQuery, connection))
                    {
                        checkCmd.Parameters.AddWithValue("@productid", productid);
                        int productCount = (int)checkCmd.ExecuteScalar();

                        if (productCount > 0)
                        {
                            // Sản phẩm tồn tại, tiến hành xóa sản phẩm
                            lblError.Text = "Đã xóa sản phẩm thành công";

                            string deleteQuery = "DELETE FROM Sanpham WHERE productid = @productid";

                            using (SqlCommand cmd = new SqlCommand(deleteQuery, connection))
                            {
                                cmd.Parameters.AddWithValue("@productid", productid);

                                cmd.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            lblError.Text = "Sản phẩm không tồn tại.";
                        }
                    }
                }
            }
        }

    }
}