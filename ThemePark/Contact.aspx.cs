using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ThemePark
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Displaytext DT = new Displaytext();
            HeaderDisplay.Text = DT.getDisplayText();

            HeaderDisplay2.Text = DT.getDisplayText();

            localhost.WebService1 xmlwebservice = new localhost.WebService1();
            HeaderDisplay.Text = xmlwebservice.HelloWorld();
        }


    }

    public class Displaytext
    {
        public string getDisplayText() {
            return "Welcome to the Contact Us Theme Park Page";
        }
    }
}
