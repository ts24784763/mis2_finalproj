using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_schoolInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string teacherAccount = Session["userID"].ToString();
        string school = ReadDatabase.UserInfo(teacherAccount).School;
        lbSchoolName.Text = school;
        lbPrincipalName.Text = ReadDatabase.UserInfo(ReadDatabase.SchoolInfo(school).Principal).Name;
        lbSchoolIntro.Text = ReadDatabase.SchoolInfo(school).SchoolIntro;
        lbSchoolDays.Text = ReadDatabase.SchoolInfo(school).SemesterDays.ToString() + "天";

        var courseList = ReadDatabase.ListCourseInSchoolByTeacher(school, teacherAccount);
        var chapterList = ReadDatabase.ListAllChapterInCourse(100001); //章節清單 參數放課程Id
    }

    protected void addCourse_Click(object sender, EventArgs e)
    {
        Response.Redirect("addCourse.aspx?act=add");
    }
}