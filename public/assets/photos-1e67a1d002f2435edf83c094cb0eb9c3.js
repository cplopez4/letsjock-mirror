function validUrl(e){var t=new RegExp("^(https?:\\/\\/)?((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|((\\d{1,3}\\.){3}\\d{1,3}))(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*(\\?[;&a-z\\d%_.~+=-]*)?(\\#[-a-z\\d_]*)?$","i");return t.test(e)?!0:!1}function validImageExt(e){if(e=="")return!1;var t=e.split(".").pop().toLowerCase();return $.inArray(t,["gif","png","jpg","jpeg"])==-1?!1:!0};