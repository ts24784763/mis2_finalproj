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
        string teacherAccount = Session["userID"].ToString();
        string schoolName = ReadDatabase.UserInfo(teacherAccount).School;
        int courseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        lbCourseName.Text = ReadDatabase.CourseInfo(courseId).CourseName;
        lbTeacherName.Text = ReadDatabase.UserInfo(ReadDatabase.CourseInfo(courseId).Teacher).Name;
        lbCourseCredit.Text = ReadDatabase.CourseInfo(courseId).CourseCredit.ToString() + " 學分";
        lbCourseIntro.Text = ReadDatabase.CourseInfo(courseId).CourseIntro;
        var courseList = ReadDatabase.ListCourseInSchoolByTeacher(schoolName, teacherAccount); //課程清單
        var chapterList = ReadDatabase.ListAllChapterInCourse(courseId); //章節清單 參數放課程Id
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

        if (IsExists.CourseHaveHW(courseId))
        {
            addHomework.Visible = false;
            lbHWName.Visible = true;
            lbHWDetail.Visible = true;
            lbHWDeadline.Visible = true;
            lbHWName.Text += ReadDatabase.CourseInfo(courseId).HWName;
            lbHWDetail.Text += ReadDatabase.CourseInfo(courseId).HWDetail;
            lbHWDeadline.Text += ReadDatabase.CourseInfo(courseId).HWDeadlineDays + "天";
        }
        else
        {
            addHomework.Visible = true;
            lbHWName.Visible = false;
            lbHWDetail.Visible = false;
            lbHWDeadline.Visible = false;
        }
    }

    protected void editBtn_Click(object sender, EventArgs e)
    {
        int courseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        Response.Redirect("addCourse.aspx?act=edit&courseId=" + courseId);
    }

    protected void addHomework_Click(object sender, EventArgs e)
    { 
        int courseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        Response.Redirect("addHW.aspx?courseId=" + courseId);
    }

    protected void btnAddChapter_Click(object sender, EventArgs e)
    {
        int courseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        Response.Redirect("addChapter.aspx?courseId=" + courseId);
    }

    protected void checkHwBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("../Teacher/checkHW.aspx");
    }
}