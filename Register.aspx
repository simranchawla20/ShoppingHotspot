<%@ Page Title="Shopping Hotspot-Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ShoppingHotspot.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1 class="syzColor" >Register</h1>
        <p class="fntcolor">Please fill in this form to create an account.</p>
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
            <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
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
            <asp:Label ID="lblConfPassword" CssClass="fntcolor" runat="server" Text="Confirm Password"></asp:Label>
            <asp:TextBox ID="TxtConfPassword" runat="server" CssClass="form-control" placeholder="confirm password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvConfPassword" runat="server"
                ErrorMessage="Password to be confirmed is required" ControlToValidate="TxtConfPassword" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator" runat="server" ControlToValidate="TxtConfPassword" ForeColor="Red" ValidationGroup="User" ControlToCompare="TxtPassword" ErrorMessage="Password does not match!">
            </asp:CompareValidator>
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
            <%--<asp:TextBox ID="txtGender" runat="server" CssClass="form-control" placeholder="Gender"></asp:TextBox>--%>
                        <%--<select id="basic" class="selectpicker form-control">
						<option>Female</option>
                            <option>Male</option>
						<option>Other</option>
					</select>--%>
                         
<asp:DropDownList ID="txtGender" runat="server">
    <asp:ListItem Enabled="true" Text="Select Gender" Value="Gender"></asp:ListItem>
    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
    
</asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvGender" runat="server"
                ErrorMessage="Gender is required" ControlToValidate="txtGender" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                         </td>
                      </tr>

                <tr>
                     <td>
                     <asp:Label ID="lblUserType" CssClass="fntcolor" runat="server" Text="User Type"></asp:Label>
             
                  <asp:DropDownList ID="ddlUserType" runat="server">
                 </asp:DropDownList>
                         
            <asp:RequiredFieldValidator ID="rfvUserType" runat="server"
                ErrorMessage="UserType is required" ControlToValidate="ddlUserType" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                         </td>
                      </tr>

                </table>
        </div>
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Register" CssClass="btn btn-primary" ValidationGroup="User"/>
       
 <br />
         <%--<asp:Label ID="lblMessage" runat="server" Visible="false"  ForeColor="Red"></asp:Label>--%>
 <br />
        <p class="fntcolor">Already Registered? </p>
                <asp:Button ID="btnlogin" runat="server" Text="LogIn" CssClass="btn btn-primary " OnClick="btnlogin_Click" />

    </div>
</asp:Content>
