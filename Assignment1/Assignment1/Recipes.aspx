<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Recipes.aspx.cs" Inherits="Assignment1.Recipies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <fieldset>
        <legend>All Your Recipes</legend>
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
