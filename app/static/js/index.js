/* Created by Michael Chen */

$(document).ready(function() {
    $(".dropdown-toggle").dropdown();
    $(".specific").hide();

    $("#edit-resource").on('click', '#addphone',function() {
        var newDiv = $(".resourcePhone")[0].outerHTML;
        $(".phone").append(newDiv);
        $(".resourcePhone:last").attr("placeholder", "(000)000-0000");
        $(".resourcePhone:last").removeAttr("value");
    });

    $("#next").click(function() {
        $(".specific").show();
        $("#cancel").hide();
    })
});

function goBack() {
    window.history.back();
}


// function searchname() {
//      var sname = document.getElementById("Search").value;
//      window.location = {{ url_for('searchName', name= sname) }};
// }
