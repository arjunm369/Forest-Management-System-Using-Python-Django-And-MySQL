function forest(x){
    if (x.name.value == "") {
        alert('Please enter name');
        x.name.focus();
        return false;
    }
    if (x.area.value == "") {
        alert('Please enter area');
        x.area.focus();
        return false;
    }
    if (x.district.value == "") {
        alert('Please enter district');
        x.district.focus();
        return false;
    }
    if (x.location.value == "") {
        alert('Please enter location');
        x.location.focus();
        return false;
    }
    if (x.attraction.value == "") {
        alert('Please enter attraction');
        x.attraction.focus();
        return false;
    }
    if (x.website.value == "") {
        alert('Please enter website');
        x.website.focus();
        return false;
    }
}