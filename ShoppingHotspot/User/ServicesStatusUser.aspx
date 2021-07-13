<%@ Page Title="" Language="C#" MasterPageFile="~/User/userMaster.Master" AutoEventWireup="true" CodeBehind="ServicesStatusUser.aspx.cs" Inherits="ShoppingHotspot.User.ServicesStatusUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2><asp:Label ID="lblUsername"  runat="server"></asp:Label></h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="userDashboard.aspx">My Account</a></li>
                        <li class="breadcrumb-item active">Services Status</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">Job Status</h1>
            <p class="fntcolor">Check the status for the job assigned by you</p>
            <hr>
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdServiceStatus" AllowPaging="true" OnPageIndexChanging="GrdServiceStatus_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id" OnRowCommand="GrdJobStatus_RowCommand" AllowSorting="True" >
                                <Columns>
                                    
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name"></asp:BoundField>
                                    <asp:BoundField DataField="Email" HeaderText="Email"></asp:BoundField>
                                    <asp:BoundField DataField="Phone" HeaderText="Phone"></asp:BoundField>
                                    <asp:BoundField DataField="JobAssigned" HeaderText="JobAssigned"></asp:BoundField>
                                    <asp:BoundField DataField="Status" HeaderText="Status"></asp:BoundField>
                                    <asp:BoundField DataField="AssignedDate" HeaderText="AssignedDate"></asp:BoundField>
                                    

                                    <asp:TemplateField HeaderText="ACTION">
                                        <ItemTemplate>
                                            <asp:DropDownList ID = "ddlJobStatus" runat="server" AutoPostBack = "true" CssClass="form-control" OnSelectedIndexChanged = "SelectedIndexChanged" >
                                                <asp:ListItem Enabled="true" Text="In Progress" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Completed" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Not Completed" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
