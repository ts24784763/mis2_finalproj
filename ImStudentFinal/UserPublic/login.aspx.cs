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
        Session.Remove("userID");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string nextPage = "index.aspx";
        if (userLogin(txtEmail.Text, txtPassword.Text))
        {
            Session["userID"] = txtEmail.Text;
            //沒有學校
            if (ReadDatabase.UserInfo(Session["userID"].ToString()).School == "") 
            {
                if (ReadDatabase.UserInfo(Session["userID"].ToString()).Role == "學生")
                    nextPage = "../Student/searchSchool.aspx";
                else if (ReadDatabase.UserInfo(Session["userID"].ToString()).Role == "校長")
                    nextPage = "../Principal/buildSchool.aspx";
                else if (ReadDatabase.UserInfo(Session["userID"].ToString()).Role == "老師")
                    nextPage = "../Teacher/schoolInviteMe.aspx";
            }
            //有學校
            else
            {
                if (ReadDatabase.UserInfo(Session["userID"].ToString()).Role == "學生")
                    nextPage = "../Student/mainSchool.aspx";
                else if (ReadDatabase.UserInfo(Session["userID"].ToString()).Role == "校長")
                    nextPage = "../Principal/fixSchool.aspx"; //哪頁?
                else if (ReadDatabase.UserInfo(Session["userID"].ToString()).Role == "老師")
                    nextPage = "../Teacher/schoolInfo.aspx";
            }
            Response.Write("<script>alert('登入成功');location.href='" + nextPage + "';</script>");
        }
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