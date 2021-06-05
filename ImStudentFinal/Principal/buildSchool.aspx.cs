using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Principal_buildSchool : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void addSchool(Models.SchoolModel school)
    {
        string sql = @"INSERT INTO SCHOOL (SchoolName,SchoolIntro,RequiredCredits,SemesterDays,SchoolFee,License,OpenSelectCourseDate,OpenSemesterDate,SchoolStatus,Principal)
                                   VALUES (@SchoolName, @SchoolIntro, null, @SemesterDays, null, null, '', '', 'FIX', @Principal) ";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@SchoolName", school.SchoolName));
            cmd.Parameters.Add(new SqlParameter("@SchoolIntro", school.SchoolIntro));
            cmd.Parameters.Add(new SqlParameter("@SemesterDays", school.SemesterDays));
            cmd.Parameters.Add(new SqlParameter("@Principal", school.Principal));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }

    public void addSchoolToPrincipal(Models.SchoolModel school)
    {
        string sql = @"UPDATE MEMBER SET School= @SchoolName WHERE Account= @Principal";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@SchoolName", school.SchoolName));
            cmd.Parameters.Add(new SqlParameter("@Principal", school.Principal));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }

    protected void checkBtn_Click(object sender, EventArgs e)
    {
        string principalAccount = Session["userID"].ToString();
        Models.SchoolModel school = new Models.SchoolModel
        {
            SchoolName = txtSchoolName.Text,
            SchoolIntro = txtIntro.Text,
            SemesterDays = int.Parse(txtSchoolDay.Text),
            Principal = principalAccount,
        };
        try
        {
            addSchool(school);
            addSchoolToPrincipal(school);
            Response.Write("<script>alert('建校成功');location.href='fixSchool.aspx';</script>");
        }
        catch
        {
            Response.Write("<script>alert('建校失敗 請換一個學校名稱');</script>");
        }
    }
}