using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class setting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userSession = Session["userID"].ToString();
        lbName.Text = ReadDatabase.UserInfo(userSession).Name;
        lbRole.Text = ReadDatabase.UserInfo(userSession).Role;
        lbSchool.Text = ReadDatabase.UserInfo(userSession).School;
        lbMoney.Text = "錢包餘額： $ " + ReadDatabase.UserInfo(userSession).Wallet.ToString("N0");
        lbEmail.Text = ReadDatabase.UserInfo(userSession).Account;

        //沒學校
        if (ReadDatabase.UserInfo(Session["userID"].ToString()).School == "")
        {
            if (ReadDatabase.UserInfo(userSession).Role == "老師")
            {
                imgRole.ImageUrl = "~/image/teacher.png";
                teacherNoSchoolBar.Visible = true;
            }
            else if (ReadDatabase.UserInfo(userSession).Role == "學生")
            {
                imgRole.ImageUrl = "~/image/student.png";
                studentNoSchoolBar.Visible = true;
            }
            else if (ReadDatabase.UserInfo(userSession).Role == "校長")
            {
                imgRole.ImageUrl = "~/image/principal.png";
                principalNoSchoolBar.Visible = true;
            }
        }
        //有學校
        else
        {
            if (ReadDatabase.UserInfo(userSession).Role == "老師")
            {
                imgRole.ImageUrl = "~/image/teacher.png";
                teacherBar.Visible = true;
            }
            else if (ReadDatabase.UserInfo(userSession).Role == "學生")
            {
                imgRole.ImageUrl = "~/image/student.png";
                studentBar.Visible = true;
            }
            else if (ReadDatabase.UserInfo(userSession).Role == "校長")
            {
                string school = ReadDatabase.UserInfo(userSession).School;
                imgRole.ImageUrl = "~/image/principal.png";
                if (ReadDatabase.SchoolInfo(school).SchoolStatus == "FIX") principalFixSchoolBar.Visible = true;
                else if (ReadDatabase.SchoolInfo(school).SchoolStatus == "SELL") principalSellSchoolBar.Visible = true;
            }
        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        string userSession = Session["userID"].ToString();
        txtName.Text = ReadDatabase.UserInfo(userSession).Name;
        txtPhone.Text = ReadDatabase.UserInfo(userSession).PhoneNumber;
    }

    protected void update_Click(object sender, EventArgs e)
    {
        string userSession = Session["userID"].ToString();
        Models.MemberModel member = new Models.MemberModel
        {
            Account = userSession,
            Name = txtName.Text == "" ? ReadDatabase.UserInfo(userSession).Name : txtName.Text,
            PhoneNumber = txtPhone.Text == "" ? ReadDatabase.UserInfo(userSession).PhoneNumber : txtPhone.Text,
        };
        try
        {
            updateUserInfo(member);
            Response.Write("<script>alert('更新成功');location.href='../UserPublic/setting.aspx';</script>");
        }
        catch
        {
            Response.Write("<script>alert('更新失敗');</script>");
            txtName.Text = ReadDatabase.UserInfo(userSession).Name;
            txtPhone.Text = ReadDatabase.UserInfo(userSession).PhoneNumber;
        }
    }

    public void updateUserInfo(Models.MemberModel member)
    {
        string sql = @"UPDATE MEMBER SET Name = @Name, PhoneNumber = @PhoneNumber WHERE Account = @Account";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@Account", member.Account));
            cmd.Parameters.Add(new SqlParameter("@Name", member.Name));
            cmd.Parameters.Add(new SqlParameter("@PhoneNumber", member.PhoneNumber));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}