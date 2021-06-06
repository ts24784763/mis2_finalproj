using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Principal_courseInSchool : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string principal = Session["userID"].ToString();
        string schoolName = ReadDatabase.UserInfo(principal).School;
        CourseDataList.DataSource = ReadDatabase.CourseInSchool(schoolName, "");
        CourseDataList.DataBind();
        lbSchool.Text = schoolName + " 目前開設課程";
        lbSchoolName.Text = schoolName;
        schoolImg.ImageUrl = ReadDatabase.SchoolInfo(schoolName).ImageUrl;

        if (Server.UrlDecode(Request.QueryString["type"]) == "openSchool")
        {
            string OpenSelectCourseDate = Server.UrlDecode(Request.QueryString["OpenSelectCourseDate"]);
            string OpenSemesterDate = Server.UrlDecode(Request.QueryString["OpenSemesterDate"]);
            OpenSchool(OpenSelectCourseDate, OpenSemesterDate);
        }
    }

    public void OpenSchool(string OpenSelectCourseDate, string OpenSemesterDate)
    {
        string principal = Session["userID"].ToString();
        string schoolName = ReadDatabase.UserInfo(principal).School;
        string sql = @"UPDATE SCHOOL SET OpenSelectCourseDate = @OpenSelectCourseDate, OpenSemesterDate = @OpenSemesterDate, 
                        SchoolStatus = 'SELL' WHERE SchoolName = @SchoolName ";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@OpenSelectCourseDate", OpenSelectCourseDate));
            cmd.Parameters.Add(new SqlParameter("@OpenSemesterDate", OpenSemesterDate));
            cmd.Parameters.Add(new SqlParameter("@SchoolName", schoolName));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}