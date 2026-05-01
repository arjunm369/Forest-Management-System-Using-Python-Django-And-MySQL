from ast import Return
from django.http import HttpResponse
from unicodedata import name
from urllib import response
from django.shortcuts import render,redirect
from .models import login as log,user as us,forest as fo,flora as fl,fauna as fn,news as ns,awareness_program as ap,entrypass as ep,category as ct,product as pt
from .models import payment as pm,police as pol
# Create your views here.
def index(request):
    msg=request.GET.get("msg","")
    return render(request,"index.html",{"msg":msg})

def adminhome(request):
    msg=request.GET.get("msg","")
    return render(request,"adminhome.html",{"msg":msg})

def adminhead(request):
    msg=request.GET.get("msg","")
    return render(request,"adminhead.html",{"msg":msg})

def login(request):
    if request.method != "POST":
        return redirect('/index/?msg=please login again')

    username = request.POST.get("username", "").strip()
    password = request.POST.get("password", "")

    if not username or not password:
        return redirect('/index/?msg=enter username and password')

    try:
        data = log.objects.filter(username=username, password=password).first()
        if data is None:
            return redirect('/index/?msg=invalid username or password')

        request.session['username'] = data.username
        request.session['role'] = data.role
        request.session['id'] = data.logid

        if data.role == "admin":
            return redirect('/adminhome/?msg=welcome admin')
        if data.role == "user":
            return redirect('/userhome/?msg=Welcome user')
        if data.role == "department":
            return redirect('/departmenthome/?msg=Welcome Forest department')

        return redirect('/index/?msg=invalid access')
    except Exception:
        return redirect('/index/?msg=something went wrong')

def logout(request):
    try:
        del request.session['id']
        del request.session['role']
        del request.session['username']
        return redirect("/index/?msg=logout")
    except:
        return redirect("/index/?msg=logout")

def user(request):
    if request.method != "POST":
        return redirect("/index/?msg=please submit the registration form again")

    name = request.POST.get("name", "").strip()
    address = request.POST.get("address", "").strip()
    email = request.POST.get("email", "").strip()
    mobileno = request.POST.get("mobileno", "").strip()
    username = request.POST.get("username", "").strip()
    password = request.POST.get("password", "")
    profile = request.FILES.get("profile")

    if not all([name, address, email, mobileno, username, password, profile]):
        return redirect("/index/?msg=please fill all registration fields")

    if log.objects.filter(username=username).exists():
        return redirect("/index/?msg=username already exists")

    created_login = log.objects.create(username=username, password=password, role="user")
    us.objects.create(
        login=created_login,
        name=name,
        address=address,
        email=email,
        mobileno=mobileno,
        profile=profile,
    )
    return redirect("/index/?msg=registration successful")

def adprivacy(request):
    msg=request.GET.get("msg","")
    return render(request,"adprivacy.html",{"msg":msg})

def privacy(request):
     if request.POST:
        oldpsw=request.POST["oldpsw"]
        newpsw=request.POST["newpsw"]
        id=request.session['id']
        log.objects.filter(logid=id,password=oldpsw).update(password=newpsw)
        if(request.session.get('role', ' ')=="admin"):
           response=redirect("/adminhome?msg=Password updated successfully")
           return response
        elif(request.session.get('role', ' ')=="user"):
           response=redirect("/userhome?msg=Password updated successfully")
           return response
        elif(request.session.get('role', ' ')=="department"):
           response=redirect("/departmenthome?msg=Password updated successfully")
           return response

def forestdetails(request):
    msg=request.GET.get("msg","")
    return render(request,"forestdetails.html",{"msg":msg})

def forest(request):
    if request.POST:
        name=request.POST["name"]
        area=request.POST["area"]
        district=request.POST["district"]
        location=request.POST["location"]
        attraction=request.POST["attraction"]
        website=request.POST["website"]
        fo.objects.create(name=name,area=area,district=district,location=location,attraction=attraction,website=website)
        response=redirect("/forestdetails?msg=Added succseefully")
        return response
    else:
        response=redirect("/forestdetails?msg=Operation failed")
        return response

def forestlist(request):
    msg=request.GET.get("msg","")
    dataf=fo.objects.all()
    return render(request,"forestlist.html",{"dataf":dataf,"msg":msg}) 

def deleteforest(request):
    id=request.POST["cid"]
    fo.objects.filter(forestid=id).delete()
    response = redirect("/forestlist?msg=Forest deleted successfully")
    return response  

