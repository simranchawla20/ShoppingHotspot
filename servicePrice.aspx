<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="servicePrice.aspx.cs" Inherits="ShoppingHotspot.servicePrice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Services Under '<asp:Label ID="lblSeriveTypeByQueryString" CssClass="fntcolor" runat="server"></asp:Label>'</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Services/Prices</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdServicePrice" AllowPaging="true" OnPageIndexChanging="GrdServicePrice_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10"  AllowSorting="True" >
                                <Columns>
                                    <asp:BoundField DataField="ServiceName" HeaderText="Service Name"></asp:BoundField>
                                    <asp:BoundField DataField="Price" HeaderText="Price"></asp:BoundField>
                                   
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
