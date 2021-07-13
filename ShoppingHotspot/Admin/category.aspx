<%@ Page Title="Shopping Hotspot-Admin Categories" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="ShoppingHotspot.Admin.category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">Category</h1>
            <p class="fntcolor">Add Category Here</p>
            <hr>
            <div class="form-group">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblCategory" CssClass="fntcolor" runat="server" Text="CategoryName"></asp:Label>
                            <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" placeholder="Enter Category"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCategory" runat="server"
                                ErrorMessage =" Category to be added required" ControlToValidate="txtCategory" ValidationGroup="User" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                     <tr>
                     <td>
                     <asp:Label ID="txtPos" CssClass="fntcolor" runat="server" Text="Position"></asp:Label>
           
                         
                  <asp:DropDownList ID="ddlPosition" runat="server">
                 </asp:DropDownList>
                         
            <asp:RequiredFieldValidator ID="rfvPosition" runat="server"
                ErrorMessage="position is required" ControlToValidate="ddlPosition" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                         </td>
                      </tr>
                </table>
            </div>
            <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" ValidationGroup="User" CssClass="btn btn-primary" OnClick="btnAddCategory_Click" />


            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdCategory" AllowPaging="true" OnPageIndexChanging="GrdCategory_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id" OnRowCommand="GrdCategory_RowCommand" AllowSorting="True" >
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="ID"></asp:BoundField>
                                    <asp:BoundField DataField="categoryName" HeaderText="category Name"></asp:BoundField>
                                    <asp:BoundField DataField="CreatedOn" HeaderText="Created date"></asp:BoundField>
                                    <asp:BoundField DataField="modifiedOn" HeaderText="Modified date"></asp:BoundField>
                                    <asp:BoundField DataField="status" HeaderText="status"></asp:BoundField>
                                    <asp:BoundField DataField="pos" HeaderText="position"></asp:BoundField>


                                    
                                    <asp:TemplateField HeaderText="ACTION">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_update" runat="server" CommandName="select" CommandArgument='<%#Eval("id")%>'>Update</asp:LinkButton>
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
