using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_manageChapter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string teacherAccount = Session["userID"].ToString();
        string schoolName = ReadDatabase.UserInfo(Session["userID"].ToString()).School;
        int courseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        int chapterNum = int.Parse(Server.UrlDecode(Request.QueryString["chapter"]));

        lbSchoolName.Text = schoolName;
        lbCourseName.Text = ReadDatabase.CourseInfo(courseId).CourseName;
        lbChapterName.Text = "第" + chapterNum.ToString() + "章";
        lbChapterName2.Text = ReadDatabase.ChapterInCourse(courseId, chapterNum)[0].ChapterName;

        var viedoUrl = ReadDatabase.ChapterInCourse(courseId, chapterNum)[0].VideoUrl;
        string videoPara = viedoUrl.Substring(viedoUrl.IndexOf("=") + 1);
        string ytrURL = "https://www.youtube.com/embed/" + videoPara + "?rel=0&modestbranding=1";
        playVideo.Attributes.Add("src", ytrURL);

        var courseList = ReadDatabase.ListCourseInSchoolByTeacher(schoolName, teacherAccount); //課程清單
        var chapterList = ReadDatabase.ListAllChapterInCourse(courseId); //章節清單 參數放課程Id

        String html = string.Empty;
        for (int i = 0; i < courseList.Count; i++)
        {
            chapterList = ReadDatabase.ListAllChapterInCourse(int.Parse(courseList[i].Value)); //章節清單 參數放課程Id
            string num = i.ToString();
            html += "<div class=\"accordion-item\">";
            html += " <h2 class=\"accordion-header\" id=\"panelsStayOpen-heading" + num + "\">";
            html += "<button class=\"accordion-button collapsed\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#panelsStayOpen-collapse" + num + "\" aria-expanded=\"true\" aria-controls=\"panelsStayOpen-collapse" + num + "\">";
            html += "<div class=\"accordionFonts\" onclick=\"course(this) \" id =\"" + courseList[i].Value + "\" >" + courseList[i].Text + "<br><br>共" + chapterList.Count.ToString() + "堂";
            html += "</div>";
            html += "</button>";
            html += "</h2>";
            html += "<div id=\"panelsStayOpen-collapse" + num + "\" class=\"accordion-collapse collapse\" aria-labelledby=\"panelsStayOpen-heading" + num + "\">";
            for (int j = 0; j < chapterList.Count; j++)
            {
                html += "<div class=\"accordion-body\">";
                html += "<div type=\"button\" id=\"" + courseList[i].Value + ":" + chapterList[j].Value + "\" onclick=\"test(this)\"><strong>第" + chapterList[j].Value + "章</strong></div>";
                html += "</div>";
            }
            html += "</div>";
            html += "</div>";
            this.accordionPanelsStayOpenExample.Controls.Add(new LiteralControl(html));
            html = string.Empty;
        }
    }

    protected void btnUploadMaterial_Click(object sender, EventArgs e)
    {
        int courseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        int ChapterNum = int.Parse(Server.UrlDecode(Request.QueryString["chapter"]));
        string CourseName = ReadDatabase.CourseInfo(courseId).CourseName;
        string Chapter = "第" + ChapterNum.ToString() + "章";
        if (IsExists.AlreadyUploadMaterial(courseId, ChapterNum))
        {
            Response.Write("<script>alert('這章節已上傳過教材')</script>");
        }
        else
        {
            if (uploadMaterialFile.HasFile)
            {
                string path = "material/" + CourseName + " " + Chapter + "_" + uploadMaterialFile.FileName;
                Models.ChapterModel material = new Models.ChapterModel
                {
                    MaterialFileName = uploadMaterialFile.FileName,
                    MaterialFilePath = path,
                    CourseId = courseId,
                    ChapterNum = ChapterNum
                };
                try
                {
                    UploadMaterial(material);
                    uploadMaterialFile.SaveAs(Server.MapPath(path));
                    Response.Write("<script>alert('教材上傳成功')</script>");
                }
                catch
                {
                    Response.Write("<script>alert('教材上傳失敗')</script>");
                    uploadMaterialFile.Dispose();
                }
            }
            else
            {
                Response.Write("<script>alert('請先上傳教材檔案')</script>");
            }
        }
    }

    public void UploadMaterial(Models.ChapterModel chapter)
    {
        string sql = @"UPDATE CHAPTER SET MaterialFileName = @MaterialFileName, MaterialFilePath = @MaterialFilePath 
                                    WHERE CourseId = @CourseId AND ChapterNum = @ChapterNum";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@MaterialFileName", chapter.MaterialFileName));
            cmd.Parameters.Add(new SqlParameter("@MaterialFilePath", chapter.MaterialFilePath));
            cmd.Parameters.Add(new SqlParameter("@CourseId", chapter.CourseId));
            cmd.Parameters.Add(new SqlParameter("@ChapterNum", chapter.ChapterNum));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}