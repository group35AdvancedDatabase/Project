<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="SearchRecipe.aspx.cs" Inherits="Assignment1.SearchRecipe" %>

<%@ Register Src="UCLabelText.ascx" TagPrefix="UC1" TagName="LabelText" %>
<%@ Register Src="UCLabelDropDown.ascx" TagPrefix="UC2" TagName="LabelDropDown" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <fieldset>
        <legend>Search recipes</legend>

        <UC1:LabelText runat="server" ID="ucSaerchName" LabelText="Recipe Name" />
        <br />
        <UC1:LabelText runat="server" ID="ucSubmittedBy" LabelText="Submitted By" />
        <br />
        <UC2:LabelDropDown runat="server" ID="ucCategory" LabelText="Category" />
        <br />
        <UC2:LabelDropDown runat="server" ID="ucCuisine" LabelText="Cuisine" />
        <br />
         <p style="flex-item-align: start; width: 340px;">
               <%-- <asp:CheckBox ID="chkPrivate" runat="server" />--%>
             <asp:RadioButton ID="rbtnPrivate"  GroupName="AccessType" runat="server" />
                <asp:Label ID="lblPrivate" runat="server" Text="Private Recipes" Width="250px" />
            </p>
        <br />
          <p style="flex-item-align: start; width: 340px;">
             <%--   <asp:CheckBox ID="chkPublic" runat="server" />--%>
               <asp:RadioButton ID="rbtnPublic" GroupName="AccessType" runat="server" />
                <asp:Label ID="lblPublic" runat="server" Text="Public Recipes" Width="250px" />
            </p>
        <br />
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
          <asp:Button ID="btnResetSearch" runat="server" Text="Reset Search" OnClick="btnResetSearch_Click" />
    </fieldset>
    <fieldset>
        <legend>Search Result</legend>
          <asp:GridView ID="gvRecipes" AutoGenerateColumns="false" AllowPaging="True" PageSize="10"  runat="server"  OnPageIndexChanging="gvRecipes_PageIndexChanging" OnRowEditing="gvRecipes_RowEditing" >
            <Columns>
                <asp:BoundField HeaderText="Name" DataField="RECIPE_NAME" />
                <asp:BoundField HeaderText="Category" DataField="CATEGORY_NAME" />
                 <asp:BoundField HeaderText="Cuisine" DataField="CUISINE_NAME" />
                 <asp:BoundField HeaderText="Cooking Time" DataField="COOKING_TIME" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
    </fieldset>
</asp:Content>
