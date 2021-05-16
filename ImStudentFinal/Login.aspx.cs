using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }


    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
        {
            emailValidator.Enabled = false;
            passwordValidator.Enabled = false;
        }
        Response.Redirect("register.aspx");
    }
}