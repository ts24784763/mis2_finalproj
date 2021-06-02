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

    /// <summary>
    /// 查詢school所有資料
    /// </summary>
    /// <param name="schoolName">學校名字</param>
    /// <returns></returns>
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
                SchoolIntro = row["SchoolIntro"].ToString(),
                SemesterDays = int.Parse(row["SemesterDays"].ToString()),
                SchoolFee = int.Parse(row["SchoolFee"].ToString()),
                License = row["License"].ToString(),
                OpenSelectCourseDate = Convert.ToDateTime(row["OpenSelectCourseDate"].ToString()),
                OpenSemesterDate = Convert.ToDateTime(row["OpenSemesterDate"].ToString()),
                RequiredCredits = int.Parse(row["RequiredCredits"].ToString()),
                SchoolStatus = row["SchoolStatus"].ToString(),
                Principal = row["Principal"].ToString(),
            });
        }
        return result.FirstOrDefault();
    }

    /// <summary>
    /// 查詢member所有資料
    /// </summary>
    /// <param name="userAccount">用戶帳號</param>
    /// <returns></returns>
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

    /// <summary>
    /// 查詢course所有資料
    /// </summary>
    /// <param name="courseId">課程id</param>
    /// <returns></returns>
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
                CourseIntro = row["CourseIntro"].ToString(),
                CourseCredit = int.Parse(row["CourseCredit"].ToString()),
                Teacher = row["Teacher"].ToString(),
                School = row["School"].ToString(),
                //HWName = row["HWName"].ToString(),
                //HWDetail = row["HWDetail"].ToString(),
                //HWDeadlineDays = int.Parse(row["Teacher"].ToString()),
            });
        }
        return result.FirstOrDefault();
    }

    /// <summary>
    /// 根據學校列出所有老師及開設課程
    /// </summary>
    /// <param name="schoolName">學校名字</param>
    /// <returns></returns>
    public static List<Models.CourseAndTeacherModel> CourseAndTeacherInfo(string schoolName)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT CourseName, Teacher TeacherAccount, Name TeacherName FROM COURSE JOIN MEMBER ON Teacher=Account WHERE Course.School = @SchoolName";
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
                TeacherAccount = row["TeacherAccount"].ToString(),
                TeacherName = row["TeacherName"].ToString(),
            });
        }
        return result;
    }

    /// <summary>
    /// 根據關鍵字搜尋學校
    /// </summary>
    /// <param name="searchWord">關鍵字</param>
    /// <returns></returns>
    public static List<Models.SchoolModel> SearchSchoolByWord(string searchWord)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT * FROM SCHOOL WHERE SchoolName LIKE '%' + @searchWord + '%' OR SchoolIntro LIKE '%' + @searchWord + '%'";
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
                SchoolIntro = row["SchoolIntro"].ToString(),
                RequiredCredits = int.Parse(row["RequiredCredits"].ToString()),
                SchoolStatus = row["SchoolStatus"].ToString(),
                License = row["License"].ToString(),
                Principal = row["Principal"].ToString(),
            });
        }
        return result;
    }

    /// <summary>
    /// 根據學校列出所有課程
    /// </summary>
    /// <param name="schoolName">學校名字</param>
    /// <returns></returns>
    public static List<Models.CourseModel> SearchCourseBySchool(string schoolName)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT CourseName, CourseIntro FROM COURSE WHERE School = @school";
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
                CourseName = row["CourseName"].ToString(),
                CourseIntro = row["CourseIntro"].ToString(),
            });
        }
        return result;
    }

    /// <summary>
    /// 依照學生或學校(擇一)查詢學生申請學校資料
    /// </summary>
    /// <param name="studentAccount">學生帳號</param>
    /// <returns></returns>
    public static List<Models.StudentApplySchoolModel> studentApplySchool(string studentAccount, string schoolName)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT Name AS StudentName, Applicant AS StudentAccount, Receiver AS School, ApplyIntro, ResumeFileName, ResumeFilePath, ApplyResult 
                        FROM APPLY JOIN MEMBER ON Applicant = Account WHERE ApplyType = '學生申請學校' AND ApplyResult = '等待審核中'";
        if (studentAccount != "")
            sql += "AND Applicant = @student";
        else if(schoolName != "")
            sql += "AND Receiver = @school";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@student", studentAccount));
            cmd.Parameters.Add(new SqlParameter("@school", schoolName));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }

        List<Models.StudentApplySchoolModel> result = new List<Models.StudentApplySchoolModel>();
        foreach (DataRow row in dt.Rows)
        {
            result.Add(new Models.StudentApplySchoolModel()
            {
                StudentName = row["StudentName"].ToString(),
                StudentAccount = row["StudentAccount"].ToString(),
                School = row["School"].ToString(),
                ApplyIntro = row["ApplyIntro"].ToString(),
                ApplyResult = row["ApplyResult"].ToString(),
                ResumeFileName = row["ResumeFileName"].ToString(),
                ResumeFilePath = row["ResumeFilePath"].ToString(),
            });
        }
        return result;
    }

    /// <summary>
    /// 依照學生或學校(擇一)查詢學生繳費狀況
    /// </summary>
    /// <param name="studentAccount">學生帳號</param>
    /// <returns></returns>
    public static List<Models.StudentPaymentStatusModel> studentPaymentStatus(string studentAccount, string schoolName)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT Name AS StudentName, Applicant AS StudentAccount, Receiver AS School, ApplyIntro, PaymentStatus
                        FROM APPLY JOIN MEMBER ON Applicant = Account WHERE ApplyType = '學生申請學校' AND ApplyResult = '通過' ";
        if (studentAccount != "")
            sql += "AND Applicant = @student";
        else if (schoolName != "")
            sql += "AND Receiver = @school";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@student", studentAccount));
            cmd.Parameters.Add(new SqlParameter("@school", schoolName));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }

        List<Models.StudentPaymentStatusModel> result = new List<Models.StudentPaymentStatusModel>();
        foreach (DataRow row in dt.Rows)
        {
            result.Add(new Models.StudentPaymentStatusModel()
            {
                StudentName = row["StudentName"].ToString(),
                StudentAccount = row["StudentAccount"].ToString(),
                School = row["School"].ToString(),
                ApplyIntro = row["ApplyIntro"].ToString(),
                PaymentStatus = row["PaymentStatus"].ToString(),
            });
        }
        return result;
    }

}