using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Model 的摘要描述
/// </summary>
public class Models
{
    /// <summary>
    /// 用戶資料
    /// </summary>
    public class MemberModel
    {
        public string Account { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string PhoneNumber { get; set; }
        public string Role { get; set; }
        public string Wallet { get; set; }
    }
}