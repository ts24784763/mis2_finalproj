using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userSession = "hsieh";
        string school = ReadDatabase.UserInfo(userSession).School;
        lbCourse.Text = "在 " + school + " 新增課程";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string userSession = "hsieh";
        string school = ReadDatabase.UserInfo(userSession).School;
        Models.CourseModel course = new Models.CourseModel
        {
            CourseName = txtCourseName.Text,
            CourseIntro = txtCourseInfo.Text,
            CourseCredit = int.Parse(RadioCredit.Text),
            Teacher = userSession,
            School = school,
        };
        try
        {
            AddCourse(course);
            Response.Write("<script>alert('課程新增成功')</script>");
        }
        catch
        {
            Response.Write("<script>alert('課程新增失敗')</script>");
        }

    }

    public void AddCourse(Models.CourseModel course)
    {
        string sql = @"INSERT INTO COURSE (CourseName, CourseIntro, CourseCredit, Teacher, School)
			                        VALUES (@CourseName, @CourseIntro, @CourseCredit, @Teacher, @School)";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@CourseName", course.CourseName));
            cmd.Parameters.Add(new SqlParameter("@CourseIntro", course.CourseIntro));
            cmd.Parameters.Add(new SqlParameter("@CourseCredit", course.CourseCredit));
            cmd.Parameters.Add(new SqlParameter("@Teacher", course.Teacher));
            cmd.Parameters.Add(new SqlParameter("@School", course.School));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }

}