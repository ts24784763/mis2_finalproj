$(function () {

    $(".kendo_datepicker").kendoDatePicker({
        format: "yyyy-MM-dd",
        min: new Date(),
        //user cannot change format
        dateInput: true
    });

})

$(".button1").click(function (e) {
    e.preventDefault();
    window.location.href = "../UserPublic/login.aspx";
})

$(".button2").click(function (e) {
    e.preventDefault();
    window.location.href = "../UserPublic/login.aspx";
})

$("#btn-open-window").click(function (e) {
    e.preventDefault();
    initWindow();
});

$("#btn-open-HwWindow").click(function (e) {
    e.preventDefault();
    initHwWindow();
});

$("#btn-openSchool").click(function () {
    var validator = $("#openSchoolForm").kendoValidator().data("kendoValidator");
    if (!validator.validate()) {
        alert("資料輸入有誤！");
    }
});

function initHwWindow() {
    var windowOptions = {
        actions: ["Close"],
        width: "400px",
        height: "550px",
        title: "作業資訊",
        visible: false,
        modal: true
    };
    $("#window").kendoWindow(windowOptions);
    $("#window").data("kendoWindow").center().open();
};

function initWindow() {
    var windowOptions = {
        actions: ["Close"],
        width: "400px",
        height: "550px",
        title: "開放上架",
        visible: false,
        modal: true,
        close: resetInputArea()
    };
    $("#window").kendoWindow(windowOptions);
    $("#window").data("kendoWindow").center().open();
};

function resetInputArea() {
    $("#selectCourseTimeRange_datepicker").data("kendoDatePicker").value(new Date());
    $("#startSemester_datepicker").data("kendoDatePicker").value(new Date());
};

