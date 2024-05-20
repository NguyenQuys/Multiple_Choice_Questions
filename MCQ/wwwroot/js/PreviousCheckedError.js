// exam.js
$(document).ready(function () {
    $.ajax({
        url: '/Home/Exam',
        type: 'GET',
        dataType: 'json',
        success: function (response) {
            if (response.message === "AAA") {
                // Hiển thị thông báo pop-up với nội dung "AAA"
                alert("AAA");
            } else {
                // Xử lý logic khác nếu cần
            }
        },
        error: function (xhr, status, error) {
            // Xử lý lỗi nếu có
        }
    });
});