def editforest(request):
    id=request.POST["fid"]
    name=request.POST["name"]
    area=request.POST["area"]
    district=request.POST["district"]
    location=request.POST["location"]
    attraction=request.POST["attraction"]
    website=request.POST["website"]
    fo.objects.filter(forestid=id).update(name=name,area=area,district=district,location=location,attraction=attraction,website=website)
    response = redirect("/forestlist?msg=Updated Successfully")
    return response

def flora(request):
    msg=request.GET.get("msg","")
    data=fo.objects.all()
    return render(request,"flora.html",{"msg":msg,"data":data})

def floradetails(request):
    if request.POST:
        forest=request.POST["forest"]
        name=request.POST["name"]
        botanical=request.POST["botanical"]
        habitat=request.POST["habitat"]
        vegetation=request.POST["vegetation"]
        description=request.POST["description"]
        photo=request.FILES["photo"]
        dataf=fo.objects.get(forestid=forest)
        fl.objects.create(forest=dataf,name=name,botanical=botanical,habitat=habitat,vegetation=vegetation,description=description,photo=photo)
        response=redirect("/flora?msg=Added successfully")
        return response
    else:
        response=redirect("/flora?msg=Operation failed")
        return response

def floralist(request):
    msg=request.GET.get("msg","")
    dataf=fl.objects.all()
    return render(request,"floralist.html",{"dataf":dataf,"msg":msg})

def deleteflora(request):
    id=request.POST["cid"]
    fl.objects.filter(floraid=id).delete()
    response = redirect("/floralist?msg= deleted successfully")
    return response 

def editflora(request):
    id=request.POST["lid"]
    name=request.POST["name"]
    botanical=request.POST["botanical"]
    habitat=request.POST["habitat"]
    vegetation=request.POST["vegetation"]
    description=request.POST["description"]
    fl.objects.filter(floraid=id).update(name=name,botanical=botanical,habitat=habitat,vegetation=vegetation,description=description)
    response = redirect("/floralist?msg=Updated Successfully")
    return response

def fauna(request):
    msg=request.GET.get("msg","")
    data=fo.objects.all()
    return render(request,"fauna.html",{"msg":msg,"data":data})

def faunadetails(request):
    if request.POST:
        forest=request.POST["forest"]
        name=request.POST["name"]
        habitat=request.POST["habitat"]
        description=request.POST["description"]
        photo=request.FILES["photo"]
        dataf=fo.objects.get(forestid=forest)
        fn.objects.create(forest=dataf,name=name,habitat=habitat,description=description,photo=photo)
        response=redirect("/fauna?msg=Added successfully")
        return response
    else:
        response=redirect("/fauna?msg=Operation failed")
        return response

def faunalist(request):
    msg=request.GET.get("msg","")
    data=fn.objects.all()
    return render(request,"faunalist.html",{"data":data,"msg":msg})

def deletefauna(request):
    id=request.POST["cid"]
    fn.objects.filter(faunaid=id).delete()
    response = redirect("/faunalist?msg= deleted successfully")
    return response 

def editfauna(request):
    id=request.POST["fid"]
    name=request.POST["name"]
    category=request.POST["category"]
    habitat=request.POST["habitat"]
    description=request.POST["description"]
    fn.objects.filter(faunaid=id).update(name=name,category=category,habitat=habitat,description=description)
    response = redirect("/faunalist?msg=Updated Successfully")
    return response

def news(request):
    msg=request.GET.get("msg","")
    return render(request,"news.html",{"msg":msg})

def newsdetails(request):
    if request.POST:
        title=request.POST["title"]
        date=request.POST["date"]
        description=request.POST["description"]
        ns.objects.create(title=title,date=date,description=description)
        response=redirect("/news?msg=Added successfully")
        return response
    else:
        response=redirect("/news?msg=Operation failed")
        return response

def newslist(request):
    msg=request.GET.get("msg","")
    data=ns.objects.all()
    return render(request,"newslist.html",{"data":data,"msg":msg})

def deletenews(request):
    id=request.POST["nid"]
    ns.objects.filter(newsid=id).delete()
    response = redirect("/newslist?msg=News deleted successfully")
    return response 

def editnews(request):
    id=request.POST["nid"]
    title=request.POST["title"]
    date=request.POST["date"]
    description=request.POST["description"]
    ns.objects.filter(newsid=id).update(title=title,date=date,description=description)
    response = redirect("/newslist?msg=Updated Successfully")
    return response

def departmenthome(request):
    msg=request.GET.get("msg","")
    return render(request,"departmenthome.html",{"msg":msg})

def departmenthead(request):
    return render(request,"departmenthead.html")

