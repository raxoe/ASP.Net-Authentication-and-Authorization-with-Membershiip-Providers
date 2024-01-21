using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LTWebForm
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void UserInfo()
        {
            MembershipUser currentUser = Membership.GetUser();
            //Get Username of Currently logged in user
            string username = currentUser.UserName;
            //Get UserId of Currently logged in user
            string UserId = currentUser.ProviderUserKey.ToString();
        }
    }
}