using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_checkHW : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string TeacherName = Session["userID"].ToString();
        LoadDataList();
    }
    private void LoadDataList()
    {
        int CourseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        StudentHWDataList.DataSource = ReadDatabase.CheckHW("", CourseId);
        StudentHWDataList.DataBind();
    }

    protected void btnDownloadHW_Click(object sender, EventArgs e)
    {
        string student = ((Button)sender).CommandArgument;
        int CourseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        if (IsExists.AlreadyUploadHW(student, CourseId))
        {
            string HWFilePath = ReadDatabase.CourseSelectionInfo(student, CourseId).HWFilePath;
            string HWPath = "../Student/" + HWFilePath;
            string HWFileName = HWFilePath.Substring(HWFilePath.IndexOf("/") + 1);
            Response.ContentType = HWPath;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + HWFileName);

            // Write the file to the Response
            const int bufferLength = 10000;
            byte[] buffer = new Byte[bufferLength];
            int length = 0;
            Stream download = null;
            try
            {
                download = new FileStream(Server.MapPath(HWPath), FileMode.Open, FileAccess.Read);
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
        else
        {
            Response.Write("<script>alert('" + ReadDatabase.UserInfo(student).Name + "沒上傳作業');</script>");
        }
    }
    
    protected void btnAllow_Click(object sender, EventArgs e)
    {
        string student = ((Button)sender).CommandArgument;
        int CourseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        if (IsExists.AlreadyCheck(student, CourseId))
        {
            Response.Write("<script>alert('已經審核過此學生');</script>");
        }
        else
        {
            Models.CourseSelectionModel PassOrNot = new Models.CourseSelectionModel
            {
                Student = student,
                CourseId = CourseId,
                PassOrNot = "通過",
            };
            try
            {
                ReadDatabase.PassOrNot(PassOrNot);
                Response.Write("<script>alert('已讓 " + ReadDatabase.UserInfo(student).Name + " 通過 " + ReadDatabase.CourseInfo(CourseId).CourseName + "');</script>");
            }
            catch
            {
                Response.Write("<script>alert('審核失敗');</script>");
            }
            LoadDataList();
        }
    }

    protected void btnDeny_Click(object sender, EventArgs e)
    {
        string student = ((Button)sender).CommandArgument;
        int CourseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
        if (IsExists.AlreadyCheck(student, CourseId))
        {
            Response.Write("<script>alert('已經審核過此學生');</script>");
        }
        else
        {
            Models.CourseSelectionModel PassOrNot = new Models.CourseSelectionModel
            {
                Student = student,
                CourseId = CourseId,
                PassOrNot = "不通過",
            };
            try
            {
                ReadDatabase.PassOrNot(PassOrNot);
                Response.Write("<script>alert('" + ReadDatabase.UserInfo(student).Name + " 不通過 " + ReadDatabase.CourseInfo(CourseId).CourseName + "');</script>");
            }
            catch
            {
                Response.Write("<script>alert('審核失敗');</script>");
            }
            LoadDataList();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtStudentName.Text != "" )
        {
            int CourseId = int.Parse(Server.UrlDecode(Request.QueryString["courseId"]));
            StudentHWDataList.DataSource = ReadDatabase.CheckHW(txtStudentName.Text, CourseId);
            StudentHWDataList.DataBind();
        }
    }



    protected void StudentHWDataList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lblPassOrNot = e.Item.FindControl("lblPassOrNot") as Label;
        Label lblHWName = e.Item.FindControl("lblHWName") as Label;
        Button btnAllow = e.Item.FindControl("btnAllow") as Button;
        Button btnDeny = e.Item.FindControl("btnDeny") as Button;
        if (lblPassOrNot.Text == "")
        {
            lblPassOrNot.Text = "未審核";
        }
        if (lblHWName.Text == "")
        {
            btnAllow.Enabled = false;
            btnDeny.Enabled = false;
        }
    }
}