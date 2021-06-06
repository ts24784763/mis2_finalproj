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
        int SumCredit = ReadDatabase.SumCredit(Session["userID"].ToString()).Credit;
        if (!IsPostBack)
        {
            LoadGridViewData();
        }
        lbTitle.Text = "在" + ReadDatabase.UserInfo(Session["userID"].ToString()).School + "選課";
        checkCreditSum.Text = "已選擇學分：  " + SumCredit + "/30  學分";
    }

    private void LoadGridViewData()
    {
        string schoolName = ReadDatabase.UserInfo(Session["userID"].ToString()).School;
        GVCourse.DataSource = ReadDatabase.CourseInSchool(schoolName, "");
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
        int SumCredit = ReadDatabase.SumCredit(Session["userID"].ToString()).Credit;
        int Credit = 0;
        int cal = 0;
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
        
        checkCreditSum.Text = "已選擇學分  " + cal.ToString() + "/30  學分";
    }

    protected void reset_Click(object sender, EventArgs e)
    {
        int SumCredit = ReadDatabase.SumCredit(Session["userID"].ToString()).Credit;
        foreach (GridViewRow item in this.GVCourse.Rows)
        {
            CheckBox ckb = item.FindControl("chkAdd") as CheckBox;

            if (ckb.Checked)
            {
                ckb.Checked = false;
            }
        }
        checkCreditSum.Text = "已選擇學分  " + SumCredit + "/30  學分";
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int Credit = 0;
        bool flag = false;
        string CourseID = "";
        string CourseName = "";
        string SuccessMsg = "", FailMsg = "";
        
        foreach (GridViewRow item in this.GVCourse.Rows)
        {
            CheckBox ckb = item.FindControl("chkAdd") as CheckBox;

            if (ckb.Checked)
            {
                //課程ID
                CourseID = item.Cells[1].Text;
                //學分數
                Credit += int.Parse(item.Cells[6].Text);
                //課程名稱
                CourseName = item.Cells[2].Text;

                if (Credit < 30)
                {
                    Response.Write("<script>alert('學分未達到上限：" + checkCreditSum.Text + "')</script>");
                }

                Models.CourseSelectionModel CourseSelection = new Models.CourseSelectionModel
                {
                    Student = Session["userID"].ToString(),
                    CourseId = CourseID,
                };
                try
                {
                    SelectedCourse(CourseSelection);
                    SuccessMsg += CourseName + " ";
                    flag = true;
                }
                catch
                {
                    FailMsg += CourseName + " ";
                }
                if (flag == true)
                {
                    Response.Write("<script>alert('選擇成功的課程：" + SuccessMsg + "\n選課失敗的課程：" + FailMsg + "');location.href='mainSchool.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('選課失敗的課程：" + FailMsg + "')</script>");
                }
            }
        }
    }
}