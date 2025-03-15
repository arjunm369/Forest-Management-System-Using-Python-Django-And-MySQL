function fauna(x) {

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
    if(x.category.value == ""){
        alert("please enter category");
        x.category.focus();
        return false;
    }
    if(x.habitat.value == ""){
        alert("please enter habitat");
        x.habitat.focus();
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