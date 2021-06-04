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
        StudentResumeDataList.DataSource = ReadDatabase.studentApplySchool("",schoolName);
        StudentResumeDataList.DataBind();
        StudentPaymentDataList.DataSource = ReadDatabase.studentPaymentStatus("", schoolName);
        StudentPaymentDataList.DataBind();
    }
    
    protected void btnDownloadResume_Click(object sender, EventArgs e)
    {
        string filename = @"Specify the file path in the server over here...."; 
        FileInfo fileInfo = new FileInfo(filename);

        if (fileInfo.Exists)
        {
            Response.Clear();
            Response.AddHeader("Content-Disposition", "attachment; filename=" + fileInfo.Name);
            Response.AddHeader("Content-Length", fileInfo.Length.ToString());
            Response.ContentType = "application/octet-stream";
            Response.Flush();
            Response.TransmitFile(fileInfo.FullName);
            Response.End();
        }
    }
}