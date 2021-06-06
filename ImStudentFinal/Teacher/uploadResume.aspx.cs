using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_uploadResume : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string teacher = Session["userID"].ToString();
        lblHello.Text = "您好 " + ReadDatabase.UserInfo(teacher).Name + "老師";
        if(IsExists.AlreadyApply(teacher,""))
            Response.Write("<script>alert('你已上傳過履歷');location.href='SchoolInviteMe.aspx';</script>");
    }

    public void teacherUploadResume(Models.ApplyModel apply)
    {
        string sql = @"INSERT INTO APPLY 
                       (Applicant, Receiver, ApplyType, ApplyIntro, ResumeFileName, ResumeFilePath, ApplyResult) VALUES
                       (@Applicant, @Receiver, @ApplyType, @ApplyIntro, @ResumeFileName, @ResumeFilePath, @ApplyResult)";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@Applicant", apply.Applicant));
            cmd.Parameters.Add(new SqlParameter("@Receiver", apply.Receiver));
            cmd.Parameters.Add(new SqlParameter("@ApplyType", "老師上傳履歷"));
            cmd.Parameters.Add(new SqlParameter("@ApplyIntro", apply.ApplyIntro));
            cmd.Parameters.Add(new SqlParameter("@ResumeFileName", apply.ResumeFileName));
            cmd.Parameters.Add(new SqlParameter("@ResumeFilePath", apply.ResumeFilePath));
            cmd.Parameters.Add(new SqlParameter("@ApplyResult", "等待審核中"));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string userSession = Session["userID"].ToString();
        string teacherName = ReadDatabase.UserInfo(userSession).Name;
        if (uploadResume.HasFile)
        {
            string path = "resume/" + teacherName + "_" + uploadResume.FileName;
            Models.ApplyModel apply = new Models.ApplyModel
            {
                Applicant = userSession,
                Receiver = "",
                ApplyIntro = txtIntro.Text,
                ResumeFileName = uploadResume.FileName,
                ResumeFilePath = path
            };
            try
            {
                teacherUploadResume(apply);
                uploadResume.SaveAs(Server.MapPath(path));
                Response.Write("<script>alert('已送出履歷');location.href='SchoolInviteMe.aspx';</script>");
            }
            catch
            {
                Response.Write("<script>alert('送出失敗')</script>");
                uploadResume.Dispose();
                txtIntro.Text = "";
            }
        }
        else
        {
            Response.Write("<script>alert('請先上傳履歷')</script>");
        }
    }
}