using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mainCourse : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        string studentAccount = Session["userID"].ToString();
        string schoolName = ReadDatabase.UserInfo(studentAccount).School;
        int courseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        lbSchoolName.Text = ReadDatabase.CourseInfo(courseId).School;
        lbCourseName.Text = ReadDatabase.CourseInfo(courseId).CourseName;
        lbTeacherName.Text = ReadDatabase.UserInfo(ReadDatabase.CourseInfo(courseId).Teacher).Name;
        lbCourseCredit.Text = ReadDatabase.CourseInfo(courseId).CourseCredit.ToString() + " 學分";
        lbCourseIntro.Text = ReadDatabase.CourseInfo(courseId).CourseIntro;

        lbHW.Text = ReadDatabase.CourseInfo(courseId).HWName;
        lbHWDetail.Text = ReadDatabase.CourseInfo(courseId).HWDetail;
        int deadLineDays = ReadDatabase.CourseInfo(courseId).HWDeadlineDays;
        DateTime deadlineDate = Convert.ToDateTime(ReadDatabase.SchoolInfo(schoolName).OpenSemesterDate).AddDays(deadLineDays);
        lbDeadline.Text = deadlineDate.ToString("yyyy-MM-dd");

        string passString = ReadDatabase.CourseSelectionInfo(studentAccount, courseId).PassOrNot;
        if (passString == "") lbHWPass.Text = "尚未批改";
        else lbHWPass.Text = passString;
        var courseList = ReadDatabase.ListAllCourseByStudent(studentAccount); //課程清單
        var chapterList = ReadDatabase.ListAllChapterInCourse(courseId);
        String html = string.Empty;

        for (int i = 0; i < courseList.Count; i++)
        {
            chapterList = ReadDatabase.ListAllChapterInCourse(int.Parse(courseList[i].Value)); //章節清單 參數放課程Id
            string num = i.ToString();
            html += "<div class=\"accordion-item\">";
            html += " <h2 class=\"accordion-header\" id=\"panelsStayOpen-heading" + num + "\">";
            html += "<button class=\"accordion-button collapsed\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#panelsStayOpen-collapse" + num + "\" aria-expanded=\"true\" aria-controls=\"panelsStayOpen-collapse" + num + "\">";
            html += "<div class=\"accordionFonts\" onclick=\"courseChange(this) \" id =\"" + courseList[i].Value + "\" >" + courseList[i].Text + "<br><br>共" + chapterList.Count.ToString() + "堂";
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
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void uploadHomework_Click(object sender, EventArgs e)
    {
        string schoolName = ReadDatabase.UserInfo(Session["userID"].ToString()).School;
        int courseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        string student = ReadDatabase.UserInfo(Session["userID"].ToString()).Name;
        if (IsExists.AlreadyUploadHW(Session["userID"].ToString(), courseId))
        {
            Response.Write("<script>alert('你已繳交過這份作業')</script>");
        }
        else
        {
            if (uploadHW.HasFile)
            {
                string path = "homeWork/" + schoolName + " " + ReadDatabase.CourseInfo(courseId).CourseName + " " + student + "_" + uploadHW.FileName;
                Models.CourseSelectionModel model = new Models.CourseSelectionModel
                {
                    Student = Session["userID"].ToString(),
                    CourseId = courseId,
                    HWFileName = uploadHW.FileName,
                    HWFilePath = path,
                };
                try
                {
                    studentUploadHW(model);
                    uploadHW.SaveAs(Server.MapPath(path));
                    Response.Write("<script>alert('繳交作業成功')</script>");
                }
                catch
                {
                    Response.Write("<script>alert('繳交作業失敗')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('請先上傳作業')</script>");
            }
        }
    }

    public void studentUploadHW(Models.CourseSelectionModel model)
    {
        string sql = @"UPDATE COURSE_SELECTION SET HWFileName = @HWFileName, HWFilePath = @HWFilePath, HWUploadTime = GETDATE() 
                        WHERE Student = @Student AND CourseId = @CourseId";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@HWFileName", model.HWFileName));
            cmd.Parameters.Add(new SqlParameter("@HWFilePath", model.HWFilePath));
            cmd.Parameters.Add(new SqlParameter("@Student", model.Student));
            cmd.Parameters.Add(new SqlParameter("@CourseId", model.CourseId));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
} 