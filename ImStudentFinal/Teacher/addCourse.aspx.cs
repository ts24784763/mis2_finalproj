using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDropdownlistData();
        }
    }

    public void LoadDropdownlistData()
    {
        //學分數
        ddlCredit.Items.Clear();
        ddlCredit.Items.Add(new ListItem("", ""));
        ddlCredit.Items.Add(new ListItem("1", "1"));
        ddlCredit.Items.Add(new ListItem("2", "2"));
        ddlCredit.Items.Add(new ListItem("3", "3"));
        ddlCredit.Items.Add(new ListItem("4", "4"));
        ddlCredit.Items.Add(new ListItem("5", "5"));
    }
}