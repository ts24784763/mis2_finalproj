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
        string userSession = "28cyc"; //TODO
        lbName.Text = ReadDatabase.UserInfo(userSession).Name;
        lbRole.Text = ReadDatabase.UserInfo(userSession).Role;
        lbSchool.Text = ReadDatabase.UserInfo(userSession).School;
        lbMoney.Text = "錢包餘額： $ " + ReadDatabase.UserInfo(userSession).Wallet.ToString("N0");
        lbEmail.Text = ReadDatabase.UserInfo(userSession).Account;

        if (ReadDatabase.UserInfo(userSession).Role == "老師")
            imgRole.ImageUrl = "~/image/teacher.png";
        else if (ReadDatabase.UserInfo(userSession).Role == "學生")
            imgRole.ImageUrl = "~/image/student.png";
        else if (ReadDatabase.UserInfo(userSession).Role == "校長")
            imgRole.ImageUrl = "~/image/principal.png";
    }

    protected void update_Click(object sender, EventArgs e)
    {
        Models.MemberModel member = new Models.MemberModel
        {
            Account = "28cyc",
            Name = txtName.Text == "" ? ReadDatabase.UserInfo("28cyc").Name : txtName.Text,
            PhoneNumber = txtPhone.Text == "" ? ReadDatabase.UserInfo("28cyc").PhoneNumber : txtPhone.Text,
        };
        try
        {
            updateUserInfo(member);
            Response.Write("<script>alert('更新成功')</script>");
            txtName.Text = "";
            txtPhone.Text = "";
        }
        catch
        {
            Response.Write("<script>alert('更新失敗');</script>");
            txtName.Text = "";
            txtPhone.Text = "";
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