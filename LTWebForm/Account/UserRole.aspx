<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserRole.aspx.cs" Inherits="LTWebForm.Account.UserRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style type="text/css">
        .GridviewDiv {
            font-size: 100%;
            font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helevetica, sans-serif;
            color: #303933;
        }

        Table.Gridview {
            border: solid 1px #df5015;
        }

        .Gridview th {
            color: #FFFFFF;
            border-right-color: #abb079;
            border-bottom-color: #abb079;
            padding: 0.5em 0.5em 0.5em 0.5em;
            text-align: center
        }

        .Gridview td {
            border-bottom-color: #f0f2da;
            border-right-color: #f0f2da;
            padding: 0.5em 0.5em 0.5em 0.5em;
        }

        .Gridview tr {
            color: Black;
            background-color: White;
            text-align: left
        }

        :link, :visited {
            color: #DF4F13;
            text-decoration: none
        }
    </style>

    <div class="GridviewDiv">
        <table align="center">
            <tr>
                <td><b>Select User:</b> </td>
                <td>
                    <asp:DropDownList ID="ddlUsers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUsers_SelectedIndexChanged" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="gvRoles" runat="server" CssClass="Gridview" AutoGenerateColumns="false">
                        <HeaderStyle BackColor="#df5015" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkRole" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Role Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblRole" runat="server" Text="<%#Container.DataItem %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnAssign" runat="server" Text="Assign or UnAssign" OnClick="btnAssign_Click" /></td>
            </tr>
        </table>
        <div align="center">
            <asp:Label ID="lblSuccess" runat="server" Font-Bold="true" />
            <br />
            <asp:Label ID="lblError" runat="server" Font-Bold="true" />
        </div>
    </div>
</asp:Content>
