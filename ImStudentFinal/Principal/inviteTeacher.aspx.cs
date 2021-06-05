using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Principal_inviteTeacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string principal = Session["userID"].ToString();
        invitedTeacherDataList.DataSource = ReadDatabase.ApplyInfo("校長邀請老師", principal, "");
        invitedTeacherDataList.DataBind();
    }

    protected void invitedTeacherDataList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lbteacherAccount = e.Item.FindControl("lbTeacherName") as Label;
        string teacherAccount = lbteacherAccount.Text;
        lbteacherAccount.Text = ReadDatabase.UserInfo(teacherAccount).Name;

        Label lbApplyResult = e.Item.FindControl("lbApplyResult") as Label;
        if (lbApplyResult.Text == "等待審核中") lbApplyResult.Text = "邀請中";
        else lbApplyResult.Text = "已加入";
    }
}