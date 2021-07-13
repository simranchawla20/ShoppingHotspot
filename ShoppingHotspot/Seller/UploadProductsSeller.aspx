<%@ Page Title="" Language="C#" MasterPageFile="~/Seller/SellerMaster.Master" AutoEventWireup="true" CodeBehind="UploadProductsSeller.aspx.cs" Inherits="ShoppingHotspot.Seller.UploadProductsSeller" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <h1 class="syzColor">Upload Products</h1>
            <p class="fntcolor">Add New product Here</p>
            <hr>
            <div class="row">
      <div class="col-lg-6">
            <div class="form-group">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblmainCat" CssClass="fntcolor" runat="server" Text="mainCat"></asp:Label>
                            <asp:DropDownList ID="ddlMainCat" runat="server" AutoPostBack="True"  CssClass="form-control" onselectedindexchanged="ddlMainCat_SelectedIndexChanged">
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="rfvmainCat" runat="server"
                                ErrorMessage="Category is required" ControlToValidate="ddlMainCat" ForeColor="Red" ValidationGroup="Product">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblsubCat" CssClass="fntcolor" runat="server" Text="subCat Name"></asp:Label>
                            <asp:DropDownList ID="ddlSubCat" runat="server" CssClass="form-control">
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="rfvsubCat" runat="server"
                                ErrorMessage="SubCategory is required" ControlToValidate="ddlSubCat" ForeColor="Red" ValidationGroup="Product">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblProduct" CssClass="fntcolor" runat="server" Text="Product Name"></asp:Label>
                            <asp:TextBox ID="txtProduct" runat="server" CssClass="form-control" placeholder="Enter Product"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvProduct" runat="server"
                                ErrorMessage=" Product to be added required" ControlToValidate="txtProduct" ForeColor="Red" ValidationGroup="Product">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPrice" CssClass="fntcolor" runat="server" Text="Price Name"></asp:Label>
                            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter Price"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPrice" runat="server"
                                ErrorMessage=" Price to be added required" ControlToValidate="txtPrice" ForeColor="Red" ValidationGroup="Product">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblqnty" CssClass="fntcolor" runat="server" Text="Quantity"></asp:Label>
                            <asp:TextBox ID="txtqnty" runat="server" CssClass="form-control" placeholder="Enter qnty"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ErrorMessage=" qnty to be added required" ControlToValidate="txtqnty" ForeColor="Red" ValidationGroup="Product">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDescription" CssClass="fntcolor" runat="server" Text="Description"></asp:Label>
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Description"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDescription" runat="server"
                                ErrorMessage=" Description to be added required" ControlToValidate="txtDescription" ForeColor="Red" ValidationGroup="Product">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblSize" CssClass="fntcolor" runat="server" Text="Size"></asp:Label>
                            <asp:DropDownList ID="ddlSize" runat="server">
                                <asp:ListItem Enabled="true" Text="Select Size" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="S" Value="1"></asp:ListItem>
                                <asp:ListItem Text="M" Value="2"></asp:ListItem>
                                <asp:ListItem Text="L" Value="3"></asp:ListItem>
                                <asp:ListItem Text="XL" Value="3"></asp:ListItem>
                                <asp:ListItem Text="XXL" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSize" runat="server"
                                ErrorMessage=" Size to be added required" ControlToValidate="ddlSize" ForeColor="Red" ValidationGroup="Product">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPic" CssClass="fntcolor" runat="server" Text="Picture"></asp:Label>
                            <asp:FileUpload ID="FileUploadPic" runat="server" Width="211px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                ErrorMessage=" pic to be added required" ControlToValidate="FileUploadPic" ForeColor="Red" ValidationGroup="Product">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblProductCode" CssClass="fntcolor" runat="server" Text="Product Code"></asp:Label>
                            <asp:TextBox ID="txtProductCode" runat="server" CssClass="form-control" placeholder="Enter Product Code"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvProductCode" runat="server"
                                ErrorMessage=" ProductCode to be added required" ControlToValidate="txtProductCode" ForeColor="Red" ValidationGroup="Product">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblBrand" CssClass="fntcolor" runat="server" Text="Brand Name"></asp:Label>
                            <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control" placeholder="Enter Brand"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvBrand" runat="server"
                                ErrorMessage=" Brand to be added required" ControlToValidate="txtBrand" ForeColor="Red" ValidationGroup="Product">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblType" CssClass="fntcolor" runat="server" Text="Type"></asp:Label>
                            <asp:TextBox ID="txtType" runat="server" CssClass="form-control" placeholder="Enter Type"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvType" runat="server"
                                ErrorMessage=" Type to be added required" ControlToValidate="txtType" ForeColor="Red" ValidationGroup="Product">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblSeason" CssClass="fntcolor" runat="server" Text="Season"></asp:Label>
                            <asp:DropDownList ID="ddLSeason" runat="server">
                                <asp:ListItem Enabled="true" Text="Select Season" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="Summers" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Winter" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Both" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSeason" runat="server"
                                ErrorMessage=" Season to be added required" ControlToValidate="ddLSeason" ForeColor="Red" ValidationGroup="Product">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblOffer" CssClass="fntcolor" runat="server" Text="Offer"></asp:Label>
                            <asp:TextBox ID="txtOffer" runat="server" CssClass="form-control" placeholder="Enter Offer"></asp:TextBox>
                            <asp:Label ID="lblOPtional1" CssClass="text-muted" runat="server" Text="(OPTIONAL)"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDelivery" CssClass="fntcolor" runat="server" Text="Delivery Charges"></asp:Label>
                            <asp:TextBox ID="txtDelivery" runat="server" CssClass="form-control" placeholder="Enter Delivery Charges"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDelivery" runat="server"
                                ErrorMessage=" Delivery to be added required" ControlToValidate="txtDelivery" ForeColor="Red" ValidationGroup="Product">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPromoCode" CssClass="fntcolor" runat="server" Text="Promo Code"></asp:Label>
                            <asp:TextBox ID="txtPromoCode" runat="server" CssClass="form-control" placeholder="Enter PromoCode"></asp:TextBox>
                            <asp:Label ID="lblOptional2" CssClass="text-muted" runat="server" Text="(OPTIONAL)"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
          </div>
                <div class="col-lg-6">
                    <asp:Image ID="ImgProduct" ImageUrl="" runat="server" Width="400px" Height="400px" />
                    </div>
            </div>
            <asp:button id="btnaddproduct" runat="server" text="Add product" Cssclass="btn btn-primary" onclick="btnaddproduct_click" validationgroup="product" />


            <hr />
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
            </div>
        </div>
        <footer class="footer text-center">2021-2022 &copy; ShoppingHotspot brought to you by Simran Chawla </footer>
    </div>
</asp:Content>
