<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="SliderAdmin.aspx.cs" Inherits="ShoppingHotspot.Admin.SliderAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">Slider</h1>
            <p class="fntcolor">Add Images And Text Here</p>
            <hr>
            <div class="form-group">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblImage1" CssClass="fntcolor" runat="server" Text=" Add Image"></asp:Label>
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="211px" />
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvImage1" runat="server"
                                ErrorMessage="Image to be added required" ControlToValidate="FileUpload1" ForeColor="Red" ValidationGroup="imgslider">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblText1" CssClass="fntcolor" runat="server" Text="Text1"></asp:Label>
                            <asp:TextBox ID="txtText1" runat="server" CssClass="form-control" placeholder="Enter Text1"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvText1" runat="server"
                                ErrorMessage=" Text1 to be added required" ControlToValidate="txtText1" ForeColor="Red" ValidationGroup="imgslider">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <asp:Image ID="ImgSlider" ImageUrl="" runat="server" Width="100px" Height="100px" />
                    
                </table>
            </div>
            <asp:Button ID="btnAddSlider" runat="server" Text="Add Slider" CssClass="btn btn-primary" OnClick="btnAddSlider_Click" ValidationGroup="imgslider"/>


            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">

                        <div class="table-responsive">

                            <asp:GridView ID="GrdSlider" AllowPaging="true" OnPageIndexChanging="GrdSlider_PageIndexChanging" class="table" AutoGenerateColumns="false" runat="server" PageSize="10" DataKeyNames="Id" OnRowCommand="GrdSlider_RowCommand" OnRowDeleting="GrdSlider_RowDeleting" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="ID"></asp:BoundField>
                                    <asp:BoundField DataField="Image" HeaderText="Image"></asp:BoundField>
                                    
                                    <asp:BoundField DataField="Text" HeaderText="Text"></asp:BoundField>
                                    
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
            </div>
        </div>
        <footer class="footer text-center"> 2021-2022 &copy; ShoppingHotspot brought to you by Simran Chawla </footer>
    </div>

</asp:Content>
