using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LTWebForm.Account
{
    public partial class UserRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserDetails();
                BindRoles();
            }
        }
        // Bind User Names to Dropdownlist
        protected void BindUserDetails()
        {
            ddlUsers.DataSource = Membership.GetAllUsers();
            ddlUsers.DataTextField = "UserName";
            ddlUsers.DataValueField = "UserName";
            ddlUsers.DataBind();
            ddlUsers.Items.Insert(0, new ListItem("--Select User--", "0"));
        }
        // Bind Roles to Gridview
        protected void BindRoles()
        {
            gvRoles.DataSource = Roles.GetAllRoles();
            gvRoles.DataBind();
        }
        // This event is used to assign roles to particular user
        protected void btnAssign_Click(object sender, EventArgs e)
        {
            string userName = ddlUsers.SelectedItem.Text;
            string[] userRoles = Roles.GetRolesForUser(userName);
            string errorMessage = string.Empty;
            string successMessage = string.Empty;
            string roleName = string.Empty;
            int i = 0;
            int j = 0;
            foreach (GridViewRow gvrow in gvRoles.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("chkRole");
                Label lbl = (Label)gvrow.FindControl("lblRole");
                roleName = lbl.Text;
                if (chk.Checked)
                {
                    int index = Array.IndexOf(userRoles, roleName);
                    if (index == -1)
                    {
                        Roles.AddUserToRole(userName, roleName);
                        successMessage += roleName + ", ";
                        j++;
                    }
                }
                else
                {
                    int index = Array.IndexOf(userRoles, roleName);
                    if (index > -1)
                    {
                        // Remove the user from the role
                        Roles.RemoveUserFromRole(userName, roleName);
                        errorMessage += roleName + ", ";
                        i++;
                    }
                }
            }
            if (errorMessage != string.Empty)
            {
                if (i > 1)
                {
                    lblError.Text = userName + " was removed from roles " + errorMessage.Substring(0, errorMessage.Length - 2);
                }
                else
                {
                    lblError.Text = userName + " was removed from role " + errorMessage.Substring(0, errorMessage.Length - 2);
                }
                lblError.ForeColor = Color.Red;
            }
            else
            {
                lblError.Text = string.Empty;
            }
            if (successMessage != string.Empty)
            {
                if (j > 1)
                {
                    lblSuccess.Text = successMessage.Substring(0, successMessage.Length - 2) + " roles assigned to " + userName;
                }
                else
                {
                    lblSuccess.Text = successMessage.Substring(0, successMessage.Length - 2) + " role assigned to " + userName;
                }
                lblSuccess.ForeColor = Color.Green;
            }
            else
            {
                lblSuccess.Text = string.Empty;
            }
        }
        // This event is used to populate checkboxes based on roles for particular user
        protected void ddlUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSuccess.Text = string.Empty;
            lblError.Text = string.Empty;
            string userName = ddlUsers.SelectedItem.Text;
            string[] userRoles = Roles.GetRolesForUser(userName);
            string rolename = string.Empty;
            foreach (GridViewRow gvrow in gvRoles.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("chkRole");
                Label lbl = (Label)gvrow.FindControl("lblRole");
                rolename = lbl.Text;
                int index = Array.IndexOf(userRoles, rolename);
                if (index > -1)
                {
                    chk.Checked = true;
                }
                else
                {
                    chk.Checked = false;
                }
            }
        }
    }
}