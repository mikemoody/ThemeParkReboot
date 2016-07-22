using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThemePark
{
    public partial class _Default : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpRequest httpRequest = HttpContext.Current.Request;
            if (httpRequest.Browser.IsMobileDevice)
            {
               
                    string redirectTo = "Mobile2.aspx";



                    HttpContext.Current.Response.Redirect(redirectTo);
                
            }
        }
    }
}