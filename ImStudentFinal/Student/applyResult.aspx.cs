using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applyOutcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string studentAccount = Session["userID"].ToString();
        StudentResumeDataList.DataSource = ReadDatabase.AllApplyInfo("學生申請學校",studentAccount, "");
        StudentResumeDataList.DataBind();
    }

    protected void StudentResumeDataList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lbResult = e.Item.FindControl("lbResult") as Label;
        Button btnPay = e.Item.FindControl("btnPayFee") as Button;
        string Result = lbResult.Text;
        if (Result != "通過") btnPay.Visible = false;
        else btnPay.Visible = true;
        Image image = e.Item.FindControl("schoolImg") as Image;
        string school = image.ImageUrl;
        image.ImageUrl = "~/Principal/"+ReadDatabase.SchoolInfo(school).ImageUrl;
    }
}