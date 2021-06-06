using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Net;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Principal_searchTeacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadDatalist("PageLoad");
    }

    protected void btnInvite_Click(object sender, EventArgs e)
    {
        string principalAccount = Session["userID"].ToString();
        string teacherAccount = ((Button)sender).CommandArgument;
        string teacherName = ReadDatabase.UserInfo(teacherAccount).Name;
        if(IsExists.AlreadyApply(principalAccount, teacherAccount))
        {
            Response.Write("<script>alert('已邀請過這位老師')</script>");

        }
        else
        {
            try
            {
                inviteTeacher(principalAccount, teacherAccount);
                Response.Write("<script>alert('已邀請" + teacherName + "加入你的學校')</script>");
            }
            catch
            {
                Response.Write("<script>alert('邀請失敗')</script>");
            }
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
    protected void btnviewResume_Click(object sender, EventArgs e)
    {
        string resumePath = "../Teacher/" + ((Button)sender).CommandArgument;
        string resumeFileName = ((Button)sender).CommandArgument.Substring(((Button)sender).CommandArgument.IndexOf("/"));
        Response.ContentType = resumePath;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + resumeFileName);

        // Write the file to the Response  
        const int bufferLength = 10000;
        byte[] buffer = new Byte[bufferLength];
        int length = 0;
        Stream download = null;
        try
        {
            download = new FileStream(Server.MapPath(resumePath), FileMode.Open, FileAccess.Read);
            do
            {
                if (Response.IsClientConnected)
                {
                    length = download.Read(buffer, 0, bufferLength);
                    Response.OutputStream.Write(buffer, 0, length);
                    buffer = new Byte[bufferLength];
                }
                else
                {
                    length = -1;
                }
            }
            while (length > 0);
            Response.Flush();
            Response.End();
        }
        finally
        {
            if (download != null)
                download.Close();
        }
    }

    protected void searchBtn_Click(object sender, EventArgs e)
    {
        LoadDatalist("Search");
    }

    private void LoadDatalist(string Type)
    {
        if (Type == "PageLoad")
        {
            teacherDatalist.DataSource = ReadDatabase.ApplyInfo("老師上傳履歷", "", "");
            teacherDatalist.DataBind();
        }
        else if (Type == "Search")
        {
            string ApplicantName = searchTeacher.Text.Trim();
            teacherDatalist.DataSource = ReadDatabase.SearchTeacherByWord("老師上傳履歷", "", "",ApplicantName, "等待審核中");
            teacherDatalist.DataBind();
        }
    }
}