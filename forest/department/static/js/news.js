function news(x) {

    if(x.title.value == ""){
        alert("please enter title");
        x.forest.focus();
        return false;
    }
    if(x.description.value == ""){
        alert("please enter description");
        x.description.focus();
        return false;
    }
}