$(function(){$("#conversation_link").live("ajax:success",function(){$(this).closest("div").fadeOut()}),$("#messageSearch").val()!=undefined&&$("#messageSearch").each(function(){var e=$(this);e.data("oldVal",e.val().toLowerCase()),e.bind("propertychange keyup input paste",function(t){if(e.data("oldVal")!=e.val()){e.data("oldVal",e.val().toLowerCase());var n=$(".messageDiv");for(var r=0;r<n.length;r++)for(var i=0;i<n[r].childNodes.length;i++){var s=n[r].childNodes[i];if(s.className=="message-container")for(var o=0;o<s.childNodes.length;o++){var u=s.childNodes[o];if(u.className=="full-message"){var a=u.innerText.toLowerCase();a.indexOf(e.data("oldVal"))!=-1?n[r].style.display="block":n[r].style.display="none"}}}}})})});