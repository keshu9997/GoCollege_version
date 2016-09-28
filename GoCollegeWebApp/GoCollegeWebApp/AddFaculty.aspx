﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddFaculty.aspx.cs" Inherits="GoCollegeWebApp.AddFaculty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <br />
    <!--banner-->
    <div class="banner">

        <h2>
            <a href="#">Home</a>
            <i class="fa fa-angle-right"></i>
            <span>Faculty Management</span>

            <asp:LinkButton ID="lnkbtnAdd"  runat="server"  OnClick="lnkAddNewFaculty">Add New</asp:LinkButton>      
            <asp:LinkButton ID="lnkbtnView" runat="server" OnClick="lnkViewAll">View All</asp:LinkButton>                          
           
        </h2>
    </div>

    <br />

    
    <div class="text-left">
        <asp:Label ID="errMsg" CssClass="errMsg" Text="" runat="server"> </asp:Label>
    </div>






</asp:Content>
