# Generated by Django 3.1.3 on 2020-11-21 06:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('opencv', '0010_auto_20201118_1921'),
    ]

    operations = [
        migrations.CreateModel(
            name='PillsAll',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('item_seq', models.IntegerField(blank=True, db_column='ITEM_SEQ', null=True)),
                ('item_name', models.TextField(blank=True, db_column='ITEM_NAME', null=True)),
                ('entp_seq', models.IntegerField(blank=True, db_column='ENTP_SEQ', null=True)),
                ('entp_name', models.TextField(blank=True, db_column='ENTP_NAME', null=True)),
                ('chart', models.TextField(blank=True, db_column='CHART', null=True)),
                ('item_image', models.TextField(blank=True, db_column='ITEM_IMAGE', null=True)),
                ('print_front', models.TextField(blank=True, db_column='PRINT_FRONT', null=True)),
                ('print_back', models.TextField(blank=True, db_column='PRINT_BACK', null=True)),
                ('drug_shape', models.TextField(blank=True, db_column='DRUG_SHAPE', null=True)),
                ('color_class1', models.TextField(blank=True, db_column='COLOR_CLASS1', null=True)),
                ('color_class2', models.TextField(blank=True, db_column='COLOR_CLASS2', null=True)),
                ('line_front', models.TextField(blank=True, db_column='LINE_FRONT', null=True)),
                ('line_back', models.TextField(blank=True, db_column='LINE_BACK', null=True)),
                ('leng_long', models.IntegerField(blank=True, db_column='LENG_LONG', null=True)),
                ('leng_short', models.IntegerField(blank=True, db_column='LENG_SHORT', null=True)),
                ('thick', models.IntegerField(blank=True, db_column='THICK', null=True)),
                ('img_regist_ts', models.IntegerField(blank=True, db_column='IMG_REGIST_TS', null=True)),
                ('class_no', models.IntegerField(blank=True, db_column='CLASS_NO', null=True)),
                ('class_name', models.TextField(blank=True, db_column='CLASS_NAME', null=True)),
                ('etc_otc_name', models.TextField(blank=True, db_column='ETC_OTC_NAME', null=True)),
                ('item_permit_date', models.IntegerField(blank=True, db_column='ITEM_PERMIT_DATE', null=True)),
                ('form_code_name', models.TextField(blank=True, db_column='FORM_CODE_NAME', null=True)),
                ('mark_code_front_anal', models.TextField(blank=True, db_column='MARK_CODE_FRONT_ANAL', null=True)),
                ('mark_code_front_img', models.TextField(blank=True, db_column='MARK_CODE_FRONT_IMG', null=True)),
                ('mark_code_back_img', models.TextField(blank=True, db_column='MARK_CODE_BACK_IMG', null=True)),
                ('item_eng_name', models.TextField(blank=True, db_column='ITEM_ENG_NAME', null=True)),
                ('mark_code_front', models.TextField(blank=True, db_column='MARK_CODE_FRONT', null=True)),
                ('mark_code_back', models.TextField(blank=True, db_column='MARK_CODE_BACK', null=True)),
                ('edi_code', models.TextField(blank=True, db_column='EDI_CODE', null=True)),
            ],
            options={
                'db_table': 'pills_all',
                'managed': False,
            },
        ),
    ]
