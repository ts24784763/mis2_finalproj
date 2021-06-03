using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applySchool : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void cancleBtn_Click(object sender, EventArgs e)
    {
        uploadResume.Dispose();
        txtIntro.Text = "";
    }


    protected void confirmSubmitBtn_Click(object sender, EventArgs e)
    {
        string userSession = "28cyc"; //TODO
        string studentName = ReadDatabase.UserInfo(userSession).Name;
        string schoolName = "元智資管學校"; //TODO
        if (uploadResume.HasFile)
        {
            string path = "resume/" + schoolName + " " + studentName + "_" + uploadResume.FileName;
            Models.ApplyModel apply = new Models.ApplyModel
            {
                Applicant = userSession, 
                Receiver = schoolName,
                ApplyIntro = txtIntro.Text,
                ResumeFileName = uploadResume.FileName,
                ResumeFilePath = path
            };
            try
            {
                studentApplySchool(apply);
                uploadResume.SaveAs(Server.MapPath(path));
                Response.Write("<script>alert('已送出申請')</script>");
            }
            catch
            {
                Response.Write("<script>alert('已申請過此學校')</script>");
                uploadResume.Dispose();
                txtIntro.Text = "";
            }
        }
        else
        {
            Response.Write("<script>alert('請先上傳履歷')</script>");
        }
    }

    public void studentApplySchool(Models.ApplyModel apply)
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
            cmd.Parameters.Add(new SqlParameter("@ApplyType", "學生申請學校"));
            cmd.Parameters.Add(new SqlParameter("@ApplyIntro", apply.ApplyIntro));
            cmd.Parameters.Add(new SqlParameter("@ResumeFileName", apply.ResumeFileName));
            cmd.Parameters.Add(new SqlParameter("@ResumeFilePath", apply.ResumeFilePath));
            cmd.Parameters.Add(new SqlParameter("@ApplyResult", "等待審核中"));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}