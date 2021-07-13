<%@ Page Title="Shopping Hotspot-User Address" Language="C#" MasterPageFile="~/User/userMaster.Master" AutoEventWireup="true" CodeBehind="updateAddress.aspx.cs" Inherits="ShoppingHotspot.User.updateAddress" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <h1 class="syzColor" > Address</h1>
        <p class="fntcolor">Please fill in this form to Add an Address.</p>
        <hr>
        
        <div class="form-group">
            <table> 
                <tr>
                    <td>
            <asp:Label ID="lblAddress" CssClass="fntcolor" runat="server" Text="Address"></asp:Label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                ErrorMessage="Address required" ControlToValidate="txtAddress" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>

                       
                        </td>
                </tr>
                <tr>
                     <td>
                     <asp:Label ID="txtAddressType" CssClass="fntcolor" runat="server" Text="Address-Type"></asp:Label>
           
                         
<asp:DropDownList ID="AddressType" runat="server">
    <asp:ListItem Enabled="true" Text="Select type" Value="AddressType"></asp:ListItem>
    <asp:ListItem Text="Home" Value="Home"></asp:ListItem>
    <asp:ListItem Text="Office" Value="Office"></asp:ListItem>
    <asp:ListItem Text="work" Value="work"></asp:ListItem>
     <asp:ListItem Text="other" Value="other"></asp:ListItem>
    
</asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvAddressType" runat="server"
                ErrorMessage="Gender is required" ControlToValidate="AddressType" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                         </td>
                      </tr>
                <tr>
                      <td>
            <asp:Label ID="lblCountry" CssClass="fntcolor"  runat="server" Text="Country"></asp:Label>
            <asp:TextBox ID="TxtCountry" runat="server" CssClass="form-control" placeholder="Enter Country Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCountry" runat="server"
                ErrorMessage="Country required" ControlToValidate="TxtCountry" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                           </td>
                      </tr>
                <tr>
                      <td>
            <asp:Label ID="lblState" CssClass="fntcolor"  runat="server" Text="State"></asp:Label>
            <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="Enter State Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ErrorMessage="State required" ControlToValidate="txtState" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                           </td>
                      </tr>
                 <tr>
                      <td>
            <asp:Label ID="lblCity" CssClass="fntcolor"  runat="server" Text="City"></asp:Label>
            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter City Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ErrorMessage="City required" ControlToValidate="txtCity" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                           </td>
                      </tr>
                          <tr>
                      <td>
            <asp:Label ID="lblPincode" CssClass="fntcolor"  runat="server" Text="Pincode"></asp:Label>
            <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" placeholder="Enter Pincode"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ErrorMessage="Pincode required" ControlToValidate="txtPincode" ForeColor="Red" ValidationGroup="User">
            </asp:RequiredFieldValidator>
                           </td>
                      </tr>
                   <tr>
                      <td>
            <asp:Label ID="lblLandMark" CssClass="fntcolor"  runat="server" Text="LandMark"></asp:Label>
            <asp:TextBox ID="txtLandMark" runat="server" CssClass="form-control" placeholder="(OPTIONAL)"></asp:TextBox>
           
                           </td>
                      </tr>

                </table>
        </div>
        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" CssClass="btn btn-primary" ValidationGroup="User"/>

    </div>





     <asp:GridView ID="GrdUsers" AllowPaging="true" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id"  OnRowCommand="GrdUsers_RowCommand" AllowSorting="True"  OnRowDeleting="GrdUsers_RowDeleting">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID" >
                   
                </asp:BoundField>
               
                <asp:BoundField DataField="Address" HeaderText="Address" >
                   
                </asp:BoundField>
                <asp:BoundField DataField="AddressType" HeaderText="AddressType">
                   
                </asp:BoundField>
                <asp:BoundField DataField="Country" HeaderText="Country">
                 
                </asp:BoundField>
                 <asp:BoundField DataField="state" HeaderText="state">
                    
                </asp:BoundField>
                <asp:BoundField DataField="city" HeaderText="city">
                   
                </asp:BoundField>
                <asp:BoundField DataField="pincode" HeaderText="pincode">
                   
                </asp:BoundField>
                 <asp:BoundField DataField="landMark" HeaderText="Landmark">
                   
                </asp:BoundField>
                <asp:BoundField DataField="status" HeaderText="status">
                   
                </asp:BoundField>
                <%--<asp:BoundField DataField="createdOn" HeaderText="createdOn">
                   
                </asp:BoundField>
                <asp:BoundField DataField="ModifiedOn" HeaderText="ModifiedOn">
                   
                </asp:BoundField>--%>
               

                <asp:TemplateField HeaderText="Approval">
                    <ItemTemplate>
                         
                        <asp:LinkButton ID="btn_select" runat="server" CommandName="Active" CommandArgument='<%#Eval("ID")%>'>enable</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Disable">
                    <ItemTemplate>
                        <asp:LinkButton ID="btn_unactive" runat="server" CommandName="UnActive" CommandArgument='<%#Eval("ID")%>'>disable</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Update">
                    <ItemTemplate>
                        <asp:LinkButton ID="btn_update" runat="server" CommandName="select" CommandArgument='<%#Eval("ID")%>'>update</asp:LinkButton>
                    </ItemTemplate>
                      </asp:TemplateField>
                <asp:TemplateField HeaderText="delete">
                     <ItemTemplate>
                         
                        <asp:LinkButton ID="btn_delete" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete');" CommandArgument='<%#Eval("ID")%>'>delete</asp:LinkButton>
                    </ItemTemplate>
                     </asp:TemplateField>
                
            </Columns>
        </asp:GridView>  
</asp:Content>
