$(function(){
    $('#link-disjoin-event').live("mouseover", function(){
        document.getElementById("disjoin-event-text").innerHTML = "Leave";
    });
    $('#link-disjoin-event').live("mouseleave", function(){
        document.getElementById("disjoin-event-text").innerHTML = "Joined";
    });
});