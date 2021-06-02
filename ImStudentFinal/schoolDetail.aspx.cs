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
        string schoolName = "元智資管學校";
        lbSchoolName.Text = ReadDatabase.SchoolInfo(schoolName).SchoolName;
        lbSchoolIntro.Text = ReadDatabase.SchoolInfo(schoolName).SchoolIntroduction;
        lbCreditNum.Text = ReadDatabase.SchoolInfo(schoolName).RequiredCredits.ToString();
        TeacherDataList.DataSource = ReadDatabase.CourseAndTeacherInfo(schoolName);
        TeacherDataList.DataBind();
        CourseDataList.DataSource = ReadDatabase.SearchCourseBySchool(schoolName);
        CourseDataList.DataBind();
    }

    protected void applyBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("applySchool.aspx");
    }
}