from django.db import models

# Create your models here.
class ImageUploadModel(models.Model):
    description = models.CharField(max_length=255, blank=True)
    document = models.ImageField(upload_to='images/%Y/%m/%d')
    uploaded_at = models.DateTimeField(auto_now_add=True)



class Pilllist(models.Model):
    print_front = models.CharField(db_column='PRINT_FRONT', max_length=100, blank=True, null=False)#primary_key=True
    item_seq = models.IntegerField(primary_key=True, db_column='ITEM_SEQ', blank=True, null=False)  # Field name made lowercase.
    item_name = models.CharField(db_column='ITEM_NAME', max_length=200, blank=True, null=True)  # Field name made lowercase.
    entp_seq = models.IntegerField(db_column='ENTP_SEQ', blank=True, null=True)  # Field name made lowercase.
    entp_name = models.CharField(db_column='ENTP_NAME', max_length=100, blank=True, null=True)  # Field name made lowercase.
    chart = models.CharField(db_column='CHART', max_length=200, blank=True, null=True)  # Field name made lowercase.
    item_image = models.CharField(db_column='ITEM_IMAGE', max_length=100, blank=True, null=True)  # Field name made lowercase.
    #print_front = models.CharField(db_column='PRINT_FRONT', max_length=100, blank=true, null=True)(primary_key=True)  # Field name made lowercase.
    print_back = models.CharField(db_column='PRINT_BACK', max_length=100, blank=True, null=True)  # Field name made lowercase.
    drug_shape = models.CharField(db_column='DRUG_SHAPE', max_length=100, blank=True, null=True)  # Field name made lowercase.
    color_class1 = models.CharField(db_column='COLOR_CLASS1', max_length=100, blank=True, null=True)  # Field name made lowercase.
    color_class2 = models.CharField(db_column='COLOR_CLASS2', max_length=100, blank=True, null=True)  # Field name made lowercase.
    line_front = models.CharField(db_column='LINE_FRONT', max_length=100, blank=True, null=True)  # Field name made lowercase.
    line_back = models.CharField(db_column='LINE_BACK', max_length=100, blank=True, null=True)  # Field name made lowercase.
    leng_long = models.IntegerField(db_column='LENG_LONG', blank=True, null=True)  # Field name made lowercase.
    leng_short = models.IntegerField(db_column='LENG_SHORT', blank=True, null=True)  # Field name made lowercase.
    thick = models.IntegerField(db_column='THICK', blank=True, null=True)  # Field name made lowercase.
    img_regist_ts = models.IntegerField(db_column='IMG_REGIST_TS', blank=True, null=True)  # Field name made lowercase.
    class_no = models.IntegerField(db_column='CLASS_NO', blank=True, null=True)  # Field name made lowercase.
    class_name = models.CharField(db_column='CLASS_NAME', max_length=100, blank=True, null=True)  # Field name made lowercase.
    etc_otc_name = models.CharField(db_column='ETC_OTC_NAME', max_length=100, blank=True, null=True)  # Field name made lowercase.
    item_permit_date = models.IntegerField(db_column='ITEM_PERMIT_DATE', blank=True, null=True)  # Field name made lowercase.
    form_code_name = models.CharField(db_column='FORM_CODE_NAME', max_length=100, blank=True, null=True)  # Field name made lowercase.
    mark_code_front_anal = models.CharField(db_column='MARK_CODE_FRONT_ANAL', max_length=100, blank=True, null=True)  # Field name made lowercase.
    mark_code_front_img = models.CharField(db_column='MARK_CODE_FRONT_IMG', max_length=100, blank=True, null=True)  # Field name made lowercase.
    mark_code_back_img = models.CharField(db_column='MARK_CODE_BACK_IMG', max_length=100, blank=True, null=True)  # Field name made lowercase.
    item_eng_name = models.CharField(db_column='ITEM_ENG_NAME', max_length=200, blank=True, null=True)  # Field name made lowercase.
    mark_code_front = models.CharField(db_column='MARK_CODE_FRONT', max_length=100, blank=True, null=True)  # Field name made lowercase.
    mark_code_back = models.CharField(db_column='MARK_CODE_BACK', max_length=100, blank=True, null=True)  # Field name made lowercase.
    edi_code = models.CharField(db_column='EDI_CODE', max_length=100, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pilllist'

class PillsAll(models.Model):
    print_front = models.TextField(db_column='PRINT_FRONT', blank=True, null=False)
    item_seq = models.IntegerField(primary_key=True, db_column='ITEM_SEQ', blank=True, null=False)  # Field name made lowercase.
    item_name = models.TextField(db_column='ITEM_NAME', blank=True, null=True)  # Field name made lowercase.
    entp_seq = models.IntegerField(db_column='ENTP_SEQ', blank=True, null=True)  # Field name made lowercase.
    entp_name = models.TextField(db_column='ENTP_NAME', blank=True, null=True)  # Field name made lowercase.
    chart = models.TextField(db_column='CHART', blank=True, null=True)  # Field name made lowercase.   
    item_image = models.TextField(db_column='ITEM_IMAGE', blank=True, null=True)  # Field name made lowercase.
    #print_front = models.TextField(db_column='PRINT_FRONT', blank=True, null=True)  # Field name made lowercase.
    print_back = models.TextField(db_column='PRINT_BACK', blank=True, null=True)  # Field name made lowercase.
    drug_shape = models.TextField(db_column='DRUG_SHAPE', blank=True, null=True)  # Field name made lowercase.
    color_class1 = models.TextField(db_column='COLOR_CLASS1', blank=True, null=True)  # Field name made lowercase.
    color_class2 = models.TextField(db_column='COLOR_CLASS2', blank=True, null=True)  # Field name made lowercase.
    line_front = models.TextField(db_column='LINE_FRONT', blank=True, null=True)  # Field name made lowercase.
    line_back = models.TextField(db_column='LINE_BACK', blank=True, null=True)  # Field name made lowercase.
    leng_long = models.IntegerField(db_column='LENG_LONG', blank=True, null=True)  # Field name made lowercase.
    leng_short = models.IntegerField(db_column='LENG_SHORT', blank=True, null=True)  # Field name made lowercase.
    thick = models.IntegerField(db_column='THICK', blank=True, null=True)  # Field name made lowercase.
    img_regist_ts = models.IntegerField(db_column='IMG_REGIST_TS', blank=True, null=True)  # Field name made lowercase.
    class_no = models.IntegerField(db_column='CLASS_NO', blank=True, null=True)  # Field name made lowercase.
    class_name = models.TextField(db_column='CLASS_NAME', blank=True, null=True)  # Field name made lowercase.
    etc_otc_name = models.TextField(db_column='ETC_OTC_NAME', blank=True, null=True)  # Field name made lowercase.
    item_permit_date = models.IntegerField(db_column='ITEM_PERMIT_DATE', blank=True, null=True)  # Field name made lowercase.
    form_code_name = models.TextField(db_column='FORM_CODE_NAME', blank=True, null=True)  # Field name made lowercase.
    mark_code_front_anal = models.TextField(db_column='MARK_CODE_FRONT_ANAL', blank=True, null=True)  # Field name made lowercase.
    mark_code_front_img = models.TextField(db_column='MARK_CODE_FRONT_IMG', blank=True, null=True)  # Field name made lowercase.
    mark_code_back_img = models.TextField(db_column='MARK_CODE_BACK_IMG', blank=True, null=True)  # Field name made lowercase.
    item_eng_name = models.TextField(db_column='ITEM_ENG_NAME', blank=True, null=True)  # Field name made lowercase.
    mark_code_front = models.TextField(db_column='MARK_CODE_FRONT', blank=True, null=True)  # Field name made lowercase.
    mark_code_back = models.TextField(db_column='MARK_CODE_BACK', blank=True, null=True)  # Field name made lowercase.
    edi_code = models.TextField(db_column='EDI_CODE', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pills_all'

class Pill(models.Model):
    print_front = models.TextField(db_column='PRINT_FRONT', blank=True, null=False)
    item_seq = models.IntegerField(primary_key=True, db_column='ITEM_SEQ', blank=True, null=False)  # Field name made lowercase.
    item_name = models.TextField(db_column='ITEM_NAME', blank=True, null=True)  # Field name made lowercase.
    entp_seq = models.IntegerField(db_column='ENTP_SEQ', blank=True, null=True)  # Field name made lowercase.
    entp_name = models.TextField(db_column='ENTP_NAME', blank=True, null=True)  # Field name made lowercase.
    chart = models.TextField(db_column='CHART', blank=True, null=True)  # Field name made lowercase.
    item_image = models.TextField(db_column='ITEM_IMAGE', blank=True, null=True)  # Field name made lowercase.
    #print_front = models.TextField(db_column='PRINT_FRONT', blank=True, null=True)  # Field name made lowercase.
    print_back = models.TextField(db_column='PRINT_BACK', blank=True, null=True)  # Field name made lowercase.
    drug_shape = models.TextField(db_column='DRUG_SHAPE', blank=True, null=True)  # Field name made lowercase.
    color_class1 = models.TextField(db_column='COLOR_CLASS1', blank=True, null=True)  # Field name made lowercase.
    color_class2 = models.TextField(db_column='COLOR_CLASS2', blank=True, null=True)  # Field name made lowercase.
    line_front = models.TextField(db_column='LINE_FRONT', blank=True, null=True)  # Field name made lowercase.
    line_back = models.TextField(db_column='LINE_BACK', blank=True, null=True)  # Field name made lowercase.
    leng_long = models.FloatField(db_column='LENG_LONG', blank=True, null=True)  # Field name made lowercase.
    leng_short = models.FloatField(db_column='LENG_SHORT', blank=True, null=True)  # Field name made lowercase.
    thick = models.FloatField(db_column='THICK', blank=True, null=True)  # Field name made lowercase.
    img_regist_ts = models.IntegerField(db_column='IMG_REGIST_TS', blank=True, null=True)  # Field name made lowercase.
    class_no = models.TextField(db_column='CLASS_NO', blank=True, null=True)  # Field name made lowercase.
    class_name = models.TextField(db_column='CLASS_NAME', blank=True, null=True)  # Field name made lowercase.
    etc_otc_name = models.TextField(db_column='ETC_OTC_NAME', blank=True, null=True)  # Field name made lowercase.
    item_permit_date = models.IntegerField(db_column='ITEM_PERMIT_DATE', blank=True, null=True)  # Field name made lowercase.    
    form_code_name = models.TextField(db_column='FORM_CODE_NAME', blank=True, null=True)  # Field name made lowercase.
    mark_code_front_anal = models.TextField(db_column='MARK_CODE_FRONT_ANAL', blank=True, null=True)  # Field name made lowercase.
    mark_code_back_anal = models.TextField(db_column='MARK_CODE_BACK_ANAL', blank=True, null=True)  # Field name made lowercase. 
    mark_code_front_img = models.TextField(db_column='MARK_CODE_FRONT_IMG', blank=True, null=True)  # Field name made lowercase. 
    mark_code_back_img = models.TextField(db_column='MARK_CODE_BACK_IMG', blank=True, null=True)  # Field name made lowercase.   
    item_eng_name = models.TextField(db_column='ITEM_ENG_NAME', blank=True, null=True)  # Field name made lowercase.
    change_date = models.TextField(db_column='CHANGE_DATE', blank=True, null=True)  # Field name made lowercase.
    mark_code_front = models.TextField(db_column='MARK_CODE_FRONT', blank=True, null=True)  # Field name made lowercase.
    mark_code_back = models.TextField(db_column='MARK_CODE_BACK', blank=True, null=True)  # Field name made lowercase.
    edi_code = models.TextField(db_column='EDI_CODE', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pill'
    