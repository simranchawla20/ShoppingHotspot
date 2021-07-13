﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="ShoppingHotspot.shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Shop</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                        <li class="breadcrumb-item active">Shop</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    <!-- Start Shop Page  -->
    <div class="shop-box-inner">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="search-product">
                            
                                <%--<input class="form-control" placeholder="Search here..." type="text">--%>
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search here..."></asp:TextBox>

                                <%--<button type="submit"  onclick="btnsearch_Click"><i class="fa fa-search"></i></button>
                            <asp:Button runat="server" Text="" />--%>
                            <a href="#" runat="server" onServerClick="btnsearch_Click"><i class="fa fa-search"></i></a>
                            
                        </div>
                        <div class="filter-sidebar-left">
                            <div class="title-left">
                                <h3>Categories</h3>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">

                                
                                        <div class="list-group-collapse sub-men">
                                            <a class="list-group-item list-group-item-action" href="#sub-men1" data-toggle="collapse" aria-expanded="true" aria-controls="sub-men1"><asp:Label ID="lblCategoryname1" runat="server"></asp:Label>
                                            </a>
                                            <div class="collapse show" id="sub-men1" data-parent="#list-group-men">
                                                <div class="list-group">

                                                    <asp:Repeater ID="Repeater2" runat="server">
                                                        <ItemTemplate>
                                                            <a href="shop.aspx?sbcat=<%#Eval("id")%>&mncat=1" class="list-group-item list-group-item-action active"><%#Eval("subCategory")%><small class="text-muted"><asp:Label ID="lbltext" runat="server"></asp:Label></small></a>
                                                        </ItemTemplate>
                                                    </asp:Repeater>

                                                </div>
                                            </div>
                                        </div>

                                <div class="list-group-collapse sub-men">
                                    <a class="list-group-item list-group-item-action" href="#sub-men2" data-toggle="collapse" aria-expanded="true" aria-controls="sub-men2"> <asp:Label ID="lblCategoryName2" runat="server"></asp:Label>
                                    </a>
                                    <div class="collapse show" id="sub-men2" data-parent="#list-group-men">
                                        <div class="list-group">
                                            <asp:Repeater ID="Repeater3" runat="server">
                                                        <ItemTemplate>
                                                            <a href="shop.aspx?sbcat=<%#Eval("id")%>&mncat=2" class="list-group-item list-group-item-action active"><%#Eval("subCategory")%><small class="text-muted"></small></a>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-collapse sub-men">
                                    <a class="list-group-item list-group-item-action" href="#sub-men3" data-toggle="collapse" aria-expanded="true" aria-controls="sub-men3"> <asp:Label ID="lblCategoryName3" runat="server"></asp:Label>
                                    </a>
                                    <div class="collapse show" id="sub-men3" data-parent="#list-group-men">
                                        <div class="list-group">
                                            <asp:Repeater ID="Repeater4" runat="server">
                                                        <ItemTemplate>
                                                            <a href="shop.aspx?sbcat=<%#Eval("id")%>&mncat=3" class="list-group-item list-group-item-action active"><%#Eval("subCategory")%><small class="text-muted"></small></a>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-collapse sub-men">
                                    <a class="list-group-item list-group-item-action" href="#sub-men4" data-toggle="collapse" aria-expanded="true" aria-controls="sub-men4"> <asp:Label ID="lblCategoryName4" runat="server"></asp:Label>
                                    </a>
                                    <div class="collapse show" id="sub-men4" data-parent="#list-group-men">
                                        <div class="list-group">
                                            <asp:Repeater ID="Repeater5" runat="server">
                                                        <ItemTemplate>
                                                            <a href="shop.aspx?sbcat=<%#Eval("id")%>&mncat=4" class="list-group-item list-group-item-action active"><%#Eval("subCategory")%><small class="text-muted"></small></a>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       <%-- <div class="filter-price-left">
                            <div class="title-left">
                                <h3>Price</h3>
                            </div>
                            <div class="price-box-slider">
                                <div id="slider-range"></div>
                                <p>
                                    <input type="text" id="amount" readonly style="border: 0; color: #fbb714; font-weight: bold;">
                                    <button class="btn hvr-hover" type="submit">Filter</button>
                                </p>
                            </div>
                        </div>--%>
                        <%--<div class="filter-brand-left">
                            <div class="title-left">
                                <h3>Brand</h3>
                            </div>
                            <div class="brand-box">
                                <ul>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios1" value="Yes" type="radio">
                                            <label for="Radios1">Supreme </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios2" value="No" type="radio">
                                            <label for="Radios2">A Bathing Ape </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios3" value="declater" type="radio">
                                            <label for="Radios3">The Hundreds </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios4" value="declater" type="radio">
                                            <label for="Radios4">Alife </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios5" value="declater" type="radio">
                                            <label for="Radios5">Neighborhood </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios6" value="declater" type="radio">
                                            <label for="Radios6">CLOT </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios7" value="declater" type="radio">
                                            <label for="Radios7">Acapulco Gold </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios8" value="declater" type="radio">
                                            <label for="Radios8">UNDFTD </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios9" value="declater" type="radio">
                                            <label for="Radios9">Mighty Healthy </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="radio radio-danger">
                                            <input name="survey" id="Radios10" value="declater" type="radio">
                                            <label for="Radios10">Fiberops </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>--%>

                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                    <div class="right-product-box">
                        <div class="product-item-filter row">
                            <div class="col-12 col-sm-8 text-center text-sm-left">
                                <div class="toolbar-sorter-right">
                                    <span>Sort by </span>
                                    <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
                                        <option data-display="Select">Nothing</option>
                                        <option value="1">Popularity</option>
                                        <option value="2">High Price → High Price</option>
                                        <option value="3">Low Price → High Price</option>
                                        <option value="4">Best Selling</option>
                                    </select>
                                </div>
                                <p>Showing All <asp:Label  id="lblProductCount" runat="server" ></asp:Label> Products</p>
                            </div>
                            <div class="col-12 col-sm-4 text-center text-sm-right">
                                <ul class="nav nav-tabs ml-auto">
                                    <li>
                                        <a class="nav-link active" href="#grid-view" data-toggle="tab"><i class="fa fa-th"></i></a>
                                    </li>
                                    <li>
                                        <a class="nav-link" href="#list-view" data-toggle="tab"><i class="fa fa-list-ul"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="row product-categorie-box">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                    <div class="row">

                                         <asp:Repeater ID="RepeaterProducts" runat="server" >
                                                        <ItemTemplate>

                                                            <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                            <div class="products-single fix">
                                                <div class="box-img-hover">
                                                    <div class="type-lb">
                                                        <p class="sale">Sale</p>
                                                    </div>
                                                    <img src="Admin/productImages/<%#Eval("pic")%>" class="img-fluid" alt="Image" style="height:300px !important">
                                                    <asp:Label ID="lblPic" runat="server" Text='<%# Eval("pic") %>' Visible="false"/>
                                                    <div class="mask-icon">
                                                        <ul>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                        </ul>
                                                        <%--<a class="cart" href="#" runat="server" onServerClick="btncart_Click">Add to Cart</a>--%>
                                                         <asp:Button ID="btncart" CssClass="btncart" runat="server" Text="Add to Cart" OnClick="btncart_Click" />
                                                    </div>
                                                </div>
                                                <div class="why-text">
                                                    <h4><%#Eval("ProductName")%></h4>
                                                     <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>' Visible="false"/>
                                                    <h5><%#Eval("price")%>/-</h5>
                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>' Visible="false"/>
                                                </div>
                                            </div>
                                                               
                                        </div>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                        
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    
    <!-- End Shop Page -->
    </div>
    </div>
        </div>
</asp:Content>
