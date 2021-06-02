using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mainCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int courseId = 100001; //TODO
        lbSchoolName.Text = ReadDatabase.CourseInfo(courseId).School;
        lbCourseName.Text = ReadDatabase.CourseInfo(courseId).CourseName;
        lbTeacherName.Text = ReadDatabase.UserInfo(ReadDatabase.CourseInfo(courseId).Teacher).Name;
        lbCourseCredit.Text = ReadDatabase.CourseInfo(courseId).CourseCredit.ToString() + " 學分";
    }
}