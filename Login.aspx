<%@ Page Title="Shopping Hotspot-Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShoppingHotspot.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container ">
        <h1 class="syzColor" >logIn</h1>
        <p class="fntcolor">Please fill your login details</p>
        <hr>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="User" />
        <div class="form-group">
            <table>
                <tr>
                    <td>
            <asp:Label ID="lblUsername" CssClass="fntcolor" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                ErrorMessage=" UserName required" ControlToValidate="txtUsername" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                        </td>
                </tr>

                 <tr>
                      <td>
            <asp:Label ID="lblPassword" CssClass="fntcolor" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control" placeholder="Enter password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                ErrorMessage="Password required" ControlToValidate="TxtPassword" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                           </td>
                      </tr>
                 
                </table>
        </div>
        <asp:Button ID="btnSignIn" runat="server" Text="SignIn" CssClass="btn btn-primary" ValidationGroup="User" OnClick="btnSignIn_Click" />
        <br />
        <asp:Label ID="lblAlert" CssClass="fntcolor" runat="server" ForeColor="Red" Visible="false"></asp:Label>
    </div>
</asp:Content>
