<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CartProduct.aspx.cs" Inherits="ShoppingHotspot.CartProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
<script type = "text/javascript">
function CallButtonEvent(ID) {
    debugger
    
    $.ajax({
        type: "POST",
        url: "CartProduct.aspx/UpdateQuantity",
        data: '{ID: "' + ID + '",Quantity:"'+$('#txtquantity' + ID).val()+'",Price:"'+$('#txtPrice' + ID).text()+'" }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnSuccess,
        failure: function(response) {
            debugger
            alert(response.d);
            
        }
    });
}

    function CallAnchorEvent(ID) {
    debugger
    
    $.ajax({
        type: "POST",
        url: "CartProduct.aspx/RemoveCart",
        data: '{ID: "' + ID + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnSuccess,
        failure: function(response) {
            debugger
            alert(response.d);
            
        }
    });
}

function OnSuccess(response) {
    debugger
    alert(response.d);
    location.reload();
}
</script>
     <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Cart</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">Cart</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Images</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="RepeaterCartProducts" runat="server" >
                                                        <ItemTemplate>
                                <tr id="<%#Eval("id")%>">
                                    <td class="thumbnail-img">
                                        <a href="#">
									<img class="img-fluid" src="images/<%#Eval("Image")%>" alt="" />
								</a>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
									<%#Eval("productName")%>
								</a>
                                    </td>
                                    <td class="price-pr">
                                        <p id="txtPrice<%#Eval("id")%>"><%#Eval("Price")%></p>
                                    </td>
                                    <td  class="quantity-box" >
                                        <input id="txtquantity<%#Eval("id")%>" type="number"  max="10" min="1" value="<%#Eval("Quantity")%>" class="c-input-text qty text">

                                    </td>
                                    
                                    <td class="total-pr">
                                        <p><%#Eval("TotalPrice")%></p>
                                    </td>
                                    <td class="remove-pr">
                                        <input id="removeCart" type="button" value="X" onclick = "CallAnchorEvent(<%#Eval("id")%>)" />
									<%--<i class="fas fa-times"></i>--%>
								</a>
                                    </td>
                                    <td class="remove-pr">
                                        <input id="btnupdatequantity" type="button" value="update" onclick = "CallButtonEvent(<%#Eval("id")%>)" />
                                       <%--<asp:Button ID="btnupdatequantity" runat="server" Text="update"/>--%>
                                    </td>
                                    
                                </tr>
                                 </ItemTemplate>
                                                    </asp:Repeater>




                                <%--<tr>
                                    <td class="thumbnail-img">
                                        <a href="#">
									<img class="img-fluid" src="images/img-pro-02.jpg" alt="" />
								</a>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
									Lorem ipsum dolor sit amet
								</a>
                                    </td>
                                    <td class="price-pr">
                                        <p>$ 60.0</p>
                                    </td>
                                    <td class="quantity-box"><input type="number" size="4" value="1" min="0" step="1" class="c-input-text qty text"></td>
                                    <td class="total-pr">
                                        <p>$ 80.0</p>
                                    </td>
                                    <td class="remove-pr">
                                        <a href="#">
									<i class="fas fa-times"></i>
								</a>
                                    </td>
                                </tr>--%>
                                <%--<tr>
                                    <td class="thumbnail-img">
                                        <a href="#">
									<img class="img-fluid" src="images/img-pro-03.jpg" alt="" />
								</a>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
									Lorem ipsum dolor sit amet
								</a>
                                    </td>
                                    <td class="price-pr">
                                        <p>$ 30.0</p>
                                    </td>
                                    <td class="quantity-box"><input type="number" size="4" value="1" min="0" step="1" class="c-input-text qty text"></td>
                                    <td class="total-pr">
                                        <p>$ 80.0</p>
                                    </td>
                                    <td class="remove-pr">
                                        <a href="#">
									<i class="fas fa-times"></i>
								</a>
                                    </td>
                                </tr>--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row my-5">
                <div class="col-lg-6 col-sm-6">
                    <div class="coupon-box">
                        <div class="input-group input-group-sm">
                            <input class="form-control" placeholder="Enter your coupon code" aria-label="Coupon code" type="text">
                            <div class="input-group-append">
                                <button class="btn btn-theme" type="button">Apply Coupon</button>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>

            <div class="row my-5">
                <div class="col-lg-8 col-sm-12"></div>
                <div class="col-lg-4 col-sm-12">
                    <div class="order-box">
                        <h3>Order summary</h3>
                        <div class="d-flex">
                            <h4>Sub Total</h4>
                            <div class="ml-auto font-weight-bold"> <asp:Label ID="lblSubTotal"  runat="server"></asp:Label> /- </div>
                        </div>
                        <div class="d-flex">
                            <h4>Discount</h4>
                            <div class="ml-auto font-weight-bold">- </div>
                        </div>
                        <hr class="my-1">
                        <div class="d-flex">
                            <h4>Coupon Discount</h4>
                            <div class="ml-auto font-weight-bold">- </div>
                        </div>
                        <div class="d-flex">
                            <h4>Shipping Cost</h4>
                            <div class="ml-auto font-weight-bold"> Free </div>
                        </div>
                        <hr>
                        <div class="d-flex gr-total">
                            <h5>Grand Total</h5>
                            <div class="ml-auto h5"><asp:Label ID="lblGrandTotal"  runat="server"></asp:Label> /- </div>
                        </div>
                        <hr> </div>
                </div>
                <div class="col-12 d-flex shopping-box"><a href="checkout.html" class="ml-auto btn hvr-hover">Checkout</a> </div>
            </div>

        </div>
    </div>
</asp:Content>
