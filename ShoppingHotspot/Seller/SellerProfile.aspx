<%@ Page Title="" Language="C#" MasterPageFile="~/Seller/SellerMaster.Master" AutoEventWireup="true" CodeBehind="SellerProfile.aspx.cs" Inherits="ShoppingHotspot.Seller.SellerProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor" >Your Info</h1>
        <p class="fntcolor">You can update your account , if required.</p>
            <hr>
            <div class="row">
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
            </div>
             <asp:button id="btnUpdate" runat="server" text="Update" Cssclass="btn btn-primary" onclick="btnUpdate_Click" validationgroup="Job" />


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
