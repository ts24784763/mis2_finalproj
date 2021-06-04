using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string searchWord = txtSearch.Text;
        DataListSchoolInfo.DataSource = ReadDatabase.SearchSchoolByWord(searchWord);
        DataListSchoolInfo.DataBind();
    }

    protected void btnApplyOutCome_Click(object sender, EventArgs e)
    {
        Response.Redirect("applyResult.aspx");
    }
}