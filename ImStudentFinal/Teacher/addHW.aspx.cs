using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HomeWork : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int courseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        lblHomeWork.Text = ReadDatabase.CourseInfo(courseId).CourseName + " 新增作業";
        int semesterDays = ReadDatabase.SchoolInfo(ReadDatabase.CourseInfo(courseId).School).SemesterDays;
        lblDeadLine.Text = "*設定繳交期限(本學期共有" + semesterDays + "天)：";
    }

    public void AddHomeWork(Models.CourseModel course)
    {
        string sql = @"UPDATE COURSE SET HWName= @HWName, HWDetail= @HWDetail, HWDeadlineDays=@HWDeadlineDays WHERE CourseId=@CourseId";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@HWName", course.HWName));
            cmd.Parameters.Add(new SqlParameter("@HWDetail", course.HWDetail));
            cmd.Parameters.Add(new SqlParameter("@HWDeadlineDays", course.HWDeadlineDays));
            cmd.Parameters.Add(new SqlParameter("@CourseId", course.CourseId));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }

    protected void btnAddHW_Click(object sender, EventArgs e)
    {
        int courseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        int semesterDays = ReadDatabase.SchoolInfo(ReadDatabase.CourseInfo(courseId).School).SemesterDays;
        if (int.Parse(txtHWDeadlineDays.Text) > semesterDays) 
        {
            Response.Write("<script>alert('繳交期限不能超過學期天數');</script>");
        }
        else
        {
            Models.CourseModel HWPost = new Models.CourseModel
            {
                HWName = txtHWName.Text,
                HWDetail = txtHWDetail.Text,
                HWDeadlineDays = int.Parse(txtHWDeadlineDays.Text),
                CourseId = courseId
            };
            try
            {
                AddHomeWork(HWPost);
                Response.Write("<script>alert('作業新增成功');location.href='manageCourse.aspx?courseId=" + courseId + "';</script>");
            }
            catch
            {
                Response.Write("<script>alert('作業新增失敗');</script>");
            }
        }
    }
}