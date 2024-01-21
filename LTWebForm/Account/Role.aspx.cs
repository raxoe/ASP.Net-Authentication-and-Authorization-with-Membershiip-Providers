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
    public partial class Role : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRolesDetails();
            }
        }
        // This Method is used to bind roles
        protected void BindRolesDetails()
        {
            gvRoles.DataSource = Roles.GetAllRoles();
            gvRoles.DataBind();
        }
        // This Button Click event is used to Create new Role
        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string roleName = txtRole.Text.Trim();
            if (!Roles.RoleExists(roleName))
            {
                Roles.CreateRole(roleName);
                lblResult.Text = roleName + " Role Created Successfully";
                lblResult.ForeColor = Color.Green;
                txtRole.Text = string.Empty;
                BindRolesDetails();
            }
            else
            {
                txtRole.Text = string.Empty;
                lblResult.Text = roleName + " Role already exists";
                lblResult.ForeColor = Color.Red;
            }
        }
        // This RowDeleting event is used to delete Roles
        protected void gvRoles_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lableRole = (Label)gvRoles.Rows[e.RowIndex].FindControl("lblRole");
            Roles.DeleteRole(lableRole.Text, false);
            lblResult.ForeColor = Color.Green;
            lblResult.Text = lableRole.Text + " Role Deleted Successfully";
            BindRolesDetails();
        }
    }
}