<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="Assignment1.CreateUser" %>

<%@ Register Src="UCLabelText.ascx" TagPrefix="UC1" TagName="LabelText" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset>
                <asp:ValidationSummary ID="vsErrorMessages1" runat="server" />
            </fieldset>
            <fieldset>
                <legend>SignIn</legend>
                <br />
                <UC1:LabelText runat="server" ID="ucUserName" LabelText="User Name*" />
                <asp:RequiredFieldValidator ID="reqUserName" runat="server" ErrorMessage="Please enter User Name." ControlToValidate="ucUserName$ucTextBox"></asp:RequiredFieldValidator>
                <br />
                <UC1:LabelText runat="server" ID="ucPassword" LabelText="Password*" />
                <asp:RequiredFieldValidator ID="reqPassword" runat="server" ErrorMessage="Please enter Password." ControlToValidate="ucPassword$ucTextBox"></asp:RequiredFieldValidator>
                <br />
                <UC1:LabelText runat="server" ID="ucEmail" LabelText="Password*" />
                <asp:RequiredFieldValidator ID="reqEmail" runat="server" ErrorMessage="Please enter Email." ControlToValidate="ucEmail$ucTextBox"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="btnSignUp" runat="server" Text="SignUp" />
            </fieldset>
            <fieldset>
                <legend>SignUp</legend>
                <UC1:LabelText runat="server" ID="ucUserNameSI" LabelText="User Name*" />
                <asp:RequiredFieldValidator ID="reqUcUserNameSI" runat="server" ErrorMessage="Please enter User Name." ControlToValidate="ucUserNameSI$ucTextBox"></asp:RequiredFieldValidator>
                <br />
                <UC1:LabelText runat="server" ID="ucPasswordSI" LabelText="Password*" />
                <asp:RequiredFieldValidator ID="reqUcPasswordSI" runat="server" ErrorMessage="Please enter Password." ControlToValidate="ucPasswordSI$ucTextBox"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="btnSignIn" runat="server" Text="SignIn" />
            </fieldset>
        </div>
    </form>
</body>
</html>
