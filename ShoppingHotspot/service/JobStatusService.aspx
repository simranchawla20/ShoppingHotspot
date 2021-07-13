<%@ Page Title="" Language="C#" MasterPageFile="~/service/serviceMaster.Master" AutoEventWireup="true" CodeBehind="JobStatusService.aspx.cs" Inherits="ShoppingHotspot.service.JobStatus" %>
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
                        <li class="breadcrumb-item"><a href="ServiceDashboard.aspx">My Account</a></li>
                        <li class="breadcrumb-item active">Job Status</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">Job Status</h1>
            <p class="fntcolor">Check the status for the job assigned to you</p>
            <hr>
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdJobStatus" AllowPaging="true" OnPageIndexChanging="GrdJobStatus_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="ID"></asp:BoundField>
                                    <asp:BoundField DataField="JobAssigned" HeaderText="JobAssigned"></asp:BoundField>
                                    <asp:BoundField DataField="Status" HeaderText="Status"></asp:BoundField>
                                    <asp:BoundField DataField="AssignedDate" HeaderText="AssignedDate"></asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</asp:Content>
