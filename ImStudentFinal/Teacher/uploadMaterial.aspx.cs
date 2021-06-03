using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Material : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        int CourseId = 100001;
        string CourseName = ReadDatabase.CourseInfo(CourseId).CourseName;
        int ChapterNum = 1;
        string Chapter = "第" + ChapterNum.ToString() + "章";
        if (uploadMaterialFile.HasFile)
        {
            string path = "material/" + CourseName + " " + Chapter + "_" + uploadMaterialFile.FileName;
            Models.MaterialModel material = new Models.MaterialModel
            {
                MaterialName = txtMaterialName.Text,
                MaterialIntro = txtMemo.Text,
                MaterialFileName = uploadMaterialFile.FileName,
                MaterialFilePath = path,
                CourseId = CourseId,
                ChapterNum = ChapterNum
            };
            try
            {
                UploadMaterial(material);
                uploadMaterialFile.SaveAs(Server.MapPath(path));
                Response.Write("<script>alert('教材上傳成功')</script>");
            }
            catch
            {
                Response.Write("<script>alert('教材上傳失敗')</script>");
                uploadMaterialFile.Dispose();
            }
        }
        else
        {
            Response.Write("<script>alert('請先上傳教材檔案')</script>");
        }
    }

    public void UploadMaterial(Models.MaterialModel material)
    {
        string sql = @"INSERT INTO MATERIAL VALUES (@MaterialName, @MaterialIntro, @MaterialFileName, @MaterialFilePath, @CourseId, @ChapterNum)";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@MaterialName", material.MaterialName));
            cmd.Parameters.Add(new SqlParameter("@MaterialIntro", material.MaterialIntro));
            cmd.Parameters.Add(new SqlParameter("@MaterialFileName", material.MaterialFileName));
            cmd.Parameters.Add(new SqlParameter("@MaterialFilePath", material.MaterialFilePath));
            cmd.Parameters.Add(new SqlParameter("@CourseId", material.CourseId));
            cmd.Parameters.Add(new SqlParameter("@ChapterNum", material.ChapterNum));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}