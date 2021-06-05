using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_manageCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int courseId = 100007;//int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        lbCourseName.Text = ReadDatabase.CourseInfo(courseId).CourseName;
        lbTeacherName.Text = ReadDatabase.UserInfo(ReadDatabase.CourseInfo(courseId).Teacher).Name;
        lbCourseCredit.Text = ReadDatabase.CourseInfo(courseId).CourseCredit.ToString() + " 學分";
        lbSchoolName.Text = ReadDatabase.CourseInfo(courseId).School;
    }

    protected void editBtn_Click(object sender, EventArgs e)
    {
        int courseId = 100007; //int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        Response.Redirect("addCourse.aspx?act=edit&courseId=" + courseId);
    }
}