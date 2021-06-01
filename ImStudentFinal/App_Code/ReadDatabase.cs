using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// ReadDatabase 的摘要描述
/// </summary>
public class ReadDatabase
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

    public static Models.SchoolModel SchoolInfo(string schoolName)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT * FROM SCHOOL WHERE SchoolName = @SchoolName";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@SchoolName", schoolName));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }

        List<Models.SchoolModel> result = new List<Models.SchoolModel>();
        foreach (DataRow row in dt.Rows)
        {
            result.Add(new Models.SchoolModel()
            {
                SchoolName = row["SchoolName"].ToString(),
                SchoolIntroduction = row["SchoolIntroduction"].ToString(),
                RequiredCredits = int.Parse(row["RequiredCredits"].ToString()),
                SchoolStatus = row["SchoolStatus"].ToString(),
                License = row["License"].ToString(),
                Principal = row["Principal"].ToString(),
            });
        }
        return result.FirstOrDefault();
    }

    public static Models.MemberModel UserInfo(string userAccount)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT * FROM MEMBER WHERE Account = @Account";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@Account", userAccount));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }

        List<Models.MemberModel> result = new List<Models.MemberModel>();
        foreach (DataRow row in dt.Rows)
        {
            result.Add(new Models.MemberModel()
            {
                Account = row["Account"].ToString(),
                Password = row["Password"].ToString(),
                Name = row["Name"].ToString(),
                PhoneNumber = row["PhoneNumber"].ToString(),
                Role = row["Role"].ToString(),
                Wallet = int.Parse(row["Wallet"].ToString()),
                School = row["School"].ToString(),
            });
        }
        return result.FirstOrDefault();
    }

    public static Models.CourseModel CourseInfo(int courseId)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT * FROM Course WHERE CourseId = @CourseId";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@CourseId", courseId));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }

        List<Models.CourseModel> result = new List<Models.CourseModel>();
        foreach (DataRow row in dt.Rows)
        {
            result.Add(new Models.CourseModel()
            {
                CourseId = int.Parse(row["CourseId"].ToString()),
                CourseName = row["CourseName"].ToString(),
                CourseIntroduction = row["CourseIntroduction"].ToString(),
                CourseCredits = int.Parse(row["CourseCredits"].ToString()),
                TeacherAccount = row["TeacherAccount"].ToString(),
                School = row["School"].ToString(),
            });
        }
        return result.FirstOrDefault();
    }

    public static List<Models.CourseAndTeacherModel> CourseAndTeacherInfo(string schoolName)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT CourseName, Name AS TeacherName FROM COURSE LEFT JOIN MEMBER ON TeacherAccount = Account WHERE COURSE.School = @SchoolName";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@SchoolName", schoolName));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }

        List<Models.CourseAndTeacherModel> result = new List<Models.CourseAndTeacherModel>();
        foreach (DataRow row in dt.Rows)
        {
            result.Add(new Models.CourseAndTeacherModel()
            {
                CourseName = row["CourseName"].ToString(),
                TeacherName = row["TeacherName"].ToString(),
            });
        }
        return result;
    }

    public static List<Models.SchoolModel> SearchSchoolByWord(string searchWord)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT * FROM SCHOOL WHERE SchoolName LIKE '%' + @searchWord + '%' OR SchoolIntroduction LIKE '%' + @searchWord + '%'";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@searchWord", searchWord));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }

        List<Models.SchoolModel> result = new List<Models.SchoolModel>();
        foreach (DataRow row in dt.Rows)
        {
            result.Add(new Models.SchoolModel()
            {
                SchoolName = row["SchoolName"].ToString(),
                SchoolIntroduction = row["SchoolIntroduction"].ToString(),
                RequiredCredits = int.Parse(row["RequiredCredits"].ToString()),
                SchoolStatus = row["SchoolStatus"].ToString(),
                License = row["License"].ToString(),
                Principal = row["Principal"].ToString(),
            });
        }
        return result;
    }

    public static List<Models.CourseModel> SearchCourseBySchool(string schoolName)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT * FROM COURSE WHERE School = @school";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@school", schoolName));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }

        List<Models.CourseModel> result = new List<Models.CourseModel>();
        foreach (DataRow row in dt.Rows)
        {
            result.Add(new Models.CourseModel()
            {
                CourseId = int.Parse(row["CourseId"].ToString()),
                CourseName = row["CourseName"].ToString(),
                CourseIntroduction = row["CourseIntroduction"].ToString(),
                CourseCredits = int.Parse(row["CourseCredits"].ToString()),
                TeacherAccount = row["TeacherAccount"].ToString(),
                School = row["School"].ToString(),
            });
        }
        return result;
    }

    public static List<Models.StudentResumeModel> StudentResumeInfo(string schoolName)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT Name AS StudentName, StudentAccount, SchoolName, SelfIntroduction, ResumeFileName, ResumeFilePath FROM STUDENTRESUME 
                             JOIN MEMBER ON StudentAccount = Account WHERE SchoolName = @SchoolName";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@SchoolName", schoolName));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }

        List<Models.StudentResumeModel> result = new List<Models.StudentResumeModel>();
        foreach (DataRow row in dt.Rows)
        {
            result.Add(new Models.StudentResumeModel()
            {
                StudentName = row["StudentName"].ToString(),
                StudentAccount = row["StudentAccount"].ToString(),
                SchoolName = row["SchoolName"].ToString(),
                SelfIntroduction = row["SelfIntroduction"].ToString(),
                ResumeFileName = row["ResumeFileName"].ToString(),
                ResumeFilePath = row["ResumeFilePath"].ToString(),
            });
        }
        return result;
    }
}