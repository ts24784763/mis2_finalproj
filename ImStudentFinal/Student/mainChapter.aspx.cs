using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
public partial class subCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string schoolName = ReadDatabase.UserInfo(Session["userID"].ToString()).School;
        string urlChapter = Server.UrlDecode(Request.QueryString["chapter"]);
        string urlCourseId = Server.UrlDecode(Request.QueryString["courseId"]);
        int courseId = int.Parse(urlCourseId);
        int chapterId = int.Parse(urlChapter);
        lbSchoolName.Text = schoolName;
        lbCourseName.Text = ReadDatabase.CourseInfo(int.Parse(urlCourseId)).CourseName;
        lbChapterName.Text = "第" + urlChapter + "章";
        lbChapterName2.Text = "第" + urlChapter + "章";
        var viedoUrl = ReadDatabase.ChapterInCourse(courseId, chapterId)[0].VideoUrl;
        string videoPara = viedoUrl.Substring(viedoUrl.IndexOf("=")+1);
        string ytrURL = "https://www.youtube.com/embed/" + videoPara + "?rel=0&modestbranding=1";
        playVideo.Attributes.Add("src", ytrURL);
        var courseList = ReadDatabase.ListAllCourseInSchool(schoolName); //課程清單
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

    protected void download_Click(object sender, EventArgs e)
    {
        string resumePath = "../Teacher/material/" + ((Button)sender).CommandArgument;
        string resumeFileName = ((Button)sender).CommandArgument.Substring(((Button)sender).CommandArgument.IndexOf("/"));
        Response.ContentType = resumePath;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + resumeFileName);

        // Write the file to the Response  
        const int bufferLength = 10000;
        byte[] buffer = new Byte[bufferLength];
        int length = 0;
        Stream download = null;
        try
        {
            download = new FileStream(Server.MapPath(resumePath), FileMode.Open, FileAccess.Read);
            do
            {
                if (Response.IsClientConnected)
                {
                    length = download.Read(buffer, 0, bufferLength);
                    Response.OutputStream.Write(buffer, 0, length);
                    buffer = new Byte[bufferLength];
                }
                else
                {
                    length = -1;
                }
            }
            while (length > 0);
            Response.Flush();
            Response.End();
        }
        finally
        {
            if (download != null)
                download.Close();
        }

    }
}
