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
}