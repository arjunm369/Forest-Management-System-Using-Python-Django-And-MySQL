function privacy(x) {

    if(x.oldpsw.value == ""){
        alert("please enter your old password");
        x.oldpsw.focus();
        return false;
    }
    if(x.newpsw.value == ""){
        alert("please enter your new password");
        x.newpsw.focus();
        return false;
    }
    if(x.repsw.value == ""){
        alert("please confirm your new password");
        x.repsw.focus();
        return false;
    }
    if(x.newpsw.value != x.repsw.value){
        alert("passwords are not matching");
        x.repsw.focus();
        return false;
    }
}