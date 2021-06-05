using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class schoolDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string schoolName = Server.UrlDecode(Request.QueryString["school"]);
        lbSchoolName.Text = ReadDatabase.SchoolInfo(schoolName).SchoolName;
        lbSchoolIntro.Text = ReadDatabase.SchoolInfo(schoolName).SchoolIntro;
        lbCreditNum.Text = ReadDatabase.SchoolInfo(schoolName).RequiredCredits.ToString();
        TeacherDataList.DataSource = ReadDatabase.CourseInSchool(schoolName, "");
        TeacherDataList.DataBind();
        CourseDataList.DataSource = ReadDatabase.SearchCourseBySchool(schoolName);
        CourseDataList.DataBind();
    }

    protected void applyBtn_Click(object sender, EventArgs e)
    {
        string schoolName = Server.UrlDecode(Request.QueryString["school"]);
        if (IsExists.AlreadyApply(Session["userID"].ToString(), schoolName))
            Response.Write("<script>alert('已申請過此學校')</script>");
        else
            Response.Redirect("applySchool.aspx?school="+ schoolName);
    }
}