using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_schoolInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string teacherAccount = Session["userID"].ToString();
        string school = ReadDatabase.UserInfo(teacherAccount).School;
        lbSchoolName.Text = school;
        lbPrincipalName.Text = ReadDatabase.UserInfo(ReadDatabase.SchoolInfo(school).Principal).Name;
        lbSchoolIntro.Text = ReadDatabase.SchoolInfo(school).SchoolIntro;
        lbSchoolDays.Text = ReadDatabase.SchoolInfo(school).SemesterDays.ToString() + "天";
        var courseList = ReadDatabase.ListCourseInSchoolByTeacher(school, teacherAccount);
        String html = string.Empty;

        for (int i = 0; i < courseList.Count; i++)
        {
            var chapterList = ReadDatabase.ListAllChapterInCourse(int.Parse(courseList[i].Value)); //章節清單 參數放課程Id
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

    protected void addCourse_Click(object sender, EventArgs e)
    {
        Response.Redirect("addCourse.aspx?act=add");
    }
}