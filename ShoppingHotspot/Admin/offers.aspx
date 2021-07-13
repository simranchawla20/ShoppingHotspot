<%@ Page Title="Shopping Hotspot-Admin Offers" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="offers.aspx.cs" Inherits="ShoppingHotspot.Admin.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">OFFER</h1>
            <p class="fntcolor">Add New Offer Here</p>
            <hr>
            <div class="form-group">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblOffer" CssClass="fntcolor" runat="server" Text="Offer Name"></asp:Label>
                            <asp:TextBox ID="txtOffer" runat="server" CssClass="form-control" placeholder="Enter Offer"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvOffer" runat="server"
                                ErrorMessage=" Offer to be added required" ControlToValidate="txtOffer" ForeColor="Red" ValidationGroup="offer">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblExpiresOn" CssClass="fntcolor" runat="server" Text="Expiry Date"></asp:Label>
                            <%-- <asp:TextBox ID="txtExpiresOn" runat="server" CssClass="form-control" placeholder="Enter Expiry Date"></asp:TextBox>--%>
                            <asp:TextBox ID="txtExpiresOn" runat="server" TextMode="DateTimeLocal" CssClass="form-control" placeholder="Enter Expiry Date 12-12-2016"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvExpiry" runat="server"
                                ErrorMessage=" When to expire offer is required" ControlToValidate="txtExpiresOn" ForeColor="Red" ValidationGroup="offer">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:Button ID="btnAddOffer" runat="server" Text="Add Offer" CssClass="btn btn-primary" OnClick="btnAddOffer_Click" ValidationGroup="offer" />


            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdOffer" AllowPaging="true" OnPageIndexChanging="GrdOffer_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id" OnRowCommand="GrdOffer_RowCommand" AllowSorting="True" OnRowDeleting="GrdOffer_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="ID"></asp:BoundField>
                                    <asp:BoundField DataField="offerName" HeaderText="Offer Name"></asp:BoundField>
                                    <asp:BoundField DataField="createdOn" HeaderText="Created date"></asp:BoundField>
                                    <asp:BoundField DataField="expiresOn" HeaderText="Expiry date"></asp:BoundField>
                                    <asp:BoundField DataField="status" HeaderText="status"></asp:BoundField>

                                    <asp:TemplateField HeaderText="ACTION">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="btn_active" runat="server" CommandName="Active" CommandArgument='<%#Eval("ID")%>'>Enable</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ACTION">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_unactive" runat="server" CommandName="UnActive" CommandArgument='<%#Eval("ID")%>'>Disable</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
