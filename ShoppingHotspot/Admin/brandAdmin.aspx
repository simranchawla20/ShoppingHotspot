<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="brandAdmin.aspx.cs" Inherits="ShoppingHotspot.Admin.ProductAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">Brands</h1>
            <p class="fntcolor">Add New Brand Here</p>
            <hr>
            <div class="form-group">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblBrand" CssClass="fntcolor" runat="server" Text="Brand Name"></asp:Label>
                            <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control" placeholder="Enter Brand"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvBrand" runat="server"
                                ErrorMessage=" Brand to be added required" ControlToValidate="txtBrand" ForeColor="Red" ValidationGroup="Brand">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:Button ID="btnAddBrand" runat="server" Text="Add Brand" CssClass="btn btn-primary" OnClick="btnAddBrand_Click" ValidationGroup="Brand" />


            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdBrand" AllowPaging="true" OnPageIndexChanging="GrdBrand_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id" OnRowCommand="GrdBrand_RowCommand" AllowSorting="True" OnRowDeleting="GrdBrand_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="ID"></asp:BoundField>
                                    <asp:BoundField DataField="BrandName" HeaderText="Brand Name"></asp:BoundField>

                                    <asp:TemplateField HeaderText="ACTION">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_update" runat="server" CommandName="select" CommandArgument='<%#Eval("ID")%>'>Update</asp:LinkButton>
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
        <footer class="footer text-center"> 2021-2022 &copy; ShoppingHotspot brought to you by Simran Chawla </footer>
    </div>

</asp:Content>
