<%@ Page Title="Shopping Hotspot-Admin UserUpdate" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UpdateUser.aspx.cs" Inherits="ShoppingHotspot.Admin.UpdateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">userUpdate page</h4>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <a href="http://localhost:54852/Login" target="_blank"
                            class="btn btn-danger pull-right m-l-20 hidden-xs hidden-sm waves-effect waves-light">LogOut</a>
                        <ol class="breadcrumb">
                            <li><a href="#">Dashboard</a></li>
                            <li class="active">userUpdate Page</li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <!-- .row -->
                <div class="row">
                    <div class="col-md-4 col-xs-12">
                        <div class="white-box">
                            <div class="user-bg"> <img width="100%" alt="user" src="../plugins/images/large/img1.jpg">
                                <div class="overlay-box">
                                    <div class="user-content">
                                        <a href="javascript:void(0)"><img src="../plugins/images/users/genu.jpg"
                                                class="thumb-lg img-circle" alt="img"></a>
                                        <h4 class="text-white"> <asp:Label ID="lblname"  runat="server"></asp:Label></h4>
                                        <h5 class="text-white"><asp:Label ID="lblemail"  runat="server"></asp:Label></h5>
                                        <h4 class="text-white"><asp:Label ID="lblid"  runat="server"></asp:Label></h4>
                                    </div>
                                </div>
                            </div>

                            
                            <%--<div class="user-btm-box">
                                <div class="col-md-4 col-sm-4 text-center">
                                    <p class="text-purple"><i class="ti-facebook"></i></p>
                                    <h1>258</h1>
                                </div>
                                <div class="col-md-4 col-sm-4 text-center">
                                    <p class="text-blue"><i class="ti-twitter"></i></p>
                                    <h1>125</h1>
                                </div>
                                <div class="col-md-4 col-sm-4 text-center">
                                    <p class="text-danger"><i class="ti-dribbble"></i></p>
                                    <h1>556</h1>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                    <div class="col-md-8 col-xs-12">
                        <div class="white-box">
                            <div class="form-horizontal form-material">
                                <div class="form-group">
                                    <label class="col-md-12">First Name</label>
                                    <div class="col-md-12">
                                       <asp:TextBox ID="txtFirstname" runat="server" CssClass="form-control form-control-line" placeholder="Enter First Name"></asp:TextBox>
                                        </div>
                                </div>
                                  <div class="form-group">
                                    <label class="col-md-12">Last Name</label>
                                    <div class="col-md-12">
                                       <asp:TextBox ID="TxtLastname" runat="server" CssClass="form-control form-control-line" placeholder="Enter First Name"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="form-group">
                                    <label for="example-email" class="col-md-12">Email</label>
                                    <div class="col-md-12">
                                       <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control form-control-line" placeholder="Enter First Name" ReadOnly="true"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Password</label>
                                    <div class="col-md-12">
                                         <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control form-control-line" placeholder="Enter First Name"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Phone No</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="TxtPhone" runat="server" CssClass="form-control form-control-line" placeholder="Enter First Name"></asp:TextBox>
                                        </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Address</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="TxtAddress" runat="server" CssClass="form-control form-control-line" placeholder="Enter First Name"></asp:TextBox>
                                        </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-12">Gender</label>
                                    <div class="col-md-12">
                                       <asp:TextBox ID="txtGender" runat="server" CssClass="form-control form-control-line" placeholder="Enter First Name"></asp:TextBox>
                                        </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-sm-12">
                                         <asp:Button ID="btnSubmit" runat="server" Text="Update Profile" CssClass="btn btn-success" ValidationGroup="User" OnClick="btnSubmit_Click" />

                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            <footer class="footer text-center"> 2021-2022 &copy; ShoppingHotspot brought to you by Simran Chawla </footer>
        </div>
</asp:Content>
