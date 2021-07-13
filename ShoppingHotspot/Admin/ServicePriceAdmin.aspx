<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ServicePriceAdmin.aspx.cs" Inherits="ShoppingHotspot.Admin.ServicePriceAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">Service Prices</h1>
            <p class="fntcolor">Add price to services of each type.</p>
            <hr>
            <div class="form-group">
                <table>
                     <tr>
                     <td>
                     <asp:Label ID="txtServiceType" CssClass="fntcolor" runat="server" Text="Service Type"></asp:Label>
             
                  <asp:DropDownList ID="ddlServiceType" runat="server" CssClass="form-control">
                 </asp:DropDownList>
                         
            <asp:RequiredFieldValidator ID="rfvmainCat" runat="server"
                ErrorMessage="Category is required" ControlToValidate="ddlServiceType" ForeColor="Red" ValidationGroup="ServiceType">
            </asp:RequiredFieldValidator>
                         </td>
                      </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblServiceName" CssClass="fntcolor" runat="server" Text="Service Name"></asp:Label>
                            <asp:TextBox ID="txtServiceName" runat="server" CssClass="form-control" placeholder="Enter Service Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCategory" runat="server"
                                ErrorMessage ="Service Name to be added required" ControlToValidate="txtServiceName" ValidationGroup="User" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblServicePrice" CssClass="fntcolor" runat="server" Text="Service Price"></asp:Label>
                            <asp:TextBox ID="txtServicePrice" runat="server" CssClass="form-control" placeholder="Enter Service Price"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvServicePrice" runat="server"
                                ErrorMessage ="Service Price to be added required" ControlToValidate="txtServicePrice" ValidationGroup="User" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:Button ID="btnAdd" runat="server" Text="Add" ValidationGroup="User" CssClass="btn btn-primary" OnClick="btnAdd_Click" />


            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdServicePrice" AllowPaging="true" OnPageIndexChanging="GrdServicePrice_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id" OnRowCommand="GrdServicePrice_RowCommand" AllowSorting="True" OnRowDeleting="GrdServicePrice_RowDeleting" >
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="ID"></asp:BoundField>
                                    <asp:BoundField DataField="title" HeaderText="Service Type"></asp:BoundField>
                                    <asp:BoundField DataField="ServiceName" HeaderText="Service Name"></asp:BoundField>
                                    <asp:BoundField DataField="Price" HeaderText="Price"></asp:BoundField>
                                    <asp:BoundField DataField="Status" HeaderText="Status"></asp:BoundField>
                                    <asp:BoundField DataField="CreatedOn" HeaderText="CreatedOn"></asp:BoundField>
                                    <asp:BoundField DataField="ModifiedOn" HeaderText="ModifiedOn"></asp:BoundField>


                                    
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
