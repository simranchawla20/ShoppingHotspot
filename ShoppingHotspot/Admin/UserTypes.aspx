<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UserTypes.aspx.cs" Inherits="ShoppingHotspot.Admin.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">User Type</h1>
            <p class="fntcolor">Add New UserType Here</p>
            <hr>
            <div class="form-group">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblUserType" CssClass="fntcolor" runat="server" Text="UserType"></asp:Label>
                            <asp:TextBox ID="txtUserType" runat="server" CssClass="form-control" placeholder="Enter UserType"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUserType" runat="server"
                                ErrorMessage=" UserType to be added required" ControlToValidate="txtUserType" ForeColor="Red" ValidationGroup="userType">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    
                </table>
            </div>
            <asp:Button ID="btnAddUserType" runat="server" Text="Add UserType" CssClass="btn btn-primary" OnClick="btnAddUserType_Click" ValidationGroup="userType" />


            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdUserType" AllowPaging="true" OnPageIndexChanging="GrdUserType_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id" OnRowCommand="GrdUserType_RowCommand" AllowSorting="True" OnRowDeleting="GrdUserType_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="ID"></asp:BoundField>
                                    <asp:BoundField DataField="UserType" HeaderText="User Type"></asp:BoundField>
                                

                                    
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
