using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_addChapter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int CourseId = 100001; //TODO
        string CourseName = ReadDatabase.CourseInfo(CourseId).CourseName;
        int ChapterNum = ReadDatabase.ChapterInCourse(CourseId).Count+1; //目前要新增第幾章
        lblCourse.Text = CourseName +" 新增第"+ ChapterNum.ToString() + "章";
        ChapterGridView.DataSource = ReadDatabase.ChapterInCourse(CourseId);
        ChapterGridView.DataBind();
    }

    public void uploadChapterAndVideo(Models.ChapterModel chapter)
    {
        string sql = @"INSERT INTO CHAPTER (ChapterNum,CourseId,ChapterName,VideoUrl)
                                    VALUES (@ChapterNum, @CourseId, @ChapterName, @VideoUrl) ";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@ChapterNum", chapter.ChapterNum));
            cmd.Parameters.Add(new SqlParameter("@CourseId", chapter.CourseId));
            cmd.Parameters.Add(new SqlParameter("@ChapterName", chapter.ChapterName));
            cmd.Parameters.Add(new SqlParameter("@VideoUrl", chapter.VideoUrl));
            cmd.ExecuteNonQuery();
            conn.Close();
        }

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        int CourseId = 100001; //TODO
        string CourseName = ReadDatabase.CourseInfo(CourseId).CourseName;
        int ChapterNum = ReadDatabase.ChapterInCourse(CourseId).Count + 1; //目前要新增第幾章
        Models.ChapterModel chapter = new Models.ChapterModel
        {
            ChapterNum = ChapterNum,
            CourseId = CourseId,
            ChapterName = txtChapterName.Text,
            VideoUrl = txtVideoUrl.Text
        };
        try
        {
            uploadChapterAndVideo(chapter);
            Response.Write("<script>alert('章節新增成功')</script>");
        }
        catch
        {
            Response.Write("<script>alert('章節新增失敗')</script>");
        }
    }
}