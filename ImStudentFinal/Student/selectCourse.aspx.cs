using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class selectCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string student = Session["userID"].ToString();
        int SumCredit = ReadDatabase.SumCredit(student).Credit;
        int RequiredCredits = ReadDatabase.SchoolInfo(ReadDatabase.UserInfo(student).School).RequiredCredits;
        if (!IsPostBack)
        {
            LoadGridViewData();
        }
        lbTitle.Text = "在" + ReadDatabase.UserInfo(Session["userID"].ToString()).School + "選課";
        checkCreditSum.Text = "已選擇學分：  " + SumCredit + "/"+ RequiredCredits + "  學分";
    }

    private void LoadGridViewData()
    {
        string student = Session["userID"].ToString();
        GVCourse.DataSource = ReadDatabase.CourseStudentNotSelect(student);
        GVCourse.DataBind();
        if (ReadDatabase.CourseStudentNotSelect(student).Count() == 0 )
        {
            return;
        }
        //不顯示的colums 在此設定
        int[] ary = { 1, 3, 4 };
        foreach (int j in ary)
        {
            GVCourse.HeaderRow.Cells[j].Visible = false;
            for (int i = 0; i < GVCourse.Rows.Count; i++)
            {
                GVCourse.Rows[i].Cells[j].Visible = false;
            }
        }
        //表頭名稱設定
        GVCourse.HeaderRow.Cells[2].Text = "課程名稱";
        GVCourse.HeaderRow.Cells[5].Text = "教授姓名";
        GVCourse.HeaderRow.Cells[6].Text = "學分數";
    }

    protected void searchBtn_Click(object sender, EventArgs e)
    {
        string StrCourseName = courseName.Text.Trim();
        string StrProfessorrName = professorName.Text.Trim();

        GVCourse.DataSource = ReadDatabase.SearchCourseByWord(StrCourseName, StrProfessorrName);
        GVCourse.DataBind();

        //不顯示的colums 在此設定
        int[] ary = { 1, 3, 4 };
        foreach (int j in ary)
        {
            GVCourse.HeaderRow.Cells[j].Visible = false;
            for (int i = 0; i < GVCourse.Rows.Count; i++)
            {
                GVCourse.Rows[i].Cells[j].Visible = false;
            }
        }
        //表頭名稱設定
        GVCourse.HeaderRow.Cells[2].Text = "課程名稱";
        GVCourse.HeaderRow.Cells[5].Text = "教授姓名";
        GVCourse.HeaderRow.Cells[6].Text = "學分數";
    }

    protected void btnCheck_Click(object sender, EventArgs e)
    {
        checkCredit();
    }

    /// <summary>
    /// 目前選擇學分是否超過畢業門檻
    /// </summary>
    /// <returns></returns>
    public bool checkCredit()
    {
        string student = Session["userID"].ToString();
        int RequiredCredits = ReadDatabase.SchoolInfo(ReadDatabase.UserInfo(student).School).RequiredCredits;
        int SumCredit = ReadDatabase.SumCredit(student).Credit;
        int Credit = 0, cal = 0;
        foreach (GridViewRow item in this.GVCourse.Rows)
        {
            CheckBox ckb = item.FindControl("chkAdd") as CheckBox;
            if (ckb.Checked)
            {
                //學分數
                Credit += int.Parse(item.Cells[6].Text);
                cal = SumCredit + Credit;
                checkCreditSum.Text = cal.ToString();
            }
            else if (ckb.Checked == false)
            {
                cal = SumCredit + Credit;
                checkCreditSum.Text = cal.ToString();
            }
        }
        checkCreditSum.Text = "已選擇學分：  " + cal.ToString() + "/" + RequiredCredits + "  學分";
        if (cal > RequiredCredits) return true;
        else return false;
    }

    protected void reset_Click(object sender, EventArgs e)
    {
        string student = Session["userID"].ToString();
        int RequiredCredits = ReadDatabase.SchoolInfo(ReadDatabase.UserInfo(student).School).RequiredCredits;
        int SumCredit = ReadDatabase.SumCredit(student).Credit;
        foreach (GridViewRow item in this.GVCourse.Rows)
        {
            CheckBox ckb = item.FindControl("chkAdd") as CheckBox;
            if (ckb.Checked)
            {
                ckb.Checked = false;
            }
        }
        checkCreditSum.Text = "已選擇學分：  " + SumCredit + "/" + RequiredCredits + "  學分";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (checkCredit())
        {
            Response.Write("<script>alert('選擇學分不能超過畢業門檻')</script>");
        }
        else
        {
            int Credit = 0;
            bool successFlag = false, failFlag = false; //有沒有成功INSERT過
            string CourseID = "", CourseName = "", SuccessMsg = "", FailMsg = "";

            foreach (GridViewRow item in this.GVCourse.Rows)
            {
                CheckBox ckb = item.FindControl("chkAdd") as CheckBox;
                if (ckb.Checked)
                {
                    CourseID = item.Cells[1].Text; //課程ID
                    Credit += int.Parse(item.Cells[6].Text); //學分數
                    CourseName = item.Cells[2].Text; //課程名稱
                    Models.CourseSelectionModel CourseSelection = new Models.CourseSelectionModel
                    {
                        Student = Session["userID"].ToString(),
                        CourseId = int.Parse(CourseID),
                    };
                    try
                    {
                        SelectedCourse(CourseSelection);
                        SuccessMsg += CourseName + " ";
                        successFlag = true;
                    }
                    catch
                    {
                        FailMsg += CourseName + " ";
                        failFlag = true;
                    }
                }
            }
            if (successFlag == true) Response.Write("<script>alert('選擇成功的課程：" + SuccessMsg + "')</script>");
            if (failFlag == true) Response.Write("<script>alert('選擇失敗的課程：" + CourseName + "')</script>");

            string student = Session["userID"].ToString();
            int RequiredCredits = ReadDatabase.SchoolInfo(ReadDatabase.UserInfo(student).School).RequiredCredits;
            if (Credit < RequiredCredits)
            {
                int SumCredit = ReadDatabase.SumCredit(Session["userID"].ToString()).Credit;
                Response.Write("<script>alert('學分未達到畢業門檻： " + Credit + "/" + RequiredCredits + "')</script>");
            }
            LoadGridViewData();
        }
    }

    public void SelectedCourse(Models.CourseSelectionModel CourseSelection)
    {
        string sql = @"INSERT INTO COURSE_SELECTION (Student, CourseId)
                                     VALUES (@Student, @CourseId)";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@Student", CourseSelection.Student));
            cmd.Parameters.Add(new SqlParameter("@CourseId", CourseSelection.CourseId));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}