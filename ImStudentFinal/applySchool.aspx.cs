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
        string schoolName = "元智資管學校"; //TODO
        if (uploadResume.HasFile)
        {
            string path = "Resume/" + schoolName + "_" + userSession + "_" + uploadResume.FileName;
            Models.ResumeModel resume = new Models.ResumeModel
            {
                StudentAccount = userSession, 
                SchoolName = schoolName,
                SelfIntroduction = txtIntro.Text,
                ResumeFileName = uploadResume.FileName,
                ResumeFilePath = path
            };
            try
            {
                insertResume(resume);
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

    /// <summary>
    /// 取得DB連線字串
    /// </summary>
    /// <returns></returns>
    private string GetDBConnectionString()
    {
        return
            System.Configuration.ConfigurationManager.ConnectionStrings["IMSTUDENTDBConn"].ConnectionString.ToString();
    }

    public void insertResume(Models.ResumeModel resume)
    {
        string sql = @"INSERT INTO STUDENTRESUME (StudentAccount, SchoolName, SelfIntroduction, ResumeFileName, ResumeFilePath)
			                              VALUES (@StudentAccount, @SchoolName, @SelfIntroduction, @ResumeFileName, @ResumeFilePath)";
        using (SqlConnection conn = new SqlConnection(this.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@StudentAccount", resume.StudentAccount));
            cmd.Parameters.Add(new SqlParameter("@SchoolName", resume.SchoolName));
            cmd.Parameters.Add(new SqlParameter("@SelfIntroduction", resume.SelfIntroduction));
            cmd.Parameters.Add(new SqlParameter("@ResumeFileName", resume.ResumeFileName));
            cmd.Parameters.Add(new SqlParameter("@ResumeFilePath", resume.ResumeFilePath));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}