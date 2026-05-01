from django.db import migrations


def create_default_accounts(apps, schema_editor):
    Login = apps.get_model('department', 'login')
    Login.objects.get_or_create(username='admin', defaults={'password': 'admin', 'role': 'admin'})
    Login.objects.get_or_create(username='department', defaults={'password': 'department', 'role': 'department'})


def remove_default_accounts(apps, schema_editor):
    Login = apps.get_model('department', 'login')
    Login.objects.filter(username__in=['admin', 'department'], role__in=['admin', 'department']).delete()


class Migration(migrations.Migration):

    dependencies = [
        ('department', '0011_auto_20220430_1742'),
    ]

    operations = [
        migrations.RunPython(create_default_accounts, remove_default_accounts),
    ]
