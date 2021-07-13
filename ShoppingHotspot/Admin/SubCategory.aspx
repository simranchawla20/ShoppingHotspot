<%@ Page Title="Shopping Hotspot-Admin Subcategories" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="SubCategory.aspx.cs" Inherits="ShoppingHotspot.Admin.SubCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">SubCategories</h1>
            <p class="fntcolor">Add SubCategories for each Main Category Here</p>
            <hr>
            <div class="form-group">
                <table>
                     <tr>
                     <td>
                     <asp:Label ID="txtMainCat" CssClass="fntcolor" runat="server" Text="Main Category"></asp:Label>
             
                  <asp:DropDownList ID="ddlMainCat" runat="server" CssClass="form-control">
                 </asp:DropDownList>
                         
            <asp:RequiredFieldValidator ID="rfvmainCat" runat="server"
                ErrorMessage="Category is required" ControlToValidate="ddlMainCat" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                         </td>
                      </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblSubCategory" CssClass="fntcolor" runat="server" Text="SubCategory Name"></asp:Label>
                            <asp:TextBox ID="txtSubCategory" runat="server" CssClass="form-control" placeholder="Enter SubCategory"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCategory" runat="server"
                                ErrorMessage =" SubCategory to be added required" ControlToValidate="txtSubCategory" ValidationGroup="User" ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:Button ID="btnAddSubCategory" runat="server" Text="Add SubCategory" ValidationGroup="User" CssClass="btn btn-primary" OnClick="btnAddSubCategory_Click" />


            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdSubCategory" AllowPaging="true" OnPageIndexChanging="GrdSubCategory_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id" OnRowCommand="GrdSubCategory_RowCommand" AllowSorting="True" >
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="ID"></asp:BoundField>
                                    <asp:BoundField DataField="subCategory" HeaderText="Subcategory Name"></asp:BoundField>
                                    <asp:BoundField DataField="categoryName" HeaderText="Main Category"></asp:BoundField>
                                    <asp:BoundField DataField="CreatedOn" HeaderText="Created date"></asp:BoundField>
                                    <asp:BoundField DataField="ModifiedOn" HeaderText="Modified On"></asp:BoundField>
                                    <asp:BoundField DataField="status" HeaderText="Status"></asp:BoundField>


                                    
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
