<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Assignment1.Default" %>

<%@ Register Src="UCLabelText.ascx" TagPrefix="UC1" TagName="LabelText" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<table>
        <tr style="text-align:right;">
            <td>
                <asp:Label ID="lblVisitorCounter" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>                
                <h1><p>Welcome to My <b>CookBook.</b></p></h1> 
                <p>Create your own Cook Book. Just upload your delicious healthy family recipes or personally invented recipes and use them whenever needed.  </p>
                <p><a href="SearchRecipe.aspx">Search your recipes</a> by Recipe Name/ Creator’s Name/ Category/ Cuisine. Also search for your private recipes or recipes from all users who wished to share them.  </p>
                <p>Want to share recipes with the world???? Just make it <b>Public………</b> </p>
                <p><h2><a href="AddRecipe.aspx">Create My CookBook Now…</a></h2> </p>
            </td>
        </tr>
    </table>--%>
    <div>
        <fieldset>
            <asp:Label ID="lblVisitorCounter" runat="server" Text=""></asp:Label>
        </fieldset>

        <fieldset>
            <h1>
                <p>Welcome to My <b>CookBook.</b></p>
            </h1>
            <p>Create your own Cook Book. Just upload your delicious healthy family recipes or personally invented recipes and use them whenever needed.  </p>
            <p><a href="SearchRecipe.aspx" class="link">Search recipes</a> by Recipe Name/ Creator’s Name/ Category/ Cuisine. Also search for your private recipes or recipes from all users who wished to share them.  </p>
            <p>Want to save recipes just for you???? Make it <b>Private………</b> </p>
            <p><h2><a href="AddRecipe.aspx">Create My Recipe Now…</a></h2> </p>
         <%--   <p>New users <a href="#SignUp" class="link">SignUp</a> and Create Your Own CookBook</p>
            <p>Already an user? <a href="#SignIn" class="link">SignIn</a></p>--%>
        </fieldset>
    </div>
   <%-- <div>
        <a name="SignUp">
            <fieldset>
                <legend>SignUp</legend>
                <asp:ValidationSummary ID="vsErrorMessages1" ValidationGroup="SignUp" CssClass="ulValidation" runat="server" />
                <br />              
                <UC1:LabelText runat="server" ID="ucUserName" LabelText="User Name*" />
                <asp:RequiredFieldValidator ID="reqUserName" Display="None" runat="server" ErrorMessage="Please enter User Name." ValidationGroup="SignUp" ControlToValidate="ucUserName$ucTextBox"></asp:RequiredFieldValidator>
                <br />
                <UC1:LabelText runat="server" ID="ucPassword" LabelText="Password*" />
                <asp:RequiredFieldValidator ID="reqPassword" runat="server" Display="None" ErrorMessage="Please enter Password." ValidationGroup="SignUp" ControlToValidate="ucPassword$ucTextBox"></asp:RequiredFieldValidator>
                <br />
                <UC1:LabelText runat="server" ID="ucConfirmPassword" LabelText="ConfirmPassword*" />
                <asp:RequiredFieldValidator ID="reqConfirmPassword" Display="None" runat="server" ErrorMessage="Please enter Confirm Password." ValidationGroup="SignUp" ControlToValidate="ucConfirmPassword$ucTextBox"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="compConfirmPassword" Display="None" runat="server" ControlToCompare="ucPassword$ucTextBox" ValidationGroup="SignUp" ControlToValidate="ucConfirmPassword$ucTextBox" ErrorMessage="Password does not match" ForeColor="Red"></asp:CompareValidator>
                <br />
                <UC1:LabelText runat="server" ID="ucEmail" LabelText="Email*" />
                <asp:RequiredFieldValidator ID="reqEmail" runat="server" Display="None" ErrorMessage="Please enter Email." ValidationGroup="SignUp" ControlToValidate="ucEmail$ucTextBox"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="btnSignUp" runat="server" Text="SignUp" ValidationGroup="SignUp" />
            </fieldset>
        </a>
        <a name="SignIn">
            <fieldset>
                <legend>SignIn</legend>           
                <asp:ValidationSummary ID="vsErrorMessagesSI" ValidationGroup="SignIn" CssClass="ulValidation" runat="server" />
                <br />
                <%--<asp:ValidationSummary ID="vsErrorMessagesSI" runat="server" ForeColor="Red" />--%>
                <%--<UC1:LabelText runat="server" ID="ucUserNameSI" LabelText="User Name*" />
                <asp:RequiredFieldValidator ID="reqUcUserNameSI" Display="None" runat="server" ErrorMessage="Please enter User Name." ValidationGroup="SignIn" ControlToValidate="ucUserNameSI$ucTextBox"></asp:RequiredFieldValidator>
                <br />
                <UC1:LabelText runat="server" ID="ucPasswordSI" LabelText="Password*" />
                <asp:RequiredFieldValidator ID="reqUcPasswordSI" Display="None" runat="server" ErrorMessage="Please enter Password." ValidationGroup="SignIn" ControlToValidate="ucPasswordSI$ucTextBox"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="btnSignIn" runat="server" ValidationGroup="SignIn" Text="SignIn" />

            </fieldset>
        </a>
    </div>--%>
</asp:Content>
