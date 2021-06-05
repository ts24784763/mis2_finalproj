using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applyOutcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string studentAccount = Session["userID"].ToString();
        StudentResumeDataList.DataSource = ReadDatabase.studentApplySchool(studentAccount, "");
        StudentResumeDataList.DataBind();
    }
}