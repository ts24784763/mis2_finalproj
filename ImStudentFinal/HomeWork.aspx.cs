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

    }

    protected void CalDate_SelectionChanged(object sender, EventArgs e)
    {
        
    }

    public void AddHomeWork(Models.HWPostModel HWPost)
    {
        string sql = @"INSERT INTO HW_POST (HomeWorkName, HomeWorkDetail, Deadline, CourseId)
                                VALUES ( @HomeWorkName, @HomeWorkDetail, @Deadline, @CourseId)";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@HomeWorkName", HWPost.HomeWorkName));
            cmd.Parameters.Add(new SqlParameter("@HomeWorkDetail", HWPost.HomeWorkDetail));
            cmd.Parameters.Add(new SqlParameter("@Deadline", HWPost.Deadline));
            cmd.Parameters.Add(new SqlParameter("@CourseId", HWPost.CourseId));
            cmd.ExecuteNonQuery();
            conn.Close();
        }

    }

    protected void btnAddHW_Click(object sender, EventArgs e)
    {
        int courseId = 100001; //TODO
        Models.HWPostModel HWPost = new Models.HWPostModel
        {
            HomeWorkName = txtHWName.Text,
            HomeWorkDetail = txtHWDetail.Text,
            Deadline = Convert.ToDateTime(CalDate.SelectedDate.ToString()),
            CourseId = courseId
        };
        try
        {
            AddHomeWork(HWPost);
            Response.Write("<script>alert('作業新增成功')</script>");
        }
        catch
        {
            Response.Write("<script>alert('作業新增失敗');</script>");
        }
    }
}