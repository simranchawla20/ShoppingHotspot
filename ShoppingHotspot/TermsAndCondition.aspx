<%@ Page Title="Shopping Hotspot-TermsAndCondition" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TermsAndCondition.aspx.cs" Inherits="ShoppingHotspot.TermsAndCondition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Terms And Conditions</h2>
                    <%--<ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">ABOUT US</li>
                    </ul>--%>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    <!-- Start About Page  -->
    <div class="about-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <h2 class="noo-sh-title"><span><label id="title" runat="server"></label></span></h2>
                    <p id="cond" runat="server"></p>
                      
                </div>
                <div class="col-lg-6">
                    <div class="banner-frame"> <img class="img-thumbnail img-fluid" src="Content/images/about-img.jpg" alt="" />
                    </div>
                </div>
            </div>
            <div class="row my-5">
                <div class="col-sm-6 col-lg-4">
                    <div class="service-block-inner">
                        <h3 id="Hcol1" runat="server"></h3>
                        <p id="Pcol1" runat="server"></p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="service-block-inner">
                        <h3 id="Hcol2" runat="server"></h3>
                        <p id="Pcol2" runat="server"></p>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="service-block-inner">
                        <h3 id="Hcol3" runat="server"></h3>
                        <p id="Pcol3" runat="server"></p>
                    </div>
                </div>
            </div>
           
        </div>
    </div>
    <!-- End About Page -->
</asp:Content>
