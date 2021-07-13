<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="serviceAdmin.aspx.cs" Inherits="ShoppingHotspot.Admin.serviceAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">Service</h1>
            <p class="fntcolor">Add New Service Here</p>
            <hr>
            <div class="form-group">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblService" CssClass="fntcolor" runat="server" Text="Service Name(title)"></asp:Label>
                            <asp:TextBox ID="txtService" runat="server" CssClass="form-control" placeholder="Enter Service"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvService" runat="server"
                                ErrorMessage=" Service to be added required" ControlToValidate="txtService" ForeColor="Red" ValidationGroup="Service">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblDescription" CssClass="fntcolor" runat="server" Text="Description"></asp:Label>
                          
                            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Enter Description"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDescription" runat="server"
                                ErrorMessage=" Description is required" ControlToValidate="txtDescription" ForeColor="Red" ValidationGroup="Service">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:Button ID="btnAddService" runat="server" Text="Add Service" CssClass="btn btn-primary" OnClick="btnAddService_Click" ValidationGroup="Service" />


            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdService" AllowPaging="true" runat="server" OnPageIndexChanging="GrdService_PageIndexChanging" class="table" AutoGenerateColumns="false" PageSize="10" DataKeyNames="Id" OnRowCommand="GrdService_RowCommand" AllowSorting="True" >
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="ID"></asp:BoundField>
                                    <asp:BoundField DataField="title" HeaderText="Service Name"></asp:BoundField>
                                    <asp:BoundField DataField="description" HeaderText="Description"></asp:BoundField>
                                     <asp:BoundField DataField="createdOn" HeaderText="Created date"></asp:BoundField>
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
                                    <%--<asp:TemplateField HeaderText="ACTION">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_delete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete');" CommandArgument='<%#Eval("ID")%>'>Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>

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
