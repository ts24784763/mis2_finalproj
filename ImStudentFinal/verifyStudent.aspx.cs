using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verifyStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string schoolName = "元智資管學校";
        StudentResumeDataList.DataSource = ReadDatabase.StudentResumeInfo(schoolName);
        StudentResumeDataList.DataBind();
    }
}