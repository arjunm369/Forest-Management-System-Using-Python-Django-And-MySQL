function program(x) {

    if(x.title.value == ""){
        alert("please enter title");
        x.title.focus();
        return false;
    }
    if(x.cname.value == ""){
        alert("please enter cname");
        x.cname.focus();
        return false;
    }
    if(x.description.value == ""){
        alert("please enter description");
        x.description.focus();
        return false;
    }
}