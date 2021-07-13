<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AsignJob.aspx.cs" Inherits="ShoppingHotspot.Admin.AsignJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">Assign Jobs</h1>
            <p class="fntcolor">Assign Jobs to Users Here</p>
            <hr>
            <div class="row">
                <div class="form-group">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblUserName" CssClass="fntcolor" runat="server" Text="Employee Name"></asp:Label>
                                <asp:DropDownList ID="ddlUserName" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="ddlUserName_SelectedIndexChanged">
                                </asp:DropDownList>

                                <asp:RequiredFieldValidator ID="rfvUserName" runat="server"
                                    ErrorMessage="Username is required" ControlToValidate="ddlUserName" ForeColor="Red" ValidationGroup="Job">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblType" CssClass="fntcolor" runat="server" Text="Type"></asp:Label>
                                <asp:TextBox ID="txtType" runat="server" CssClass="form-control" placeholder="Enter Type" ReadOnly="true"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEmail" CssClass="fntcolor" runat="server" Text="Email"></asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPhone" CssClass="fntcolor" runat="server" Text="Phone Number"></asp:Label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter Phone Number" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblGender" CssClass="fntcolor" runat="server" Text="Gender"></asp:Label>
                                <asp:TextBox ID="txtGender" runat="server" CssClass="form-control" placeholder="Enter Gender" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblJobs" CssClass="fntcolor" runat="server" Text="Jobs"></asp:Label>
                                <asp:DropDownList ID="ddlJobs" runat="server" CssClass="form-control">
                                    <asp:ListItem Enabled="true" Text="Select Job" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="filter fiting" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="painting" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Ac Service" Value="3"></asp:ListItem>
                                </asp:DropDownList>

                                <asp:RequiredFieldValidator ID="rfvJob" runat="server"
                                    ErrorMessage="Job is to be Assign required" ControlToValidate="ddlJobs" ForeColor="Red" ValidationGroup="Job">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
             <asp:button id="btnAssignJob" runat="server" text="Assign Job" Cssclass="btn btn-primary" onclick="btnAssignJob_click" validationgroup="Job" />


            <%--<hr />
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdProduct" AllowPaging="true" OnPageIndexChanging="GrdProduct_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id" OnRowCommand="GrdProduct_RowCommand" AllowSorting="True" OnRowDeleting="GrdProduct_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="ID"></asp:BoundField>
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
            </div>--%>
        </div>
        <footer class="footer text-center">2021-2022 &copy; ShoppingHotspot brought to you by Simran Chawla </footer>
    </div>
</asp:Content>
