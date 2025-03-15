function flora(x) {

    if(x.forest.value == ""){
        alert("please delect forest");
        x.forest.focus();
        return false;
    }
    if(x.name.value == ""){
        alert("please enter name");
        x.name.focus();
        return false;
    }
    if(x.botanical.value == ""){
        alert("please enter botanical");
        x.botanical.focus();
        return false;
    }
    if(x.habitat.value == ""){
        alert("please enter habitat");
        x.habitat.focus();
        return false;
    }
    if(x.vegetation.value == ""){
        alert("please enter vegetation");
        x.vegetation.focus();
        return false;
    }
    if(x.description.value == ""){
        alert("please enter description");
        x.description.focus();
        return false;
    }
    if(x.photo.value == ""){
        alert("please upload photo");
        x.photo.focus();
        return false;
    }
}