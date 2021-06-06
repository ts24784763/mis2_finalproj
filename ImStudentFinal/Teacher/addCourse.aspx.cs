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
        string act = Server.UrlDecode(Request.QueryString["act"]);
        string userSession = Session["userID"].ToString();
        string school = ReadDatabase.UserInfo(userSession).School;
        if (act == "add")
        {
            lbCourse.Text = "在 " + school + " 新增課程";
            btnSubmit.Text = "新增課程";
        }
        else if (act == "edit")
        {
            int courseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
            lbCourse.Text = "編輯" + ReadDatabase.CourseInfo(courseId).CourseName;
            btnSubmit.Text = "送出編輯";
        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        string act = Server.UrlDecode(Request.QueryString["act"]);
        if (act == "edit")
        {
            int courseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
            txtCourseName.Text = ReadDatabase.CourseInfo(courseId).CourseName;
            txtCourseInfo.Text = ReadDatabase.CourseInfo(courseId).CourseIntro;
            foreach (ListItem item in this.RadioCredit.Items)
            {
                if (item.Text == ReadDatabase.CourseInfo(courseId).CourseCredit.ToString()) item.Selected = true;
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string userSession = Session["userID"].ToString();
        string act = Server.UrlDecode(Request.QueryString["act"]);
        string school = ReadDatabase.UserInfo(userSession).School;
        Models.CourseModel course = new Models.CourseModel
        {
            CourseName = txtCourseName.Text,
            CourseIntro = txtCourseInfo.Text,
            CourseCredit = int.Parse(RadioCredit.Text),
            Teacher = userSession,
            School = school,
        };
        if (act == "add")
        {
            try
            {
                int courseId = AddCourse(course);
                Response.Write("<script>alert('課程新增成功');location.href='manageCourse.aspx?courseId=" + courseId + "';</script>");
            }
            catch
            {
                Response.Write("<script>alert('課程新增失敗')</script>");
            }
        }
        else if (act == "edit")
        {
            int courseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
            try
            {
                EditCourse(course);
                Response.Write("<script>alert('課程編輯成功');location.href='manageCourse.aspx?courseId=" + courseId + "';</script>");
            }
            catch
            {
                Response.Write("<script>alert('課程編輯失敗')</script>");
            }
        }
    }

    public int AddCourse(Models.CourseModel course)
    {
        int courseId = 0;
        string sql = @"INSERT INTO COURSE (CourseName, CourseIntro, CourseCredit, Teacher, School)
			                        VALUES (@CourseName, @CourseIntro, @CourseCredit, @Teacher, @School)
                        SELECT SCOPE_IDENTITY() ";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@CourseName", course.CourseName));
            cmd.Parameters.Add(new SqlParameter("@CourseIntro", course.CourseIntro));
            cmd.Parameters.Add(new SqlParameter("@CourseCredit", course.CourseCredit));
            cmd.Parameters.Add(new SqlParameter("@Teacher", course.Teacher));
            cmd.Parameters.Add(new SqlParameter("@School", course.School));
            courseId = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
        }
        return courseId;
    }

    public void EditCourse(Models.CourseModel course)
    {
        string sql = @"UPDATE COURSE SET CourseName = @CourseName, CourseIntro = @CourseIntro, CourseCredit = @CourseCredit 
                       WHERE CourseId = @CourseId ";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@CourseName", course.CourseName));
            cmd.Parameters.Add(new SqlParameter("@CourseIntro", course.CourseIntro));
            cmd.Parameters.Add(new SqlParameter("@CourseCredit", course.CourseCredit));
            cmd.Parameters.Add(new SqlParameter("@CourseId", course.CourseId));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}