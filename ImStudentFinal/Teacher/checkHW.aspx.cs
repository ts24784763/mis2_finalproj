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
        //string TeacherName = Session["userID"].ToString();
        string TeacherName = "celesteng";
        StudentHWDataList.DataSource = ReadDatabase.CheckHW("", "");
        StudentHWDataList.DataBind();
    }

    protected void btnDownloadHW_Click(object sender, EventArgs e)
    {
        string HWPath = "../Student/" + ((Button)sender).CommandArgument;
        string HWFileName = ((Button)sender).CommandArgument.Substring(((Button)sender).CommandArgument.IndexOf("/"));
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

    protected void btnAllow_Click(object sender, EventArgs e)
    {
        
    }
    protected void btnDeny_Click(object sender, EventArgs e)
    {
        
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtStudentName.Text != "" || txtCourseName.Text != "")
        {
            StudentHWDataList.DataSource = ReadDatabase.CheckHW(txtStudentName.Text, txtCourseName.Text);
            StudentHWDataList.DataBind();
        }
    }
}