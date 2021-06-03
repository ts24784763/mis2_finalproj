﻿using System;
using System.Collections.Generic;
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
        WebClient mywebClient = new WebClient();
        mywebClient.DownloadFile("../Student/Resume/1.docx", "1.docx");
    }
}