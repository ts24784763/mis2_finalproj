using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if(userLogin(txtEmail.Text,txtPassword.Text))
            Response.Write("<script>alert('登入成功');location.href='index.aspx';</script>");
        else
            Response.Write("<script>alert('登入失敗')</script>");
    }


    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx");
    }

    public bool userLogin(string Account, string Password)
    {
        string sql = @"SELECT Password FROM MEMBER WHERE Account = @Account AND Password = @Password";
        using (SqlConnection conn = new SqlConnection(ReadDatabase.GetDBConnectionString()))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.Add(new SqlParameter("@Account", Account));
            cmd.Parameters.Add(new SqlParameter("@Password", Password));
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                conn.Close();
                return true;
            }
            else
            {
                conn.Close();
                return false;
            }                
        }
    }
}