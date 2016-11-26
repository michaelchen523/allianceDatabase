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
    $(".For_Children").hide();
    $("input").attr("style", "background-color: #CCC;")
    $("textarea").attr("style", "background-color: #CCC")
    $("label").addClass("pink");
    $("#edit-resource").on('click', '#addphone',function() {
        var newDiv = $(".resourcePhone")[0].outerHTML;
        $(".phone").append(newDiv);
        $(".resourcePhone:last").attr("placeholder", "(000)000-0000");
        $(".resourcePhone:last").attr("name", "resourcePhone");
        $(".resourcePhone:last").removeAttr("value");
    });

    $("#next").click(function() {
        $(".specific").show();
        $("#cancel").hide();
        if($("#Childcare").is(':checked')) {
            $(".Childcare").show();
        } else {
            $(".Childcare").hide();
        }
        if($("#Education").is(':checked')) {
            $(".Education").show();
        } else {
            $(".Education").hide();
        }
        if($("#Employment").is(':checked')) {
            $(".Employment").show();
        } else {
            $(".Employment").hide();
        }
        if($("#Housing").is(':checked')) {
            $(".Housing").show();
        } else {
            $(".Housing").hide();
        }
        if($("#Job_Readiness").is(':checked')) {
            $(".Job_Readiness").show();
        } else {
            $(".Job_Readiness").hide();
        }
        if($("#Legal").is(':checked')) {
            $(".Legal").show();
        } else {
            $(".Legal").hide();
        }
        if($("#Life_Skills").is(':checked')) {
            $(".Life_Skills").show();
        } else {
            $(".Life_Skills").hide();
        }
        if($("#Medical").is(':checked')) {
            $(".Medical").show();
        } else {
            $(".Medical").hide();
        }
        if($("#Mental_Health").is(':checked')) {
            $(".Mental_Health").show();
        } else {
            $(".Mental_Health").hide();
        }
        if($("#Mentors").is(':checked')) {
            $(".Mentors").show();
        } else {
            $(".Mentors").hide();
        }
        if($("#Networks").is(':checked')) {
            $(".Networks").show();
        } else {
            $(".Networks").hide();
        }
        if($("#Supplies").is(':checked')) {
            $(".Supplies").show();
        } else {
            $(".Supplies").hide();
        }
        if($("#Transportation").is(':checked')) {
            $(".Transportation").show();
        } else {
            $(".Transportation").hide();
        }
        if($("#Vehicle").is(':checked')) {
            $(".Vehicle").show();
        } else {
            $(".Vehicle").hide();
        }
        if ($("#For_Children").is(':checked')) {
            $(".For_Children").show();
        } else {
            $(".For_Children").hide();
        }

    })

});

function goBack() {
    window.history.back();
}



