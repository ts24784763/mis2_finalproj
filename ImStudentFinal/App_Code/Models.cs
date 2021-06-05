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
    /// 用戶資料model
    /// </summary>
    public class MemberModel
    {
        public string Account { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string PhoneNumber { get; set; }
        public string Role { get; set; }
        public int Wallet { get; set; }
        public string School { get; set; }
    }

    /// <summary>
    /// 申請資料(包含三種申請)model
    /// </summary>
    public class ApplyModel
    {
        public string ApplicantName { get; set; }
        public string Applicant { get; set; }
        public string Receiver { get; set; }
        public string ApplyType { get; set; }
        public string ApplyIntro { get; set; }
        public string ResumeFileName { get; set; }
        public string ResumeFilePath { get; set; }
        public string ApplyResult { get; set; }
        public string PaymentStatus { get; set; }
        public string ObtainLicense { get; set; }
    }

    /// <summary>
    /// 學校資料model
    /// </summary>
    public class SchoolModel
    {
        public string SchoolName { get; set; }
        public string SchoolIntro { get; set; }
        public int RequiredCredits { get; set; }
        public int SemesterDays { get; set; }
        public int SchoolFee { get; set; }
        public string License { get; set; }
        public DateTime? OpenSelectCourseDate { get; set; }
        public DateTime? OpenSemesterDate { get; set; }
        public string SchoolStatus { get; set; }
        public string Principal { get; set; }
        public string ImageUrl { get; set; }
    }

    /// <summary>
    /// 課程資料model
    /// </summary>
    public class CourseModel
    {
        public int CourseId { get; set; }
        public string CourseName { get; set; }
        public string CourseIntro { get; set; }
        public int CourseCredit { get; set; }
        public string School { get; set; }
        public string Teacher { get; set; }
        public string HWName { get; set; }
        public string HWDetail { get; set; }
        public int HWDeadlineDays { get; set; }
    }

    /// <summary>
    /// 課程與授課老師資料model
    /// </summary>
    public class CourseAndTeacherModel
    {
        public string CourseId { get; set; }
        public string CourseName { get; set; }
        public string CourseIntro { get; set; }
        public string TeacherAccount { get; set; }
        public string TeacherName { get; set; }
        public int CourseCredit { get; set; }
    }

    /// <summary>
    /// 學生繳費狀況資料model
    /// </summary>
    public class StudentPaymentStatusModel
    {
        public string StudentName { get; set; }
        public string StudentAccount { get; set; }
        public string School { get; set; }
        public string ApplyIntro { get; set; }
        public string PaymentStatus { get; set; }
    }

    /// <summary>
    /// 教材資料model
    /// </summary>
    public class MaterialModel
    {
        public int MaterialId { get; set; }
        public string MaterialName { get; set; }
        public string MaterialIntro { get; set; }
        public string MaterialFileName { get; set; }
        public string MaterialFilePath { get; set; }
        public int CourseId { get; set; }
        public int ChapterNum { get; set; }
    }

    /// <summary>
    /// 章節資料model
    /// </summary>
    public class ChapterModel
    {
        public int ChapterNum { get; set; }
        public int CourseId { get; set; }
        public string ChapterName { get; set; }
        public string VideoUrl { get; set; }
    }

    public class ListModel
    {
        public string Value { get; set; }
        public string Text { get; set; }
    }
}