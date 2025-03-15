function register(x){
    var name = /^[A-Za-z ]+$/;
	var phone = /^[0-9]+$/;

    if (x.name.value == "") {
        alert('Please enter your username');
        x.name.focus();
        return false;
    }
    else if (!x.name.value.match(name)) {
        alert('Your username contain invalid characters');
        x.name.focus();
        return false;
    }
    if (x.address.value == "") {
        alert('Please enter your address');
        x.address.focus();
        return false;
    }
    if (x.email.value == "") {
        alert('Please enter your email address');
        x.email.focus();
        return false;
    }
    if (x.mobileno.value == '') {
        alert('Please enter your mobile number');
        x.mobileno.focus();
        return false;
    }
    else if (!x.mobileno.value.match(phone)) {
        alert('Your mobile number contains invalid characters');
        x.mobileno.focus();
        return false;
    }
    else if (x.mobileno.value.length != 10) {
        alert('Invalid mobile number');
        x.mobileno.focus();
        return false;
    }
    else {
        var a = x.mobileno.value.split("");
        if (a[0] != 9 && a[0] != 8 && a[0] != 7 && a[0] != 6) {
            alert('Invalid mobile number');
            x.mobileno.focus();
            return false;
        }
    }
    if (x.username.value == '') {
        alert('Please enter your username');
        x.username.focus();
        return false;
    }
    if(x.password.value == ""){
        alert("please enter your new password");
        x.password.focus();
        return false;
    }
    if (x.profile.value == '') {
        alert('Please upload your Profile photo');
        x.profile.focus();
        return false;
    }
}