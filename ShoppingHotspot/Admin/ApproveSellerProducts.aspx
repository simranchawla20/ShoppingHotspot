<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ApproveSellerProducts.aspx.cs" Inherits="ShoppingHotspot.Admin.ApproveSellerProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">Approve Products</h1>
            <p class="fntcolor">Approve Sellers Products here</p>
            <hr>
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdSellerProduct" AllowPaging="true" OnPageIndexChanging="GrdSellerProduct_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id" OnRowCommand="GrdSellerProduct_RowCommand" AllowSorting="True" OnRowDeleting="GrdSellersProduct_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="ID"></asp:BoundField>
                                    <asp:BoundField DataField="UserId" HeaderText="User Id"></asp:BoundField>
                                    <asp:BoundField DataField="SellerName" HeaderText="Seller Name"></asp:BoundField>
                                    <asp:BoundField DataField="mainCat" HeaderText="mainCat"></asp:BoundField>
                                     <asp:BoundField DataField="subCat" HeaderText="subCat"></asp:BoundField>
                                     <asp:BoundField DataField="ProductName" HeaderText="Product Name"></asp:BoundField>
                                     <asp:BoundField DataField="price" HeaderText="price"></asp:BoundField>
                                     <asp:BoundField DataField="qnty" HeaderText="Quantity"></asp:BoundField>
                                     <asp:BoundField DataField="description" HeaderText="description"></asp:BoundField>
                                     <asp:BoundField DataField="size" HeaderText="Size"></asp:BoundField>
                                     <asp:BoundField DataField="pic" HeaderText="pic"></asp:BoundField>
                                     <asp:BoundField DataField="productCode" HeaderText="Product Code"></asp:BoundField>
                                     <asp:BoundField DataField="brand" HeaderText="Brand"></asp:BoundField>
                                     <asp:BoundField DataField="type" HeaderText="Type"></asp:BoundField>
                                     <asp:BoundField DataField="season" HeaderText="Season"></asp:BoundField>
                                     <asp:BoundField DataField="offerPrice" HeaderText="Offer"></asp:BoundField>
                                     <asp:BoundField DataField="delivery" HeaderText="Delivery charges"></asp:BoundField>
                                     <asp:BoundField DataField="promoCode" HeaderText="Promo Code"></asp:BoundField>
                                    <asp:BoundField DataField="UploadBy" HeaderText="Uploaded By"></asp:BoundField>

                                     

                                    <asp:TemplateField HeaderText="ACTION">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="btn_active" runat="server" CommandName="Active" CommandArgument='<%#Eval("ID")%>'>Approve</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ACTION">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_unactive" runat="server" CommandName="UnActive" CommandArgument='<%#Eval("ID")%>'>DisApprove</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ACTION">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_delete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete');" CommandArgument='<%#Eval("ID")%>'>Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer text-center">2021-2022 &copy; ShoppingHotspot brought to you by Simran Chawla </footer>
    </div>
</asp:Content>
