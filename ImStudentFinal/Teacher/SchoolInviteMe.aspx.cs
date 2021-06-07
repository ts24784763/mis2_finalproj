using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_SchoolInviteMe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string teacherAccount = Session["userID"].ToString();
        invitedDataList.DataSource = ReadDatabase.ApplyInfo("校長邀請老師", "", teacherAccount);
        invitedDataList.DataBind();
    }

    protected void invitedDataList_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label lbSchoolName = e.Item.FindControl("lbSchoolName") as Label;
        string principalAccount = lbSchoolName.Text;
        lbSchoolName.Text = ReadDatabase.UserInfo(principalAccount).School;

        Label lbApplyResult = e.Item.FindControl("lbApplyResult") as Label;
        if (lbApplyResult.Text == "等待審核中") lbApplyResult.Text = "邀請中";
        else lbApplyResult.Text = "已加入";
    }

    protected void btnJoin_Click(object sender, EventArgs e)
    {
        string teacherAccount = Session["userID"].ToString();
        string principalAccount = ((Button)sender).CommandArgument;
        string schoolName = ReadDatabase.UserInfo(principalAccount).School;
        Models.ApplyModel apply = new Models.ApplyModel
        {
            Applicant = teacherAccount,
            Receiver = "",
            ApplyResult = "審核通過",
            PaymentStatus = "",
        };
        try
        {
            joinSchool(schoolName, principalAccount, teacherAccount);
            ReadDatabase.denyOrAllowApply(apply);
            Response.Write("<script>alert('成功加入" + schoolName + "');location.href='schoolInfo.aspx';</script>");
        }
        catch
        {
            Response.Write("<script>alert('加入失敗')</script>");
        }

    }

    public void joinSchool(string school, string principal, string teacher)
    {
        string sql = @"UPDATE MEMBER SET School = @School WHERE Account = @teacher
                       UPDATE APPLY SET ApplyResult = '審核通過' WHERE Applicant = @principal AND Receiver = @teacher ";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@School", school));
            cmd.Parameters.Add(new SqlParameter("@teacher", teacher));
            cmd.Parameters.Add(new SqlParameter("@principal", principal));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}