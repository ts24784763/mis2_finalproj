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
    /// 查詢特定school所有資料
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
                SemesterDays = int.Parse(row["SemesterDays"].ToString() == "" ? "0" : row["SemesterDays"].ToString()),
                SchoolFee = int.Parse(row["SchoolFee"].ToString() == "" ? "0" : row["SchoolFee"].ToString()),
                License = row["License"].ToString(),
                OpenSelectCourseDate = Convert.ToDateTime(row["OpenSelectCourseDate"].ToString()),
                OpenSemesterDate = Convert.ToDateTime(row["OpenSemesterDate"].ToString()),
                RequiredCredits = int.Parse(row["RequiredCredits"].ToString() == "" ? "0" : row["RequiredCredits"].ToString()),
                SchoolStatus = row["SchoolStatus"].ToString(),
                Principal = row["Principal"].ToString(),
            });
        }
        return result.FirstOrDefault();
    }

    /// <summary>
    /// 查詢特定member所有資料
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
    /// 查詢特定course所有資料
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
    /// 根據學校列出開設課程及老師姓名
    /// </summary>
    /// <param name="schoolName">學校名字</param>
    /// <returns></returns>
    public static List<Models.CourseAndTeacherModel> CourseInSchool(string schoolName)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT CourseId, CourseName, Teacher TeacherAccount, Name TeacherName, CourseCredit FROM COURSE JOIN MEMBER ON Teacher=Account WHERE Course.School = @SchoolName";
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
                CourseId = row["CourseId"].ToString(),
                CourseName = row["CourseName"].ToString(),
                TeacherAccount = row["TeacherAccount"].ToString(),
                TeacherName = row["TeacherName"].ToString(),
                CourseCredit = int.Parse(row["CourseCredit"].ToString()),
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
        string sql = @"SELECT * FROM SCHOOL WHERE SchoolStatus = 'SELL' AND (SchoolName LIKE '%' + @searchWord + '%' OR SchoolIntro LIKE '%' + @searchWord + '%')";
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
                RequiredCredits = int.Parse(row["RequiredCredits"].ToString() == "" ? "0" : row["RequiredCredits"].ToString()),
                SchoolStatus = row["SchoolStatus"].ToString(),
                License = row["License"].ToString(),
                Principal = row["Principal"].ToString(),
            });
        }
        return result;
    }

    /// <summary>
    /// 根據學校列出此學校所有課程
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
    /// 依照申請種類、申請者or收到申請者(擇一)查詢申請資料
    /// </summary>
    /// <param name="ApplyType">申請種類</param>
    /// <param name="Applicant">申請者</param>
    /// <param name="Receiver">受到申請者</param>
    /// <returns></returns>
    public static List<Models.ApplyModel> ApplyInfo(string ApplyType, string Applicant, string Receiver)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT Name AS ApplicantName, Applicant, Receiver, ApplyIntro, ResumeFileName, ResumeFilePath, ApplyResult
                        FROM APPLY JOIN MEMBER ON Applicant = Account WHERE ApplyType = @ApplyType AND ApplyResult = '等待審核中'";
        if (Applicant != "")
            sql += "AND Applicant = @Applicant";
        else if (Receiver != "")
            sql += "AND Receiver = @Receiver";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@ApplyType", ApplyType));
            cmd.Parameters.Add(new SqlParameter("@Applicant", Applicant));
            cmd.Parameters.Add(new SqlParameter("@Receiver", Receiver));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }

        List<Models.ApplyModel> result = new List<Models.ApplyModel>();
        foreach (DataRow row in dt.Rows)
        {
            result.Add(new Models.ApplyModel()
            {
                ApplicantName = row["ApplicantName"].ToString(),
                Applicant = row["Applicant"].ToString(),
                Receiver = row["Receiver"].ToString(),
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

    /// <summary>
    /// 根據課程列出此課程所有章節
    /// </summary>
    /// <param name="schoolName"></param>
    /// <returns></returns>
    public static List<Models.ChapterModel> ChapterInCourse(int courseId)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT * FROM CHAPTER WHERE CourseId = @courseId ORDER BY ChapterNum ";
        using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@courseId", courseId));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }

        List<Models.ChapterModel> result = new List<Models.ChapterModel>();
        foreach (DataRow row in dt.Rows)
        {
            result.Add(new Models.ChapterModel()
            {
                ChapterNum = int.Parse(row["ChapterNum"].ToString()),
                CourseId = int.Parse(row["CourseId"].ToString()),
                ChapterName = row["ChapterName"].ToString(),
                VideoUrl = row["VideoUrl"].ToString(),
            });
        }
        return result;
    }

    /// <summary>
    /// 將特定學校中的所有課程列成list
    /// </summary>
    /// <param name="schoolName"></param>
    /// <returns></returns>
    public static List<Models.ListModel> ListAllCourseInSchool(string schoolName)
    {
        List<Models.ListModel> result = new List<Models.ListModel>();
        int courseNum = ReadDatabase.CourseInSchool(schoolName).Count;
        for (int i = 0; i < courseNum; i++)
        {
            result.Add(new Models.ListModel()
            {
                Value = ReadDatabase.CourseInSchool(schoolName)[i].CourseId,
                Text = ReadDatabase.CourseInSchool(schoolName)[i].CourseName,
            });
        }
        return result;
    }

    /// <summary>
    /// 將特定課程中的所有章節列成list
    /// </summary>
    /// <param name="courseId"></param>
    /// <returns></returns>
    public static List<Models.ListModel> ListAllChapterInCourse(int courseId)
    {
        List<Models.ListModel> result = new List<Models.ListModel>();
        int chapterNum = ReadDatabase.ChapterInCourse(courseId).Count;
        for (int i = 0; i < chapterNum; i++)
        {
            result.Add(new Models.ListModel()
            {
                Value = ReadDatabase.ChapterInCourse(courseId)[i].ChapterNum.ToString(),
                Text = ReadDatabase.ChapterInCourse(courseId)[i].ChapterName,
            });
        }
        return result;
    }

    //public static List<Models.MemberModel> TeacherCanInvite(int courseId)
    //{
    //    DataTable dt = new DataTable();
    //    string sql = @"SELECT * FROM MEMBER WHERE Role = '老師' AND School IS NULL ";
    //    using (SqlConnection conn = new SqlConnection(GetDBConnectionString()))
    //    {
    //        conn.Open();
    //        SqlCommand cmd = new SqlCommand(sql, conn);
    //        cmd.Parameters.Add(new SqlParameter("@courseId", courseId));
    //        SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
    //        sqlAdapter.Fill(dt);
    //        conn.Close();
    //    }

    //    List<Models.ChapterModel> result = new List<Models.ChapterModel>();
    //    foreach (DataRow row in dt.Rows)
    //    {
    //        result.Add(new Models.ChapterModel()
    //        {
    //            ChapterNum = int.Parse(row["ChapterNum"].ToString()),
    //            CourseId = int.Parse(row["CourseId"].ToString()),
    //            ChapterName = row["ChapterName"].ToString(),
    //            VideoUrl = row["VideoUrl"].ToString(),
    //        });
    //    }
    //    return result;
    //}

}