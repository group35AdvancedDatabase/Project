<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="AddRecipe.aspx.cs" Inherits="Assignment1.AddRecipe" %>

<%@ Register Src="UCLabelText.ascx" TagPrefix="UC1" TagName="LabelText" %>
<%@ Register Src="UCLabelDropDown.ascx" TagPrefix="UC2" TagName="LabelDropDown" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <fieldset>
            <legend>Add your recipe</legend>

            <br />
            <asp:ValidationSummary ID="vsErrorMessages" runat="server" ForeColor="Red" />
            <asp:HiddenField ID="hdnRecipeID" runat="server" />
            <br />
            <UC1:LabelText runat="server" ID="ucRecipeName" LabelText="Recipe Name*" />
            <asp:RequiredFieldValidator ID="reqRecipeName" runat="server" ErrorMessage="Please enter Recipe Name." Display="None" ControlToValidate="ucRecipeName$ucTextBox"></asp:RequiredFieldValidator>
            <br />
            <UC1:LabelText runat="server" ID="ucSubmittedBy" TextBoxEnable="false" TextBoxText="Farhana" LabelText="Submitted By*" />
            <asp:RequiredFieldValidator ID="reqSubmittedBy" runat="server" ErrorMessage="Please enter Submitted By." Display="None" ControlToValidate="ucSubmittedBy$ucTextBox"></asp:RequiredFieldValidator>
            <br />
            <p>
                <asp:Label ID="lblCategory" runat="server" Text="Category*" Width="120px" />
                <asp:DropDownList ID="ddlCategory" runat="server" Width="205px" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            </p>
            <%--  <UC2:LabelDropDown runat="server" ID="ucCategory" LabelText="Category*" />--%>
            <asp:RequiredFieldValidator ID="reqCategory" runat="server" ErrorMessage="Please enter Category" InitialValue="0" Display="None" ControlToValidate="ddlCategory"></asp:RequiredFieldValidator>
            <br />
            <p>
                <asp:Label ID="lblOtherCategory" runat="server" Text="" Width="120px" />
                <asp:TextBox ID="txtOtherCategory" runat="server" Text="" Enabled="false" Width="200px" MaxLength="40" />
                <asp:RequiredFieldValidator ID="reqOtherCategory" runat="server" ControlToValidate="txtOtherCategory" Enabled="false" Display="None" ErrorMessage="Please Enter Other Category"></asp:RequiredFieldValidator>
            </p>
            <br />
            <UC1:LabelText runat="server" ID="ucCookingTime" LabelText="Cooking Time*" />
            <asp:RequiredFieldValidator ID="reqCookingTime" runat="server" ErrorMessage="Please enter Cooking Time" Display="None" ControlToValidate="ucCookingTime$ucTextBox"></asp:RequiredFieldValidator>
            <br />
            <UC1:LabelText runat="server" ID="ucPortion" LabelText="Portion*" />
            <asp:RequiredFieldValidator ID="reqPortion" runat="server" ErrorMessage="Please enter Portion" Display="None" ControlToValidate="ucPortion$ucTextBox"></asp:RequiredFieldValidator>
            <br />
            <p>
                <asp:Label ID="lblCuisine" runat="server" Text="Cuisine*" Width="120px" />
                <asp:DropDownList ID="ddlCuisine" runat="server" Width="205px" OnSelectedIndexChanged="ddlCuisine_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            </p>
            <%--  <UC2:LabelDropDown runat="server"  ID="ucCuisine" LabelText="Cuisine*" />--%>
            <asp:RequiredFieldValidator ID="reqCuisine" runat="server" ErrorMessage="Please enter Cuisine" Display="None" InitialValue="0" ControlToValidate="ddlCuisine"></asp:RequiredFieldValidator>
            <br />
            <p>
                <asp:Label ID="lblOtherCuisine" runat="server" Text="" Width="120px" />
                <asp:TextBox ID="txtOtherCuisine" runat="server" Enabled="false" Text="" Width="200px" MaxLength="40" />
                <asp:RequiredFieldValidator ID="reqOtherCuisine" runat="server" ControlToValidate="txtOtherCuisine" Enabled="false" Display="None" ErrorMessage="Please Enter Other Cuisine"></asp:RequiredFieldValidator>
            </p>
            <br />
            <p>
                <asp:Label ID="lblIngredients" runat="server" Text="Ingredients" Width="120px" />
                <asp:DropDownList ID="ddlIngredients" runat="server" Width="205px" OnSelectedIndexChanged="ddlIngredients_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                <asp:Label ID="lblIngedientQTY" runat="server" Text="Quantity*" Width="65px" />
                <asp:TextBox ID="txtIngedientQTY" runat="server" Text="" Width="100px" MaxLength="40" />
                <asp:RequiredFieldValidator ID="ReqddlIngredients" runat="server" ErrorMessage="Please Select Ingedient" Display="None" InitialValue="0" ValidationGroup="valIngredients" ControlToValidate="ddlIngredients"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="reqIngedientQTY" runat="server" ErrorMessage="Please Enter Ingedient Quantity" Display="None" ValidationGroup="valIngredients" ControlToValidate="txtIngedientQTY"></asp:RequiredFieldValidator>
            </p>
            <br />
            <p>
                <asp:Label ID="Label2" runat="server" Text="" Width="120px" />
                <asp:TextBox ID="txtOtherIngredient" runat="server" Enabled="false" Text="" Width="200px" MaxLength="40" />
                <asp:Label ID="lblOtherQTY" runat="server" Text="Quantity" Width="65px" />
                <asp:TextBox ID="txtOtherQTY" runat="server" Enabled="false" Text="" Width="100px" MaxLength="40" />
                <asp:RequiredFieldValidator ID="reqOtherIngredient" runat="server" ControlToValidate="txtOtherIngredient" Enabled="false" Display="None" ValidationGroup="valIngredients" ErrorMessage="Please Enter Other Ingredient"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="reqOtherQTY" runat="server" ErrorMessage="Please Enter Other Ingedient Quantity" Display="None" ValidationGroup="valIngredients" ControlToValidate="txtOtherQTY"></asp:RequiredFieldValidator>
            </p>
            <br />
            <asp:Label ID="Label1" runat="server" Text="" Width="200px" />
            <asp:Button ID="btnAddIngredient" runat="server" Text="Add Ingredient" OnClick="btnAddIngredient_Click" />
            <br />
            <p>
                <asp:Label ID="Label3" runat="server" Text="" Width="120px" />
                <asp:GridView ID="gvIngredients" AutoGenerateColumns="false" runat="server" OnRowDeleting="gvIngredients_RowDeleting">
                    <Columns>
                        <asp:BoundField HeaderText="Ingredient_Name" DataField="INGREDIENT_NAME" />
                        <asp:BoundField HeaderText="Quantity" DataField="INGREDIENT_Quantity" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </p>
            <br />
            <p>
                <asp:Label ID="lblDesc" runat="server" Text="Description*" Width="120px" CssClass="LabelCSS" />&nbsp;
                <asp:TextBox ID="txtRecipeDescription" TextMode="MultiLine" Width="380px" Rows="10" Columns="47" CssClass="TextBoxCSS" runat="server" Text=""
                    MaxLength="1000" />
                <asp:RequiredFieldValidator ID="reqDescription" runat="server" ErrorMessage="Please enter Description" Display="None" ControlToValidate="txtRecipeDescription"></asp:RequiredFieldValidator>
            </p>
            <br />
            <p style="flex-item-align: start; width: 340px;">
                <asp:CheckBox ID="chkPrivate" runat="server" />
                <asp:Label ID="lblPrivate" runat="server" Text="Private Recipe" Width="250px" />
            </p>
            <br />
            <asp:Button ID="btnSave" runat="server" Text="Save Recipe" OnClick="btnSave_Click" />
        </fieldset>
    </div>
</asp:Content>
