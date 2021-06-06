using System;
using System.Collections.Generic;
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
        string schoolName = "元智資管學校";
        StudentResumeDataList.DataSource = ReadDatabase.ApplyInfo("學生申請學校", "",schoolName);
        StudentResumeDataList.DataBind();
        StudentPaymentDataList.DataSource = ReadDatabase.studentPaymentStatus("", schoolName);
        StudentPaymentDataList.DataBind();
    }
    
    protected void btnDownloadResume_Click(object sender, EventArgs e)
    {
        Response.ContentType = "../Css/Resume/1.docx";
        Response.AppendHeader("Content-Disposition", "attachment; filename=1.docx");

        // Write the file to the Response  
        const int bufferLength = 10000;
        byte[] buffer = new Byte[bufferLength];
        int length = 0;
        Stream download = null;
        try
        {
            download = new FileStream(Server.MapPath("~/Css/Resume/1.docx"),
                                                           FileMode.Open,
                                                           FileAccess.Read);
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
}

