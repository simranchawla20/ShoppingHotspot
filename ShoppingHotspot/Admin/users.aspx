<%@ Page Title="Shopping Hotspot-Admin Users" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="ShoppingHotspot.Admin.users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Content -->
        <!-- ============================================================== -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Show All Users</h4>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <a href="http://localhost:54852/Login" target="_blank"
                            class="btn btn-danger pull-right m-l-20 hidden-xs hidden-sm waves-effect waves-light">LogOut

                        </a>
                        <ol class="breadcrumb">
                            <li><a href="#">Dashboard</a></li>
                            <li class="active">Show All Users</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-6">
                        <div class="white-box" style="width: 960px;">
                           
                            <div class="table-responsive">
                                <div class="pull-right" style="margin-bottom:38px;">
                                <asp:TextBox ID="txtsearch" runat="server" CssClass="float" placeholder="Enter user Name"></asp:TextBox>
                             <asp:Button ID="btnsearch" runat="server" Text="search user" CssClass="btn" OnClick="btnsearch_Click" />
                                  <asp:Label ID="lblSearchedusers" Text="Searched Users :" runat="server" Visible ="false"></asp:Label>
                              <strong>  <asp:Label ID="txtSearchedusers" runat="server" Visible ="false"></asp:Label></strong>
                                    </div>
                                 <div class="col-sm-6">
                                     <a href="http://localhost:54852/Register" target="_blank"
                            class="btn btn-danger pull-right m-l-20 hidden-xs hidden-sm waves-effect waves-light">Add User</a>
                                     </div>
                              
         <asp:GridView ID="GrdUsers" AllowPaging="true" OnPageIndexChanging="GrdUsers_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id"  OnRowCommand="GrdUsers_RowCommand" AllowSorting="True" OnRowDeleting="GrdUsers_RowDeleting">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" >
                   
                </asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="User First Name" >
                   
                </asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="Last Name">
                   
                </asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email">
                 
                </asp:BoundField>
                 <asp:BoundField DataField="Password" HeaderText="Password">
                    
                </asp:BoundField>
                <asp:BoundField DataField="Phone" HeaderText="Phone">
                   
                </asp:BoundField>
                <asp:BoundField DataField="Address" HeaderText="Address">
                   
                </asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="User Active" >
                   
                </asp:BoundField>

                <asp:BoundField DataField="Gender" HeaderText="Gender" >
                   
                </asp:BoundField>
                <asp:BoundField DataField="UserType" HeaderText="UserType" >
                   
                </asp:BoundField>


                <asp:TemplateField HeaderText="User Approval">
                    <ItemTemplate>
                         
                        <asp:LinkButton ID="btn_select" runat="server" CommandName="Active" CommandArgument='<%#Eval("ID")%>'>User Approval</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User Disable">
                    <ItemTemplate>
                        <asp:LinkButton ID="btn_unactive" runat="server" CommandName="UnActive" CommandArgument='<%#Eval("ID")%>'>User disable</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="User Update">
                    <ItemTemplate>
                        <asp:LinkButton ID="btn_update" runat="server" CommandName="select" CommandArgument='<%#Eval("ID")%>'>User update</asp:LinkButton>
                    </ItemTemplate>
                      </asp:TemplateField>
                <asp:TemplateField HeaderText="User delete">
                     <ItemTemplate>
                         
                        <asp:LinkButton ID="btn_delete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete');" CommandArgument='<%#Eval("ID")%>'>User delete</asp:LinkButton>
                    </ItemTemplate>
                     </asp:TemplateField>
                
            </Columns>
        </asp:GridView>                        
                         
                                
                                
                             
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            <footer class="footer text-center"> 2021-2022 &copy; ShoppingHotspot brought to you by Simran Chawla </footer>
        </div>
        <!-- /#page-wrapper -->
</asp:Content>
