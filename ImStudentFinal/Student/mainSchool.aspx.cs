using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mainSchool : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string schoolName = ReadDatabase.UserInfo(Session["userID"].ToString()).School;
        lbSchoolName.Text = ReadDatabase.SchoolInfo(schoolName).SchoolName;
        lbCredit.Text = ReadDatabase.SchoolInfo(schoolName).RequiredCredits.ToString()+" 學分數";
        lbLicense.Text = ReadDatabase.SchoolInfo(schoolName).License;
        lbSchoolIntro.Text = ReadDatabase.SchoolInfo(schoolName).SchoolIntro;
        lbPrincipal.Text = ReadDatabase.UserInfo(ReadDatabase.SchoolInfo(schoolName).Principal).Name;

        var courseList = ReadDatabase.ListAllCourseInSchool(schoolName); //課程清單
        var chapterList = ReadDatabase.ListAllChapterInCourse(100001); //章節清單 參數放課程Id
    }
}