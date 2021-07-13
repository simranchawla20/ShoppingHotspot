<%@ Page Title="Shopping Hotspot-User Profile" Language="C#" MasterPageFile="~/User/userMaster.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="ShoppingHotspot.User.profile" %>
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
                        <li class="breadcrumb-item active">My Profile</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <%--<div id="page-wrapper">
            <div class="container-fluid">
               
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
                                         <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn btn-success" ValidationGroup="User" OnClick="btnUpdate_Click" />

                                       
                                    </div>
                                </div>
                            </div>
                        </div>
               
               
            </div>
           
        </div>--%>



 






    <div id="divProfile" class="container">
        <h1 class="syzColor" >Your Info</h1>
        <p class="fntcolor">You can update your account , if required.</p>
        <hr>
        
        <div class="form-group">
            <table> 
                <tr>
                    <td>
            <asp:Label ID="lblFirstname" CssClass="fntcolor" runat="server" Text="First Name"></asp:Label>
            <asp:TextBox ID="txtFirstname" runat="server" CssClass="form-control" placeholder="Enter First Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                ErrorMessage="First Name required" ControlToValidate="txtFirstname" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>

                        </td>
                </tr>

                 <tr>
                      <td>
            <asp:Label ID="lblLastname" CssClass="fntcolor"  runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox ID="TxtLastname" runat="server" CssClass="form-control" placeholder="Enter Last Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                ErrorMessage="Last Name required" ControlToValidate="TxtLastname" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                           </td>
                      </tr>

                 <tr>
                      <td>
            <asp:Label ID="lblEmail" CssClass="fntcolor" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" ReadOnly="true"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                ErrorMessage="Email ID required" ControlToValidate="TxtEmail" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                ErrorMessage="RegularExpressionValidator" ControlToValidate="TxtEmail" ForeColor="Red" ValidationGroup="User"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                           </td>
                      </tr>

                 <tr>
                      <td>
            <asp:Label ID="lblPassword" CssClass="fntcolor" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control" placeholder="create password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                ErrorMessage="Password required" ControlToValidate="TxtPassword" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="revlength" runat="server" 
                        ControlToValidate="TxtPassword"
                        ErrorMessage="Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number" ValidationGroup="User" ForeColor="Red"
                        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"/>
                           </td>
                      </tr>

                 <tr>
                      <td>
            <asp:Label ID="lblPhone" CssClass="fntcolor" runat="server" Text="Phone Number"></asp:Label>
            <asp:TextBox ID="TxtPhone" runat="server" CssClass="form-control" placeholder="Enter your mobile number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                ErrorMessage="Phone number is required" ControlToValidate="TxtPhone" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"   ForeColor="Red" ValidationGroup="User"
                ControlToValidate="TxtPhone" ErrorMessage="Phone Number is not correct" ValidationExpression="[0-9]{10}">
            </asp:RegularExpressionValidator>
                           </td>
                      </tr>

                 <tr>
                      <td>
            <asp:Label ID="lblAddress" CssClass="fntcolor" runat="server" Text="Address"></asp:Label>
            <asp:TextBox ID="TxtAddress" runat="server" CssClass="form-control" placeholder="Address" TextMode="MultiLine" Height="100"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                ErrorMessage="Address is required" ControlToValidate="TxtAddress" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                           </td>
                      </tr>

               
                  <tr>
                     <td>
                     <asp:Label ID="lblGender" CssClass="fntcolor" runat="server" Text="Gender"></asp:Label>
            <asp:TextBox ID="txtGender" runat="server" CssClass="form-control" placeholder="Gender"></asp:TextBox>
                        
                         
<%--<asp:DropDownList ID="dropdown" runat="server">
    <asp:ListItem Enabled="true" Text="Select Gender" Value="Gender"></asp:ListItem>
    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
    
</asp:DropDownList>--%>
            <asp:RequiredFieldValidator ID="rfvGender" runat="server"
                ErrorMessage="Gender is required" ControlToValidate="txtGender" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                         </td>
                      </tr>

                <tr>
                      <td>
            <asp:Label ID="lbltype" CssClass="fntcolor" runat="server" Text="User Type"></asp:Label>
            <asp:TextBox ID="txttype" runat="server" CssClass="form-control" placeholder="Enter type" ReadOnly="true"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvtype" runat="server"
                ErrorMessage="type required" ControlToValidate="txttype" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                           </td>
                      </tr>
                </table>
        </div>
        
         <div class="form-group">
                                    <div class="col-sm-12">
                                         <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn btn-success" ValidationGroup="User" OnClick="btnUpdate_Click" />

                                       
                                    </div>

</div>
    </div>
</asp:Content>
