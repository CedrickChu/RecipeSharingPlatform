# Generated by Django 5.0.3 on 2024-03-16 03:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('projectapp', '0002_recipe_rating_comment'),
    ]

    operations = [
        migrations.AlterField(
            model_name='recipe',
            name='image',
            field=models.FileField(blank=True, null=True, upload_to='recipe_images/'),
        ),
    ]