def depprivacy(request):
    return render(request,"depprivacy.html")

def addprogram(request):
    msg=request.GET.get("msg","")
    return render(request,"addprogram.html",{"msg":msg})

def program(request):
    if request.POST:
        title=request.POST["title"]
        cname=request.POST["cname"]
        date=request.POST["date"]
        description=request.POST["description"]
        ap.objects.create(title=title,cname=cname,date=date,description=description)
        response=redirect("/addprogram?msg=Added successfully")
        return response
    else:
        response=redirect("/addprogram?msg=Operation failed")
        return response

def programlist(request):
    msg=request.GET.get("msg","")
    data=ap.objects.all()
    return render(request,"programlist.html",{"data":data,"msg":msg})

def deleteprogram(request):
    id=request.POST["pid"]
    ap.objects.filter(programid=id).delete()
    response = redirect("/programlist?msg=Program deleted successfully")
    return response 

def editprogram(request):
    id=request.POST["rid"]
    title=request.POST["title"]
    cname=request.POST["cname"]
    description=request.POST["description"]
    ap.objects.filter(programid=id).update(title=title,cname=cname,description=description)
    response = redirect("/programlist?msg= Program Updated Successfully")
    return response

def userhome(request):
    msg=request.GET.get("msg","")
    return render(request,"userhome.html",{"msg":msg})

def userhead(request):
    return render(request,"userhead.html")

def addofficer(request):
    msg=request.GET.get("msg","")
    return render(request,"addofficer.html",{"msg":msg})

def officerlist(request):
    msg=request.GET.get("msg","")
    data=pol.objects.all()
    return render(request,"officerlist.html",{"data":data,"msg":msg})

def depnews(request):
    datad=ns.objects.all()
    return render(request,"depnews.html",{"datad":datad})

def usrnews(request):
    datad=ns.objects.all()
    return render(request,"usrnews.html",{"datad":datad})

def applypass(request):
    msg=request.GET.get("msg","")
    data=fo.objects.all()
    return render(request,"applypass.html",{"data":data,"msg":msg})

def apply(request):
    if request.POST:
        date=request.POST["date"]
        forest=request.POST["forest"]
        description=request.POST["description"]
        id=request.session['id']
        datal=log.objects.get(logid=id)
        datau=us.objects.get(login=datal)
        dataf=fo.objects.get(forestid=forest)
        ep.objects.create(date=date,forest=dataf,description=description,userid=datau,status="waiting")
        response=redirect("/applypass?msg=Booked successsfully")
        return response
    else:
        response=redirect("/applypass?,msg=Operation failed")
        return response

def producttype(request):
    msg=request.GET.get("msg","")
    return render(request,"producttype.html",{"msg":msg})

def category(request):
    if request.POST:
        category=request.POST["category"]
        ct.objects.create(category=category)
        response=redirect("/producttype?msg=Added successfully")
        return response
    else:
        response=redirect("/producttype?msg=Operation failed")
        return response

def product(request):
    msg=request.GET.get("msg","")
    data=ct.objects.all()
    return render(request,"product.html",{"data":data,"msg":msg})

def pro(request):
    if request.POST:
        category=request.POST["category"]
        name=request.POST["name"]
        uses=request.POST["uses"]
        quantity=request.POST["quantity"]
        price=request.POST["price"]
        image=request.FILES["image"]
        datac=ct.objects.get(categoryid=category)
        pt.objects.create(category=datac,name=name,uses=uses,quantity=quantity,price=price,image=image)
        response=redirect("/product?msg=Added successfully")
        return response
    else:
        response=redirect("/product?msg=Operation failed")
        return response

def productlist(request):
    msg=request.GET.get("msg","")
    data=pt.objects.all()
    return render(request,"productlist.html",{"data":data,"msg":msg})

def deleteproduct(request):
    id=request.POST["pid"]
    pt.objects.filter(productid=id).delete()
    response = redirect("/productlist?msg= deleted successfully")
    return response 

def editproduct(request):
    id=request.POST["eid"]
    name=request.POST["name"]
    uses=request.POST["uses"]
    quantity=request.POST["quantity"]
    price=request.POST["price"]
    pt.objects.filter(productid=id).update(name=name,uses=uses,quantity=quantity,price=price)
    response = redirect("/productlist?msg=Updated Successfully")
    return response

def categorylist(request):
    msg=request.GET.get("msg","")
    data=ct.objects.all()
    return render(request,"categorylist.html",{"msg":msg,"data":data})

