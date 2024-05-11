<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebTheBand.loginForm.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link  href="~/loginForm/login.css" rel="stylesheet" runat="server"/>
    <link  href="~/loginForm/responsiveLogin.css" rel="stylesheet" runat="server"/>
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
                    <asp:HyperLink ID="HyperLink2" runat="server" class="header_user-regiter" NavigateUrl="~/regiterFrom/regiter.aspx" Visible="true">Đăng ký</asp:HyperLink>
                </ul>
            </div>
        <%-- body --%>
        <div class="container">
            <div class="auth">
                <div class="form_login">
                    <h2>Đăng nhập</h2>
                     <div class="auth_form">
                         <asp:TextBox ID="txtphone" runat="server" CssClass="input" placeholder="Nhập số điện thoại"></asp:TextBox><br />
                         <asp:TextBox ID="txtpass" runat="server" CssClass="input" placeholder="Mật khẩu" TextMode="Password"></asp:TextBox><br />
                         <asp:Button ID="btnlogin" runat="server" CssClass="btnlogin" Text="Đăng nhập" OnClick="btnlogin_Click"/>
                         <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
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
                        <ul class="footer-logo" >
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
