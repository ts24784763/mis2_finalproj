using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Principal_courseInSchool : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string schoolName = "美術學校";
        CourseDataList.DataSource = ReadDatabase.CourseInSchool(schoolName, "");
        CourseDataList.DataBind();
        lbSchool.Text = schoolName + " 目前開設課程";
        lbSchoolName.Text = schoolName;
        schoolImg.ImageUrl = ReadDatabase.SchoolInfo(schoolName).ImageUrl;
    }
}