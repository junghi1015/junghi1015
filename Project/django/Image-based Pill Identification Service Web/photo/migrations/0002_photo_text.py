# Generated by Django 3.1.3 on 2020-11-07 07:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('photo', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='photo',
            name='text',
            field=models.TextField(null=True),
        ),
    ]
