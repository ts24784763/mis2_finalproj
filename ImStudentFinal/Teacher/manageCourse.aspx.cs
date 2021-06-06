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
        string schoolName = ReadDatabase.UserInfo(Session["userID"].ToString()).School;
        int courseId = 100007;//int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        lbCourseName.Text = ReadDatabase.CourseInfo(courseId).CourseName;
        lbTeacherName.Text = ReadDatabase.UserInfo(ReadDatabase.CourseInfo(courseId).Teacher).Name;
        lbCourseCredit.Text = ReadDatabase.CourseInfo(courseId).CourseCredit.ToString() + " 學分";
        var courseList = ReadDatabase.ListAllCourseInSchool(schoolName); //課程清單
        var chapterList = ReadDatabase.ListAllChapterInCourse(100001); //章節清單 參數放課程Id
        lbSchoolName.Text = ReadDatabase.CourseInfo(courseId).School;
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

    protected void editBtn_Click(object sender, EventArgs e)
    {
        int courseId = 100007; //int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        Response.Redirect("addCourse.aspx?act=edit&courseId=" + courseId);
    }
}