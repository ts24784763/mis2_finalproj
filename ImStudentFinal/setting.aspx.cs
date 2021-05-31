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
        lbName.Text = ReadUserInfo(userSession).Name;
        lbRole.Text = ReadUserInfo(userSession).Role;
        lbSchool.Text = ReadUserInfo(userSession).School;
        lbMoney.Text = "錢包餘額： $ " + ReadUserInfo(userSession).Wallet.ToString("N0");
        lbEmail.Text = ReadUserInfo(userSession).Account;

        if (ReadUserInfo(userSession).Role == "老師")
            imgRole.ImageUrl = "~/image/teacher.png";
        else if (ReadUserInfo(userSession).Role == "學生")
            imgRole.ImageUrl = "~/image/student.png";
        else if (ReadUserInfo(userSession).Role == "校長")
            imgRole.ImageUrl = "~/image/principal.png";
    }

    /// <summary>
    /// 取得DB連線字串
    /// </summary>
    /// <returns></returns>
    private string GetDBConnectionString()
    {
        return
            System.Configuration.ConfigurationManager.ConnectionStrings["IMSTUDENTDBConn"].ConnectionString.ToString();
    }

    public Models.MemberModel ReadUserInfo(string userAccount)
    {
        DataTable dt = new DataTable();
        string sql = @"SELECT * FROM MEMBER WHERE Account = @Account";
        using (SqlConnection conn = new SqlConnection(this.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@Account", userAccount));
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dt);
            conn.Close();
        }

        List<Models.MemberModel> result = new List<Models.MemberModel>();
        foreach (DataRow row in dt.Rows)
        {
            result.Add(new Models.MemberModel()
            {
                Account = row["Account"].ToString(),
                Password = row["Password"].ToString(),
                Name = row["Name"].ToString(),
                PhoneNumber = row["PhoneNumber"].ToString(),
                Role = row["Role"].ToString(),
                Wallet = int.Parse(row["Wallet"].ToString()),
                School = row["School"].ToString(),
            });
        }
        return result.FirstOrDefault();
    }

    protected void update_Click(object sender, EventArgs e)
    {
        Models.MemberModel member = new Models.MemberModel
        {
            Account = "28cyc",
            Name = txtName.Text == "" ? ReadUserInfo("28cyc").Name : txtName.Text,
            PhoneNumber = txtPhone.Text == "" ? ReadUserInfo("28cyc").PhoneNumber : txtPhone.Text,
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
        using (SqlConnection conn = new SqlConnection(this.GetDBConnectionString()))
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