using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Principal_buildSchool : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void addSchool(Models.SchoolModel school)
    {
        string sql = @"INSERT INTO SCHOOL (SchoolName,SchoolIntro,RequiredCredits,SemesterDays,SchoolFee,License,OpenSelectCourseDate,OpenSemesterDate,SchoolStatus,Principal,ImageUrl)
                                   VALUES (@SchoolName, @SchoolIntro, null, @SemesterDays, null, null, '', '', 'FIX', @Principal, @ImageUrl) ";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@SchoolName", school.SchoolName));
            cmd.Parameters.Add(new SqlParameter("@SchoolIntro", school.SchoolIntro));
            cmd.Parameters.Add(new SqlParameter("@SemesterDays", school.SemesterDays));
            cmd.Parameters.Add(new SqlParameter("@Principal", school.Principal));
            cmd.Parameters.Add(new SqlParameter("@ImageUrl", school.ImageUrl));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }

    protected void checkBtn_Click(object sender, EventArgs e)
    {
        string principalAccount = Session["userID"].ToString();
        if (uploadSchoolImage.HasFile)
        {
            if (System.IO.Path.GetExtension(uploadSchoolImage.FileName).Substring(1) == "jpg")
            {
                string path = "schoolImage/" + uploadSchoolImage.FileName;
                Models.SchoolModel school = new Models.SchoolModel
                {
                    SchoolName = txtSchoolName.Text,
                    SchoolIntro = txtIntro.Text,
                    SemesterDays = int.Parse(txtSchoolDay.Text),
                    Principal = principalAccount,
                    ImageUrl = path,
                };
                try
                {
                    addSchool(school);
                    ReadDatabase.addSchoolToUser(school.Principal, school.SchoolName);
                    uploadSchoolImage.SaveAs(Server.MapPath(path));
                    Response.Write("<script>alert('建校成功');location.href='fixSchool.aspx';</script>");
                }
                catch
                {
                    Response.Write("<script>alert('建校失敗 此學校已存在');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('圖片須為.jpg格式');</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('尚未上傳圖片');</script>");
        }
    }
}