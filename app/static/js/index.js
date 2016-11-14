/* Created by Michael Chen */

$(document).ready(function() {
    $(".dropdown-toggle").dropdown();
});

function goBack() {
    window.history.back();
}

function searchname() {
     var sname = document.getElementById("Search").value;
     window.location = {{ url_for('searchName', name= sname) }};
}
