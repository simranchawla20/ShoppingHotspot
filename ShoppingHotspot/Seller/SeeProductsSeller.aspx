<%@ Page Title="" Language="C#" MasterPageFile="~/Seller/SellerMaster.Master" AutoEventWireup="true" CodeBehind="SeeProductsSeller.aspx.cs" Inherits="ShoppingHotspot.Seller.SeeProductsSeller" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">Your Products</h1>
            <p class="fntcolor">Check the Products uploaded by you till now.</p>
            <hr>
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdProducts" AllowPaging="true" OnPageIndexChanging="GrdProducts_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="ID"></asp:BoundField>
                                    <asp:BoundField DataField="mainCat" HeaderText="Main Category"></asp:BoundField>
                                    <asp:BoundField DataField="subCat" HeaderText="Sub Category"></asp:BoundField>
                                    <asp:BoundField DataField="ProductName" HeaderText="Produc tName"></asp:BoundField>
                                    <asp:BoundField DataField="price" HeaderText="Price"></asp:BoundField>
                                     <asp:BoundField DataField="qnty" HeaderText="Quantity"></asp:BoundField>
                                     <asp:BoundField DataField="description" HeaderText="Description"></asp:BoundField>
                                     <asp:BoundField DataField="size" HeaderText="Size"></asp:BoundField>
                                     <asp:BoundField DataField="pic" HeaderText="Pic"></asp:BoundField>
                                     <asp:BoundField DataField="productCode" HeaderText="Product Code"></asp:BoundField>
                                     <asp:BoundField DataField="brand" HeaderText="Brand"></asp:BoundField>
                                    <asp:BoundField DataField="type" HeaderText="Type"></asp:BoundField>
                                    <asp:BoundField DataField="season" HeaderText="Season"></asp:BoundField>
                                    <asp:BoundField DataField="offerPrice" HeaderText="Offer Price"></asp:BoundField>
                                    <asp:BoundField DataField="delivery" HeaderText="Delivery"></asp:BoundField>
                                    <asp:BoundField DataField="promoCode" HeaderText="Promo Code"></asp:BoundField>
                                    <asp:BoundField DataField="status" HeaderText="Status"></asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</asp:Content>
