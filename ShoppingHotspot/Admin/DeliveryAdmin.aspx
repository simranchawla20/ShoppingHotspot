<%@ Page Title="Shopping Hotspot-Admin Delivery" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="DeliveryAdmin.aspx.cs" Inherits="ShoppingHotspot.Admin.DeliveryAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">Delivery Info</h1>
            <p class="fntcolor">Add info Here</p>
            <hr/>
            <div class="form-group">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblTitle" CssClass="fntcolor" runat="server" Text="Title:"></asp:Label>
                            <asp:TextBox  ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter Title here"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvTitle" runat="server"
                                ErrorMessage="title is required" ControlToValidate="txtTitle" ForeColor="Red" ValidationGroup="User">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDelInfo" CssClass="fntcolor" runat="server" Text="Info"></asp:Label>
                            <asp:TextBox TextMode="multiline" Columns="50" Rows="10" ID="txtDelInfo" runat="server" CssClass="form-control" placeholder="Enter info"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDelInfo" runat="server"
                                ErrorMessage=" info to be added required" ControlToValidate="txtDelInfo" ForeColor="Red" ValidationGroup="User">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                     <%-- //...............................column1--%>
                    <tr>
                        <td>
                            <asp:Label ID="lblHcol1" CssClass="fntcolor" runat="server" Text="Heading1:"></asp:Label>
                            <asp:TextBox  ID="txtHcol1" runat="server" CssClass="form-control" placeholder="Enter here"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvHcol1" runat="server"
                                ErrorMessage="heading 1 is required" ControlToValidate="txtPcol1" ForeColor="Red" ValidationGroup="User">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPcol1" CssClass="fntcolor" runat="server" Text="para1:"></asp:Label>
                            <asp:TextBox  ID="txtPcol1" runat="server" CssClass="form-control" placeholder="Enter here"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPcol1" runat="server"
                                ErrorMessage="para1 is required" ControlToValidate="txtPcol1" ForeColor="Red" ValidationGroup="User">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
               <%--//...............................column2--%>
                    <tr>
                        <td>
                            <asp:Label ID="lblHcol2" CssClass="fntcolor" runat="server" Text="Heading2:"></asp:Label>
                            <asp:TextBox  ID="txtHcol2" runat="server" CssClass="form-control" placeholder="Enter here"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvHcol2" runat="server"
                                ErrorMessage="heading2 is required" ControlToValidate="txtHcol2" ForeColor="Red" ValidationGroup="User">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPcol2" CssClass="fntcolor" runat="server" Text="para2:"></asp:Label>
                            <asp:TextBox  ID="txtPcol2" runat="server" CssClass="form-control" placeholder="Enter here"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPcol2" runat="server"
                                ErrorMessage="para2 is required" ControlToValidate="txtPcol1" ForeColor="Red" ValidationGroup="User">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--//...............................column3--%>
                    <tr>
                        <td>
                            <asp:Label ID="lblHcol3" CssClass="fntcolor" runat="server" Text="Heading3:"></asp:Label>
                            <asp:TextBox  ID="txtHcol3" runat="server" CssClass="form-control" placeholder="Enter here"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvHcol3" runat="server"
                                ErrorMessage="heading3 is required" ControlToValidate="txtHcol3" ForeColor="Red" ValidationGroup="User">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPcol3" CssClass="fntcolor" runat="server" Text="para3:"></asp:Label>
                            <asp:TextBox  ID="txtPcol3" runat="server" CssClass="form-control" placeholder="Enter here"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ErrorMessage="para3 is required" ControlToValidate="txtPcol3" ForeColor="Red" ValidationGroup="User">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
              
                </table>
            </div>
            <asp:Button ID="btnDelInfo" runat="server" Text="Add info" CssClass="btn btn-primary" OnClick="btnAddDelInfo_Click" ValidationGroup="User"/>


            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdDelInfo" AllowPaging="true" OnPageIndexChanging="GrdDelInfo_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id" OnRowCommand="GrdDelInfo_RowCommand" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="ID"></asp:BoundField>
                                     <asp:BoundField DataField="title" HeaderText="Title"></asp:BoundField>
                                    <asp:BoundField DataField="Info" HeaderText="Delivery Info"></asp:BoundField>
                                    <asp:BoundField DataField="hcol1" HeaderText="hcol1"></asp:BoundField>
                                    <asp:BoundField DataField="pcol1" HeaderText="pcol1"></asp:BoundField>
                                    <asp:BoundField DataField="hcol2" HeaderText="hcol2"></asp:BoundField>
                                    <asp:BoundField DataField="pcol2" HeaderText="pcol2"></asp:BoundField>
                                    <asp:BoundField DataField="hcol3" HeaderText="hcol3"></asp:BoundField>
                                    <asp:BoundField DataField="pcol3" HeaderText="pcol3"></asp:BoundField>
                      
                    
                                    <asp:TemplateField HeaderText="ACTION">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_update" runat="server" CommandName="select" CommandArgument='<%#Eval("ID")%>'>Update</asp:LinkButton>
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
