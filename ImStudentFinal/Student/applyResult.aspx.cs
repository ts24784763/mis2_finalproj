using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
        Label lbSchoolFee = e.Item.FindControl("lbSchoolFee") as Label;
        Button btnPay = e.Item.FindControl("btnPayFee") as Button;
        string Result = lbResult.Text;
        if (Result != "通過")
        {
            btnPay.Visible = false;
            lbSchoolFee.Visible = false;
        }
        else
        {
            lbSchoolFee.Text = "學費：" + ReadDatabase.SchoolInfo(btnPay.CommandArgument).SchoolFee.ToString("N0") + " 元";
            btnPay.Visible = true;
            lbSchoolFee.Visible = true;
        }
        Image image = e.Item.FindControl("schoolImg") as Image;
        string school = image.ImageUrl;
        image.ImageUrl = "~/Principal/"+ReadDatabase.SchoolInfo(school).ImageUrl;
    }

    protected void btnPayFee_Click(object sender, EventArgs e)
    {
        string school = ((Button)sender).CommandArgument;
        string student = Session["userID"].ToString();
        int schoolFee = ReadDatabase.SchoolInfo(school).SchoolFee;
        if (IsExists.WalletEnoughHasMoney(student, schoolFee))
        {
            try
            {
                Money(0 - schoolFee, student); //學生付錢
                Money(schoolFee, ReadDatabase.SchoolInfo(school).Principal); //校長收錢
                changePaymentStatus(student, school); //學生繳費狀況：已繳費
                ReadDatabase.addSchoolToUser(student, school);
                Response.Write("<script>alert('繳費成功 成功加入" + school + "');location.href='mainSchool.aspx';</script>");
            }
            catch
            {
                Response.Write("<script>alert('繳費失敗')];</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('錢包餘額不足');</script>");
        }
    }

    /// <summary>
    /// 扣款付學費or收到學費
    /// </summary>
    public void Money(int money, string user)
    {
        int currentWallet = ReadDatabase.UserInfo(user).Wallet;
        string sql = @"UPDATE MEMBER SET Wallet = @Wallet WHERE Account = @Account";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@Wallet", currentWallet+ money));
            cmd.Parameters.Add(new SqlParameter("@Account", user));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }

    public void changePaymentStatus(string student, string school)
    {
        string sql = @"UPDATE APPLY SET PaymentStatus = '已繳費' WHERE Applicant = @Applicant AND Receiver = @Receiver AND ApplyType = '學生申請學校'";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@Applicant", student));
            cmd.Parameters.Add(new SqlParameter("@Receiver", school));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}