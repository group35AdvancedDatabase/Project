using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ViewState["Counter"] == null)
                {
                    ViewState.Add("Counter", 1);
                    lblVisitorCounter.Text = "Congrats! You are the first viewer of this site";
                }
                else
                {
                    int counter = (int)ViewState["Counter"];
                    counter = counter + 1;
                    lblVisitorCounter.Text = counter + " viewers visited this site";
                    ViewState.Add("Counter", counter);

                }
            }

        }
    }
}