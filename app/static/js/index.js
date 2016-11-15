/* Created by Michael Chen */

$(document).ready(function() {
    $(".dropdown-toggle").dropdown();
    $(".specific").hide();
    $(".Childcare").hide();
    $(".Education").hide();
    $(".Employment").hide();
    $(".Housing").hide();
    $(".Job_Readiness").hide();
    $(".Legal").hide();
    $(".Life_Skills").hide();
    $(".Medical").hide();
    $(".Mental_Health").hide();
    $(".Mentors").hide();
    $(".Networks").hide();
    $(".Supplies").hide();
    $(".Transportation").hide();
    $(".Vehicle").hide();

    $("#edit-resource").on('click', '#addphone',function() {
        var newDiv = $(".resourcePhone")[0].outerHTML;
        $(".phone").append(newDiv);
        $(".resourcePhone:last").attr("placeholder", "(000)000-0000");
        $(".resourcePhone:last").removeAttr("value");
    });

    $("#next").click(function() {
        $(".specific").show();
        $("#cancel").hide();
        if($("#Childcare").is(':checked')) {
            $(".Childcare").show();
        }
        if($("#Education").is(':checked')) {
            $(".Education").show();
        }
        if($("#Employment").is(':checked')) {
            $(".Employment").show();
        }
        if($("#Housing").is(':checked')) {
            $(".Housing").show();
        }
        if($("#Job_Readiness").is(':checked')) {
            $(".Job_Readiness").show();
        }
        if($("#Legal").is(':checked')) {
            $(".Legal").show();
        }
        if($("#Life_Skills").is(':checked')) {
            $(".Life_Skills").show();
        }
        if($("#Medical").is(':checked')) {
            $(".Medical").show();
        }
        if($("#Mental_Health").is(':checked')) {
            $(".Mental_Health").show();
        }
        if($("#Mentors").is(':checked')) {
            $(".Mentors").show();
        }
        if($("#Networks").is(':checked')) {
            $(".Networks").show();
        }
        if($("#Supplies").is(':checked')) {
            $(".Supplies").show();
        }
        if($("#Transportation").is(':checked')) {
            $(".Transportation").show();
        }
        if($("#Vehicle").is(':checked')) {
            $(".Vehicle").show();
        }

    })

});

function goBack() {
    window.history.back();
}


// function searchname() {
//      var sname = document.getElementById("Search").value;
//      window.location = {{ url_for('searchName', name= sname) }};
// }
