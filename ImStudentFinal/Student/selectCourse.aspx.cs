using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class selectCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGridViewData();
        }
    }

    private void LoadGridViewData()
    {
        //string schoolName = Server.UrlDecode(Request.QueryString["school"]);
        string schoolName = "元智資管學校";

        GVCourse.DataSource = ReadDatabase.CourseInSchool(schoolName);
        GVCourse.DataBind();
        //不顯示的colums 在此設定
        for (int co = 1; co <= 3; co += 2)
        {
            GVCourse.HeaderRow.Cells[co].Visible = false;
            for (int i = 0; i < GVCourse.Rows.Count; i++)
            {
                GVCourse.Rows[i].Cells[co].Visible = false;
            }
        }
        //表頭名稱設定
        GVCourse.HeaderRow.Cells[2].Text = "課程名稱";
        GVCourse.HeaderRow.Cells[4].Text = "教授姓名";
        GVCourse.HeaderRow.Cells[5].Text = "學分數";
    }

    protected void searchBtn_Click(object sender, EventArgs e)
    {
        string StrCourseName = courseName.Text.Trim();
        string StrProfessorrName = professorName.Text.Trim();

        GVCourse.DataSource = ReadDatabase.SearchCourseByWord(StrCourseName, StrProfessorrName);
        GVCourse.DataBind();

        //不顯示的colums 在此設定
        for (int co = 1; co <= 3; co += 2)
        {
            GVCourse.HeaderRow.Cells[co].Visible = false;
            for (int i = 0; i < GVCourse.Rows.Count; i++)
            {
                GVCourse.Rows[i].Cells[co].Visible = false;
            }
        }
        //表頭名稱設定
        GVCourse.HeaderRow.Cells[2].Text = "課程名稱";
        GVCourse.HeaderRow.Cells[4].Text = "教授姓名";
        GVCourse.HeaderRow.Cells[5].Text = "學分數";
    }
}