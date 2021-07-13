<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="JobStatus.aspx.cs" Inherits="ShoppingHotspot.Admin.JobStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">Job Status</h1>
            <p class="fntcolor">Check the status for the job assigned by you</p>
            <hr>
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdJobStatus" AllowPaging="true" OnPageIndexChanging="GrdJobStatus_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id"  AllowSorting="True">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="ID"></asp:BoundField>
                                    <asp:BoundField DataField="EmployeeNameId" HeaderText="EmployeeNameId"></asp:BoundField>
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
        <footer class="footer text-center">2021-2022 &copy; ShoppingHotspot brought to you by Simran Chawla </footer>
    </div>
</asp:Content>
