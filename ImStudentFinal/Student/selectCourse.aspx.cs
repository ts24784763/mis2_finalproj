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
        if (!IsPostBack)
            LoadGridViewData();
        {
            checkCreditSum.Visible = false;
        }
        lbTitle.Text = "在" + ReadDatabase.UserInfo(Session["userID"].ToString()).School + "選課";
    }

    private void LoadGridViewData()
    {
        string schoolName = ReadDatabase.UserInfo(Session["userID"].ToString()).School;
        GVCourse.DataSource = ReadDatabase.CourseInSchool(schoolName, "");
        GVCourse.DataBind();
        //不顯示的colums 在此設定
        int[] ary = { 1, 3 ,4};
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

    protected void btnCheck_Click(object sender, EventArgs e)
    {
        int Credit = 0;
        foreach (GridViewRow item in this.GVCourse.Rows)
        {
            CheckBox ckb = item.FindControl("chkAdd") as CheckBox;

            if (ckb.Checked)
            {
                //學分數
                Credit += int.Parse(item.Cells[6].Text);
                checkCreditSum.Text = Credit.ToString();
            }
            else if (ckb.Checked == false)
            {
                checkCreditSum.Text = Credit.ToString();
            }
        }
        checkCreditSum.Visible = true;
        checkCreditSum.Text = "您現在已選擇  " + Credit.ToString() + "/30  學分";
    }

    protected void reset_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow item in this.GVCourse.Rows)
        {
            CheckBox ckb = item.FindControl("chkAdd") as CheckBox;

            if (ckb.Checked)
            {
                ckb.Checked = false;
            }
        }
        checkCreditSum.Text = "您現在已選擇  " + 0 + "  學分";
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
        string CourseID = "";
        foreach (GridViewRow item in this.GVCourse.Rows)
        {
            CheckBox ckb = item.FindControl("chkAdd") as CheckBox;

            if (ckb.Checked)
            {
                //課程ID
                CourseID = item.Cells[1].Text;
                //學分數
                Credit += int.Parse(item.Cells[6].Text);
            }
            //if (Credit < 30)
            //{
            //    Response.Write("<script>alert('學分未達到上限：30學分')</script>");
            //    return;
            //}
        }

        Models.CourseSelectionModel CourseSelection = new Models.CourseSelectionModel
        {
            Student = Session["userID"].ToString(),
            CourseId = int.Parse(CourseID),
        };
        try
        {
            SelectedCourse(CourseSelection);
            Response.Write("<script>alert('選課成功');location.href='mainSchool';</script>");
        }
        catch
        {
            Response.Write("<script>alert('選課失敗')</script>");
        }
    }
}