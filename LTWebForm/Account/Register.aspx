<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LTWebForm.Account.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" ContinueDestinationPageUrl="~/Account/ManageUsers">
                <WizardSteps>
                    <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    </asp:CompleteWizardStep>
                </WizardSteps>
            </asp:CreateUserWizard>
        </div>

        <%--Custom Register Form--%>
        <%--<h3>Create New User</h3>
        <asp:Label ID="Msg" ForeColor="maroon" runat="server" />
        <br />
        <table cellpadding="3" border="0">
            <tr>
                <td></td>
                <td colspan="2">
                    <b>Sign Up for New User Account</b>
                </td>
            </tr>
            <tr>
                <td>UserName:</td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rqfUserName" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPwd" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>Confirm Password:</td>
                <td>
                    <asp:TextBox ID="txtCnfPwd" runat="server" TextMode="Password" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="PasswordConfirmRequiredValidator" runat="server" ControlToValidate="txtCnfPwd" ForeColor="red" Display="Dynamic" ErrorMessage="Required" />
                    <asp:CompareValidator ID="PasswordConfirmCompareValidator" runat="server" ControlToValidate="txtCnfPwd" ForeColor="red" Display="Dynamic" ControlToCompare="txtPwd" ErrorMessage="Confirm password must match password." />
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" Display="Static" ErrorMessage="Required" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>Security Question:</td>
                <td>
                    <asp:TextBox ID="txtQuestion" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtQuestion" Display="Static" ErrorMessage="Required" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>Security Answer:</td>
                <td>
                    <asp:TextBox ID="txtAnswer" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAnswer" Display="Static" ErrorMessage="Required" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Create User" OnClick="btnSubmit_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblResult" runat="server" Font-Bold="true" />
                </td>
            </tr>
        </table>--%>

    </form>
</body>
</html>
