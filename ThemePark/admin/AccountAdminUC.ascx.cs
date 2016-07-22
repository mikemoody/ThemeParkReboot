using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.Entity;

public partial class admin_AccountAdminUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // See below.
        Rebind();
    }

    protected void Rebind()
    {
        try
        {
            ReviewEntities re = new ReviewEntities();

            // Get the user names, email addresses, and locked out status. Roles are added using custom fields
            // in the markup for the GridView control. Use Skip and Take to only get five rcords at a time, for
            // the sake of efficiency.
            var userNamesAndIdsOnly5 = (from un in re.aspnet_Users orderby un.UserName select new { un.UserName, un.UserId }).Skip(Convert.ToInt32(SkipValueHiddenField.Value)).Take(5);
            var joinedQueryOnly5 = (from x in userNamesAndIdsOnly5
                                    join y in re.aspnet_Membership on x.UserId equals y.UserId
                                    select new { x.UserName, y.Email, y.IsLockedOut }).ToList();

            // Track how many records we are currently looking at; this is used to prevent the user from scrolling
            // forever past the last page of records.
            CurrentlyViewedHiddenField.Value = Convert.ToString(joinedQueryOnly5.Count());

            AccountAdminGridView.DataSource = joinedQueryOnly5;
            AccountAdminGridView.DataBind();
        }
        catch (Exception ex)
        {
            ErrorLabel.FormatString = "{0}, an error has occurred: " + ex.Message.ToString();
        }
    }

    protected void AccountAdminGridViewSelectedChanged(object sender, EventArgs e)
    {
        // Put the user name into a hidden field so it can be used elsewhere.
        GridViewRow row = AccountAdminGridView.SelectedRow;
        Label lab = (Label)row.FindControl("GridViewNameLabel");
        UserNameHiddenField.Value = lab.Text;
    }

    protected void LeftButtonClick(object sender, EventArgs e)
    {
        if(Convert.ToInt16(SkipValueHiddenField.Value) >= 5)
        {  
            SkipValueHiddenField.Value = Convert.ToString((Convert.ToInt32(SkipValueHiddenField.Value) - 5));
        }
        Rebind();
    }

    protected void RightButtonClick(object sender, EventArgs e)
    {
        if (Convert.ToInt16(CurrentlyViewedHiddenField.Value) >= 5)
        {
            SkipValueHiddenField.Value = Convert.ToString((Convert.ToInt32(SkipValueHiddenField.Value) + 5));
        }
        Rebind();
    }

    protected void ToggleUserAdminButtonClick(object sender, EventArgs e)
    {
        // Toggle the user's status as an admin. If they become an Admin, they are
        // also removed from the Restricted role.
        if (Membership.GetUser(UserNameHiddenField.Value) != null)
        {
            if (UserNameHiddenField.Value == Membership.GetUser().UserName)
            {
                ErrorLabel.FormatString = "{0}, you may not demote your own account.";
                return;
            }
            if (Roles.IsUserInRole(UserNameHiddenField.Value, "Admin"))
            {
                Roles.RemoveUserFromRole(UserNameHiddenField.Value, "Admin");
                Rebind();
            }
            else
            {
                Roles.AddUserToRole(UserNameHiddenField.Value, "Admin");
                if (Roles.IsUserInRole(UserNameHiddenField.Value, "Restricted"))
                {
                    Roles.RemoveUserFromRole(UserNameHiddenField.Value, "Restricted");
                }
                Rebind();
            }
        }
    }

    protected void ToggleUserRestrictedButtonClick(object sender, EventArgs e)
    {
        // Toggle the user's status as restricted. If they become Restricted, they are
        // also removed from the Admin role.
        if (Membership.GetUser(UserNameHiddenField.Value) != null)
        {
            if (UserNameHiddenField.Value == Membership.GetUser().UserName)
            {
                ErrorLabel.FormatString = "{0}, you may not restrict your own account.";
                return;
            }

            if (Roles.IsUserInRole(UserNameHiddenField.Value, "Restricted"))
            {
                Roles.RemoveUserFromRole(UserNameHiddenField.Value, "Restricted");
                Rebind();
            }
            else
            {
                Roles.AddUserToRole(UserNameHiddenField.Value, "Restricted");
                if (Roles.IsUserInRole(UserNameHiddenField.Value, "Admin"))
                {
                    Roles.RemoveUserFromRole(UserNameHiddenField.Value, "Admin");
                }
                Rebind();
            }
        }
    }

    protected void UnlockUserButtonClick(object sender, EventArgs e)
    {
        // Unlocks a user who has been locked out.
        if (Membership.GetUser(UserNameHiddenField.Value) != null)
        {
            Membership.GetUser(UserNameHiddenField.Value).UnlockUser();
            Rebind();
        }
    }

    protected void DeleteUserButtonClick(object sender, EventArgs e)
    {
        // Deletes a user account. Users cannot delete themselves or admins.
        if (Membership.GetUser(UserNameHiddenField.Value) != null)
        {
            if (UserNameHiddenField.Value == Membership.GetUser().UserName)
            {
                ErrorLabel.FormatString = "{0}, you may not delete your own account.";
                return;
            }

            if(Roles.IsUserInRole(UserNameHiddenField.Value, "Admin"))
            {
                ErrorLabel.FormatString = "{0}, users in the Admin role cannot be deleted. Remove Admin status first.";
            }
            else
            {
                Membership.DeleteUser(UserNameHiddenField.Value, true);
                Rebind();
            }
        }
    }
}