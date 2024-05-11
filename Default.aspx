<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebTheBand.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link  href="~/main/style.css" rel="stylesheet" runat="server"/>
    <link  href="~/main/responsive.css" rel="stylesheet" runat="server"/>
    <link  href="~/main/font_icon/themify-icons/themify-icons.css" rel="stylesheet" runat="server"/>
</head>
<body>
    <form id="form1" runat="server">
        <div id="main">

            <%--header--%>
            <h1 class="nameshop">THE BAND SHOP</h1>
                <div id="mobile-menu" class="mobile-menu-btn">
                    <i class="ti-menu"></i>
                </div>
            <div id="header">
                 <div class="menu-container">
                     <ul id="nav">
                         <li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#main">Trang chủ</asp:HyperLink></li>
                         <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="#organ">Đàn Organ</asp:HyperLink></li>
                         <li><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="#piano">Đàn Piano</asp:HyperLink></li>
                         <li><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="#body">Đàn Guitar  <i class="nav-ti-down ti-angle-down"></i></asp:HyperLink>
                            <ul class="subnav">
                                 <li><asp:HyperLink ID="HyperLink7" runat="server" >Classic Guitar</asp:HyperLink></li>
                                 <li><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="#guitar_acoustic">Acoustic Guitar</asp:HyperLink></li>
                             </ul>
                         </li>
            
                         <li class="search-btn">
                             <i class="ti-search"></i>
                         </li>

                     </ul>
                 </div>



                <div class="header_user">
                    <li><asp:HyperLink ID="btncart" runat="server" Visible="false" class="header__cart-icon ti-shopping-cart"></asp:HyperLink>
                    </li>
                    <li><a href="" class="link"><asp:HyperLink ID="accountSection" runat="server" Text='<%# Session["UserName"] %>' Visible="false" class="header_user-name"></asp:HyperLink>
                        <ul class="subnav_user">
                                <li><asp:Button ID="btninfo" runat="server" class="user_info" Visible="false" Text="Thông tin"></asp:Button></li>
                                <li><asp:Button ID="btnlogout" runat="server" Text="Đăng xuất" OnClick="btnlogout_Click" Visible="false" class="user_logout" /></li>
                            </ul>
                        </a></li>
                     <li><asp:Button ID="btnlogin" PostBackUrl="~/loginForm/login.aspx" runat="server" Text="Đăng nhập" Visible="true" class="header_user-login"/></li>
                     <li><asp:Button ID="btnregiter" PostBackUrl="~/regiterFrom/regiter.aspx" runat="server" Text="Đăng ký" Visible="true" class="header_user-regiter"/></li>
                       
                </div>


                       
            </div>

            <asp:Panel ID="slider" runat="server">
                
                <div class="text-content">
                    <h2 class="text-heading">The Band</h2>
                    <div class="text-description">Xin chào quý khách</div>
                </div>
            </asp:Panel>


            <%-- body --%>
            <div id="body">

                <div class="body_guitar">
                    <h2 id="" class="body_heading-guiclassic"> Các sản phẩm</h2>
                            <div class="grid__column-12">
                                <asp:Repeater runat="server" ID="ProductRepeater">
                                    <ItemTemplate >
                                            <div class="grid__column-2">
                                                <div class="home-product-item">
                                                    <img src='<%# Eval("image") %>' alt='<%# Eval("productname") %>' class="home-product-item__img" />
                                                    <h4 class="home-product-item__name"><%# Eval("productname") %></h4>
                                                    <span class="home-product-item__price"><%# Eval("price") %></span>
                                                    <asp:Panel runat="server" class="home-product-item__action">
                                                        <span class="home-product-item__like">  
                                                            <i class="ti-heart"></i>
                                                        </span>
                                                        <div class="home-product-item__rating">
                                                            <i class="ti-star"></i>
                                                            <i class="ti-star"></i>
                                                            <i class="ti-star"></i>
                                                            <i class="ti-star"></i>
                                                            <i class="ti-star"></i>
                                                        </div>
                                                    </asp:Panel>
                                                    <div class="home-product-item__origin">
                                                        <span class="home-product-item__brand">The Band</span>
                                                        <span class="home-product-item__origin-name"><%# Eval("origin") %></span>
                                                     </div>
                                                    <div class="home-product-item__favourite">
                                                        <i class="home-product-item__favourite-icon ti-check">Yêu thích</i>
                                                    </div>

                                                  </div>
                                              </div>
                                        </ItemTemplate>
                                </asp:Repeater>
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
                        <ul class="footer-list">
                            
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

       </div>


        <%-- responsive mobile menu --%>
        <script type="text/javascript">
            document.addEventListener("DOMContentLoaded", function () {
                // Lấy tham chiếu đến các phần tử DOM cần sử dụng
                var mobileMenuBtn = document.getElementById("mobile-menu");
                var nav = document.getElementById("nav");

                // Thêm sự kiện click cho mobile-menu-btn
                mobileMenuBtn.addEventListener("click", function () {
                    // Kiểm tra nếu menu-container đang hiển thị, thì ẩn đi, ngược lại hiển thị
                    if (nav.style.display === "block") {
                        nav.style.display = "none";
                    } else {
                        nav.style.display = "block";
                    }
                });
            });
        </script>

    </form>
</body>
</html>
