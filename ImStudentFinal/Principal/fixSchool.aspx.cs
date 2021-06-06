using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Principal_fixSchool : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string principal = Session["userID"].ToString();
        lbSchoolName.Text = "整修" + ReadDatabase.SchoolInfo(ReadDatabase.UserInfo(principal).School).SchoolName;
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        string principal = Session["userID"].ToString();
        string school = ReadDatabase.SchoolInfo(ReadDatabase.UserInfo(principal).School).SchoolName;
        txtIntro.Text = ReadDatabase.SchoolInfo(school).SchoolIntro;
        txtFee.Text = ReadDatabase.SchoolInfo(school).SchoolFee.ToString() == "0" ? "" : ReadDatabase.SchoolInfo(school).SchoolFee.ToString();
        txtDays.Text = ReadDatabase.SchoolInfo(school).SemesterDays.ToString() == "0" ? "" : ReadDatabase.SchoolInfo(school).SemesterDays.ToString();
        txtCertification.Text = ReadDatabase.SchoolInfo(school).License;
        txtCredit.Text = ReadDatabase.SchoolInfo(school).RequiredCredits.ToString() == "0" ? "" : ReadDatabase.SchoolInfo(school).RequiredCredits.ToString();
    }

    public void editSchool(Models.SchoolModel school)
    {
        string sql = @"UPDATE SCHOOL SET SemesterDays = @SemesterDays, RequiredCredits = @RequiredCredits, License = @License, SchoolFee = @SchoolFee, SchoolIntro = @SchoolIntro WHERE SchoolName= @SchoolName";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@SchoolName", school.SchoolName));
            cmd.Parameters.Add(new SqlParameter("@SchoolIntro", school.SchoolIntro));
            cmd.Parameters.Add(new SqlParameter("@SemesterDays", school.SemesterDays));
            cmd.Parameters.Add(new SqlParameter("@RequiredCredits", school.RequiredCredits));
            cmd.Parameters.Add(new SqlParameter("@License", school.License));
            cmd.Parameters.Add(new SqlParameter("@SchoolFee", school.SchoolFee));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }

    protected void savingBtn_Click(object sender, EventArgs e)
    {
        string principalAccount = Session["userID"].ToString();
        Models.SchoolModel school = new Models.SchoolModel
        {
            SchoolName = ReadDatabase.SchoolInfo(ReadDatabase.UserInfo(principalAccount).School).SchoolName,
            SchoolIntro = txtIntro.Text,
            SemesterDays = int.Parse(txtDays.Text),
            RequiredCredits = int.Parse(txtCredit.Text),
            License = txtCertification.Text,
            SchoolFee = int.Parse(txtFee.Text),
        };
        try
        {
            editSchool(school);
            Response.Write("<script>alert('整修成功');location.href='courseInSchool.aspx';</script>");
        }
        catch
        {
            Response.Write("<script>alert('整修失敗');</script>");
        }
    }

    protected void viewCourse_Click(object sender, EventArgs e)
    {
        string principal = Session["userID"].ToString();
        string school = ReadDatabase.SchoolInfo(ReadDatabase.UserInfo(principal).School).SchoolName;
        string check = IsExists.checkSchoolInfo(school);
        if (check.Length > 18)
        {
            Response.Write("<script>alert('"+ check + "');</script>");
        }
        else
        {
            Response.Redirect("courseInSchool.aspx");
        }
    }
}