def deletecat(request):
    id=request.POST["cid"]
    ct.objects.filter(categoryid=id).delete()
    response = redirect("/categorylist?msg= deleted successfully")
    return response 

def editcat(request):
    id=request.POST["nid"]
    category=request.POST["category"]
    ct.objects.filter(categoryid=id).update(category=category)
    response = redirect("/categorylist?msg=Updated Successfully")
    return response

def usrprivacy(request):
    return render(request,"usrprivacy.html")

def shop(request):
    data=pt.objects.all()
    return render(request,"shop.html",{"data":data})

def payment(request):
    return render(request,"payment.html")

def pay(request):
    if request.POST:
    
        date=request.POST["date"]
        amount=request.POST["amount"]
        cardtype=request.POST["cardtype"]
        cardno=request.POST["cardno"]
        cvv=request.POST["cvv"]
        id=request.session["id"]
        datal=log.objects.get(logid=id)
        datau=us.objects.get(login=datal)
        pm.objects.create(user=datau,date=date,amount=amount,cardtype=cardtype,cardno=cardno,cvv=cvv)
        return HttpResponse("Payment successful!")
    
    else:
        return HttpResponse("Invalid request")
        
        
def usrforest(request):
    datad=fo.objects.all()
    return render(request,"usrforest.html",{"datad":datad})

def usrprofile(request):
    msg=request.GET.get("msg","")
    id=request.session['id']
    datal=log.objects.get(logid=id)
    datapf=us.objects.filter(login=datal).all()
    return render(request,"usrprofile.html",{"msg":msg,"datapf":datapf})

def editprofile(request):
    id=request.POST["uid"]
    name=request.POST["name"]
    address=request.POST["address"]
    email=request.POST["email"]
    mobileno=request.POST["mobileno"]
    us.objects.filter(userid=id).update(name=name,address=address,email=email,mobileno=mobileno)
    response = redirect("/usrprofile?msg=Profile Details Updated Successfully")
    return response

def passreq(request):
    msg=request.GET.get("msg","")
    data=ep.objects.filter(status="waiting").all()
    return render(request,"passreq.html",{"data":data,"msg":msg})

def approvepass(request):
    id=request.POST["eid"]
    ep.objects.filter(entrypassid=id).update(status="approved")
    response = redirect("/passreq?msg= Approved")
    return response 

def rejectpass(request):
    id=request.POST["rid"]
    ep.objects.filter(entrypassid=id).update(status="rejected")
    response = redirect("/passreq?msg= Rejected")
    return response 

def accpass(request):
    msg=request.GET.get("msg","")
    data=ep.objects.filter(status="approved").all()
    return render(request,"accpass.html",{"data":data,"msg":msg})

def rejpass(request):
    msg=request.GET.get("msg","")
    data=ep.objects.filter(status="rejected").all()
    return render(request,"rejpass.html",{"data":data,"msg":msg})

def usrprograms(request):
    data=ap.objects.all()
    return render(request,"usrprograms.html",{"data":data})

def viewpay(request):
    data=pm.objects.all()
    return render(request,"viewpay.html",{"data":data})
    
def passstatus(request):
    logid=request.session["id"]
    user=us.objects.get(login=logid)
    data=ep.objects.filter(userid=user.userid)
    return render(request,"passstatus.html",{"data":data})

def police(request):
    if request.POST:
        name=request.POST["name"]
        idno=request.POST["idno"]
        designation=request.POST["designation"]
        address=request.POST["address"]
        contactno=request.POST["contactno"]
        pol.objects.create(name=name,idno=idno,designation=designation,address=address,contactno=contactno)
        response=redirect("/addofficer?msg=Added successsfull")
        return response
    else:
        response=redirect("/addofficer?msg=Operation failed")
        return response

def deletepolice(request):
    id=request.POST["pid"]
    pol.objects.filter(policeid=id).delete()
    response = redirect("/officerlist?msg= deleted successfully")
    return response

def editpolice(request):
    id=request.POST["rid"]
    name=request.POST["name"]
    idno=request.POST["idno"]
    designation=request.POST["designation"]
    address=request.POST["address"]
    contactno=request.POST["contactno"]
    pol.objects.filter(policeid=id).update(name=name,idno=idno,designation=designation,address=address,contactno=contactno)
    response = redirect("/officerlist?msg= Police Details Updated Successfully")
    return response

def about(request):
    return render(request,"about.html")

def gallery(request):
    return render(request,"gallery.html")

def contact(request):
    return render(request,"contact.html")

def viewpurchase(request):
    return render(request,"viewpurchase.html")