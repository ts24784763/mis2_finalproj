using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void Register(Models.MemberModel member)
    {
        string sql = @"INSERT INTO MEMBER (Account, Name, Password, PhoneNumber, Role, Wallet)
                                    VALUES (@Account, @Name, @Password, @PhoneNumber, @Role, 50000)";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@Account", member.Account));
            cmd.Parameters.Add(new SqlParameter("@Name", member.Name));
            cmd.Parameters.Add(new SqlParameter("@Password", member.Password));
            cmd.Parameters.Add(new SqlParameter("@PhoneNumber", member.PhoneNumber));
            cmd.Parameters.Add(new SqlParameter("@Role", member.Role));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }

    protected void btnSubmitRegister_Click1(object sender, EventArgs e)
    {
        Models.MemberModel member = new Models.MemberModel
        {
            Account = txtEmail.Text,
            Name = txtName.Text,
            Password = txtPassword.Text,
            PhoneNumber = txtPhone.Text,
            Role = radioRole.SelectedValue
        };
        try
        {
            Register(member);
            Response.Write("<script>alert('註冊成功');location.href='Login.aspx';</script>");
        }
        catch
        {
            Response.Write("<script>alert('註冊失敗 帳號已存在')</script>");
        }       
    }
}