$(function(){
    $('#link-disjoin-event').live("mouseover", function(){
        document.getElementById("disjoin-event-text").innerHTML = "disjoin";
    });
    $('#link-disjoin-event').live("mouseleave", function(){
        document.getElementById("disjoin-event-text").innerHTML = "joined";
    });
});