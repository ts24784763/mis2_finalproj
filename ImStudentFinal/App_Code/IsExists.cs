using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// IsExists 的摘要描述
/// </summary>
public class IsExists
{
    /// <summary>
    /// 取得DB連線字串
    /// </summary>
    /// <returns></returns>
    public static string GetDBConnectionString()
    {
        return
            System.Configuration.ConfigurationManager.ConnectionStrings["IMSTUDENTDBConn"].ConnectionString.ToString();
    }


    /// <summary>
    /// 判斷課程是否有作業
    /// </summary>
    /// <param name="CourseId"></param>
    /// <returns></returns>
    public static bool CourseHaveHW(int CourseId)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT HWName FROM COURSE WHERE CourseId = @CourseId ";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@CourseId", CourseId));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }
        if (dt.Rows[0]["HWName"].ToString() == "")
            return false;
        else
            return true;
    }

    /// <summary>
    /// 判斷申請人有沒有送出過申請
    /// </summary>
    /// <param name="Applicant">申請方</param>
    /// <param name="Receiver">被申請方</param>
    /// <returns></returns>
    public static bool AlreadyApply(string Applicant, string Receiver)
    {
        string sql = @"SELECT * FROM APPLY WHERE Applicant = @Applicant AND Receiver = @Receiver";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@Applicant", Applicant));
            cmd.Parameters.Add(new SqlParameter("@Receiver", Receiver));
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                conn.Close();
                return true;
            }
            else
            {
                conn.Close();
                return false;
            }
        }
    }

    public static string checkSchoolInfo(string schoolName)
    {
        string emptyItem = "您的學校缺少這些資料：";
        if (ReadDatabase.SchoolInfo(schoolName).SchoolIntro == "") emptyItem += "簡介 ";
        if (ReadDatabase.SchoolInfo(schoolName).RequiredCredits == 0) emptyItem += "學分 ";
        if (ReadDatabase.SchoolInfo(schoolName).SemesterDays == 0) emptyItem += "學期天數 ";
        if (ReadDatabase.SchoolInfo(schoolName).SchoolFee == 0) emptyItem += "學費 ";
        if (ReadDatabase.SchoolInfo(schoolName).License == "") emptyItem += "證書 ";
        emptyItem += "請先填寫完成！";
        return emptyItem;
    }

    /// <summary>
    /// 判斷學生是否已繳交作業
    /// </summary>
    /// <param name="CourseId"></param>
    /// <returns></returns>
    public static bool AlreadyUploadHW(string student, int CourseId)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT HWFileName FROM COURSE_SELECTION WHERE Student = @Student AND CourseId = @CourseId ";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@Student", student));
            cmd.Parameters.Add(new SqlParameter("@CourseId", CourseId));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }
        if (dt.Rows[0]["HWFileName"].ToString() == "")
            return false;
        else
            return true;
    }

    /// <summary>
    /// 判斷此章節是否已上傳教材
    /// </summary>
    /// <param name="CourseId"></param>
    /// <param name="ChapterNum"></param>
    /// <returns></returns>
    public static bool AlreadyUploadMaterial(int CourseId, int ChapterNum)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT MaterialFileName FROM CHAPTER WHERE CourseId = @CourseId AND ChapterNum = @ChapterNum ";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@CourseId", CourseId));
            cmd.Parameters.Add(new SqlParameter("@ChapterNum", ChapterNum));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }
        if (dt.Rows[0]["MaterialFileName"].ToString() == "")
            return false;
        else
            return true;
    }

    /// <summary>
    /// 判斷學生有沒有選過這堂課
    /// </summary>
    /// <param name="student"></param>
    /// <param name="courseId"></param>
    /// <returns></returns>
    public static bool AlreadySelectedCourse(int student, int courseId)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT * FROM COURSE_SELECTION WHERE Student = @Student AND CourseId = @CourseId ";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@Student", student));
            cmd.Parameters.Add(new SqlParameter("@CourseId", courseId));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                conn.Close();
                return true;
            }
            else
            {
                conn.Close();
                return false;
            }
        }
    }
}