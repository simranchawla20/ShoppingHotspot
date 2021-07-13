<%@ Page Title="" Language="C#" MasterPageFile="~/Seller/SellerMaster.Master" AutoEventWireup="true" CodeBehind="SellerDashboard.aspx.cs" Inherits="ShoppingHotspot.Seller.SellerDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Show All Users</h4>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <a href="http://localhost:54852/Login" target="_blank"
                        class="btn btn-danger pull-right m-l-20 hidden-xs hidden-sm waves-effect waves-light">LogOut

                    </a>
                    <ol class="breadcrumb">
                        <li><a href="SellerDashboard.aspx">Dashboard</a></li>

                    </ol>
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
    </div>
</asp:Content>
