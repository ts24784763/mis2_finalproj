using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Principal_searchTeacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        teacherDatalist.DataSource = ReadDatabase.ApplyInfo("老師上傳履歷", "", "");
        teacherDatalist.DataBind();
    }

    protected void btnInvite_Click(object sender, EventArgs e)
    {
        string principalAccount = Session["userID"].ToString();
        string teacherAccount = ((Button)sender).CommandArgument;
        string teacherName = ReadDatabase.UserInfo(teacherAccount).Name;
        try
        {
            inviteTeacher(principalAccount, teacherAccount);
            Response.Write("<script>alert('已邀請"+ teacherName+"加入你的學校')</script>");
        }
        catch
        {
            Response.Write("<script>alert('邀請失敗')</script>");
        }
    }

    public void inviteTeacher(string principalAccount, string teacherAccount)
    {
        string sql = @"INSERT INTO APPLY VALUES (@Applicant, @Receiver,'校長邀請老師',NULL,NULL,NULL,'等待審核中',NULL,NULL) ";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@Applicant", principalAccount));
            cmd.Parameters.Add(new SqlParameter("@Receiver", teacherAccount));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}