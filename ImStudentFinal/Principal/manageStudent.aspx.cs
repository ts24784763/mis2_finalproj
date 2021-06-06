using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verifyStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string principal = Session["userID"].ToString();
        string schoolName = ReadDatabase.UserInfo(principal).School;
        StudentResumeDataList.DataSource = ReadDatabase.ApplyInfo("學生申請學校", "",schoolName);
        StudentResumeDataList.DataBind();
        StudentPaymentDataList.DataSource = ReadDatabase.studentPaymentStatus("", schoolName);
        StudentPaymentDataList.DataBind();
    }
    
    protected void btnDownloadResume_Click(object sender, EventArgs e)
    {
        string resumePath = "../Student/"+((Button)sender).CommandArgument;
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

    protected void btnDeny_Click(object sender, EventArgs e)
    {
        string student = ((Button)sender).CommandArgument;
        string schoolName = ReadDatabase.UserInfo(Session["userID"].ToString()).School;
        Models.ApplyModel apply = new Models.ApplyModel
        {
            Applicant = student,
            Receiver = schoolName,
            ApplyResult = "未通過",
            PaymentStatus = "",
        };
        try
        {
            ReadDatabase.denyOrAllowApply(apply);
            Response.Write("<script>alert('已拒絕" + ReadDatabase.UserInfo(student).Name + "加入" + schoolName + "');location.href='manageStudent.aspx';</script>");
        }
        catch
        {
            Response.Write("<script>alert('拒絕失敗');</script>");
        }
    }

    protected void btnAllow_Click(object sender, EventArgs e)
    {
        string student = ((Button)sender).CommandArgument;
        string schoolName = ReadDatabase.UserInfo(Session["userID"].ToString()).School;
        Models.ApplyModel apply = new Models.ApplyModel
        {
            Applicant = student,
            Receiver = schoolName,
            ApplyResult = "通過",
            PaymentStatus = "未繳費",
        };
        try
        {
            ReadDatabase.denyOrAllowApply(apply);
            ReadDatabase.addSchoolToUser(student, schoolName);
            Response.Write("<script>alert('已讓" + ReadDatabase.UserInfo(student).Name + "加入" + schoolName + "');location.href='manageStudent.aspx';</script>");
        }
        catch
        {
            Response.Write("<script>alert('允許失敗');</script>");
        }
    }
}

