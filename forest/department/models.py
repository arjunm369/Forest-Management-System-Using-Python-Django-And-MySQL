from pyexpat import model
from django.db import models

# Create your models here.
class login(models.Model):
    logid = models.AutoField(primary_key=True)
    username = models.CharField("username",max_length=50)
    password = models.CharField("password",max_length=25)
    role = models.CharField("role",max_length=25)

class user(models.Model):
    userid = models.AutoField(primary_key=True)
    login = models.ForeignKey(login,on_delete=models.CASCADE, null=True)
    name = models.CharField("name",max_length=50)
    address = models.CharField("address",max_length=150)
    email = models.CharField("email",max_length=50)
    mobileno = models.CharField("mobileno",max_length=50)
    profile = models.FileField("profile",max_length=100,upload_to="images/")

class forest(models.Model):
    forestid = models.AutoField(primary_key=True)
    name = models.CharField("name",max_length=100)
    area = models.CharField("area",max_length=100)
    district = models.CharField("district",max_length=50)
    location = models.CharField("location",max_length=100)
    attraction = models.CharField("attraction",max_length=200)
    website = models.CharField("website",max_length=50)

class flora(models.Model):
    floraid = models.AutoField(primary_key=True)
    forest = models.ForeignKey(forest,on_delete=models.CASCADE, null=True)
    name = models.CharField("name",max_length=100)
    botanical = models.CharField("botanical",max_length=100)
    habitat = models.CharField("habitat",max_length=100)
    vegetation = models.CharField("vegetation",max_length=100)
    description = models.CharField("description",max_length=300)
    photo = models.FileField("photo:",max_length=100,upload_to="images/")

class fauna(models.Model):
    faunaid = models.AutoField(primary_key=True)
    forest = models.ForeignKey(forest,on_delete=models.CASCADE, null=True)
    name = models.CharField("name",max_length=100)
    category = models.CharField("category",max_length=100)
    habitat = models.CharField("habitat",max_length=100)
    description = models.CharField("description",max_length=300)
    photo = models.FileField("photo",max_length=100,upload_to="images/")

class news(models.Model):
    newsid = models.AutoField(primary_key=True)
    title = models.CharField("title",max_length=100)
    date = models.DateField("date",max_length=100)
    description = models.CharField("description",max_length=300)

class awareness_program(models.Model):
    programid = models.AutoField(primary_key=True)
    title = models.CharField("title",max_length=100)
    cname = models.CharField("cname",max_length=100)
    date = models.DateField("date",max_length=100)
    description = models.CharField("description",max_length=300)

class entrypass(models.Model):
    entrypassid = models.AutoField(primary_key=True)
    userid = models.ForeignKey(user,on_delete=models.CASCADE,null=True)
    date = models.DateField("date",max_length=100)
    forest = models.ForeignKey(forest,on_delete=models.CASCADE, null=True)
    description = models.CharField("description",max_length=300)
    status = models.CharField("status",max_length=30)

class category(models.Model):
    categoryid = models.AutoField(primary_key=True)
    category = models.CharField("category",max_length=50)

class product(models.Model):
    productid = models.AutoField(primary_key=True)
    category = models.ForeignKey(category,on_delete=models.CASCADE, null=True)
    name = models.CharField("name",max_length=100)
    uses = models.CharField("uses",max_length=300)
    quantity = models.CharField("quantity",max_length=100)
    price = models.CharField("price",max_length=100)
    image = models.FileField("image",max_length=100,upload_to="images/")

class payment(models.Model):
    paymentid = models.AutoField(primary_key=True)
    user = models.ForeignKey(user,on_delete=models.CASCADE, null=True)
    product = models.ForeignKey(product,on_delete=models.CASCADE, null=True)
    date = models.DateField("date",max_length=100)
    amount = models.DateField("amount",max_length=100)
    cardtype = models.DateField("cardtype",max_length=100)
    cardno = models.DateField("cardno",max_length=100)
    cvv = models.DateField("cvv",max_length=100)
    
    

