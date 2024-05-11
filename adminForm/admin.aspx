<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="WebTheBand.adminForm.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/adminForm/admin.css" rel="stylesheet" runat="server"/>
    <link href="~/adminForm/responsiveAdmin.css" rel="stylesheet" runat="server"/>
</head>
<body>
    <form id="form1" runat="server">
         <%-- header --%>
            <h1 class="nameshop">THE BAND SHOP</h1>
            <div id="header">
                <ul id="nav">
                    <li><asp:HyperLink ID="btnmain" runat="server" NavigateUrl="~/Default.aspx" >Trang chủ</asp:HyperLink></li>
                </ul>
                <ul class="header_user">
                    <asp:HyperLink ID="UserAdmin" runat="server" class="header_user-regiter" NavigateUrl="~/regiterFrom/regiter.aspx" Visible="true"></asp:HyperLink>
                </ul>
            </div>
        <%-- body --%>
         <div class="container">
            <div class="auth">
                <div class="form_admin">
                    <h2>Admin</h2>
                     <div class="auth_form">
                         <div class="auth_form-input">
                             <asp:TextBox ID="txtid" runat="server" CssClass="input" placeholder="Mã sản phẩm"></asp:TextBox><br />
                             <asp:TextBox ID="txtnameproduct" runat="server" CssClass="input" placeholder="Tên sản phẩm"></asp:TextBox><br />
                             <asp:TextBox ID="txtprice" runat="server" CssClass="input" placeholder="Giá tiền"></asp:TextBox><br />
                             <asp:TextBox ID="txtorigin" runat="server" CssClass="input" placeholder="Xuất sứ"></asp:TextBox><br />
                             <asp:TextBox ID="txtimage" runat="server" CssClass="input" placeholder="Hình ảnh"></asp:TextBox><br />
                             <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                         </div>
                         <div class="auth_form-btn">
                             <asp:Button ID="btnadd" runat="server" CssClass="btnadd" Text="Thêm" OnClick="btnadd_Click"/>
                             <asp:Button ID="btnedit" runat="server" CssClass="btnadd" Text="Sửa" OnClick="btnedit_Click"/>
                             <asp:Button ID="btndelete" runat="server" CssClass="btnadd" Text="Xóa" OnClick="btndelete_Click"/>
                         </div>
                     </div>
                </div>
            </div>
        </div>

        <%-- footer --%>
        <div class="footer">
            <div class="grid wide">
                <div class="footer__content">
                    <div class="footer-grid__column-12">
                        <h3 class="footer__heading">Chăm sóc khách hàng</h3>
                        <ul class="footer-list">
                            <li class="footer-item">
                                <a href="#">Trung tâm trợ giúp</a>
                            </li>
                            <li class="footer-item">
                                <a href="#">TheBand-Shop</a>
                            </li>
                            <li class="footer-item">
                                <a href="#">Hướng dẫn mua hàng</a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer-grid__column-12">
                        <h3 class="footer__heading">Giới thiệu</h3>
                        <ul class="footer-list">
                            <li class="footer-item">
                                <a href="#">Giới thiệu</a>
                            </li>
                            <li class="footer-item">
                                <a href="#">Tuyển dụng</a>
                            </li>
                            <li class="footer-item">
                                <a href="#">Điều khoản</a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer-grid__column-12">
                        <h3 class="footer__heading">Theo dõi chúng tôi</h3>
                        <ul class="footer-list">
                            <li class="footer-item">
                                <a href="#"><i class="footer-item__icon-link ti-facebook"></i>
                                    Facebook
                                </a>
                            </li>
                            <li class="footer-item">
                                <a href="#"><i class="footer-item__icon-link ti-instagram"></i>
                                    Instagram
                                </a>
                            </li>
                            <li class="footer-item">
                                <a href="#"><i class="footer-item__icon-link ti-youtube"></i>
                                    Youtube
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer-grid__column-12">
                        <h3 class="footer__heading">Phương thức thanh toán</h3>
                        <ul class="footer-logo">
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer__license">
                <div class="grid wide">
                    <p class="footer__text">
                        © 2023 Bản quyền thuộc về cá nhân Huỳnh Trung - Website được tạo ra vì mục đích học tập, không vì mục đích thương mại
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
