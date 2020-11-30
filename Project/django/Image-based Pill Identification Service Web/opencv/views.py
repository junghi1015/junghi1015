from django.shortcuts import render
from django.views import generic

# Create your views here.
def first_view(request):
    return render(request, 'opencv/first_view.html', {})


from django.shortcuts import redirect
from django.core.files.storage import FileSystemStorage
from .forms import UploadImageForm, ImageUploadForm
from django.conf import settings
from .opencv_dface import opencv_dface
from django.views.decorators.http import require_http_methods, require_POST
from. models import PillsAll
from. models import Pill

from django.shortcuts import get_object_or_404

def first_view(request):
    return render(request, 'opencv/first_view.html', {})


def uimage(request):
    form_class = UploadImageForm
    form = form_class(request.POST or None)
    if request.method == 'POST':
        form = UploadImageForm(request.POST, request.FILES)
    if form.is_valid():
        myfile = request.FILES['image']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        uploaded_file_url = fs.url(filename)
        return render(request, 'opencv/uimage.html', {'form': form, 'uploaded_file_url': uploaded_file_url})
    else:
        form = UploadImageForm()
        return render(request, 'opencv/uimage.html', {'form': form})

def first(request):
    if request.method == 'POST':
        
        form = ImageUploadForm(request.POST, request.FILES)
        if form.is_valid():
            post = form.save(commit=False)
            post.save()


            imageURL = settings.MEDIA_URL + form.instance.document.name
            # opencv_dface(settings.MEDIA_ROOT_URL + imageURL)
            ocrResult = opencv_dface(settings.MEDIA_ROOT_URL + imageURL)
            print(ocrResult)
            pills = Pill.objects.filter(print_front = ocrResult ).distinct() #ocrResult

            context = {
                'form':form,
                'post':post, 
                'ocrResult':ocrResult,
                'pills':pills
                }
            #pillsAlls = PillsAll.objects.get(print_front = ocrResult) #ocrResult
            #print(pillsAlls)
            # context = {'pillsAlls':pillsAlls}

            return render(request, 'opencv/first.html', context)
    else:
        form = ImageUploadForm()
        return render(request, 'opencv/first.html',{'form':form})

def dface(request):
    if request.method == 'POST':
        
        form = ImageUploadForm(request.POST, request.FILES)
        if form.is_valid():
            post = form.save(commit=False)
            post.save()


            imageURL = settings.MEDIA_URL + form.instance.document.name
            # opencv_dface(settings.MEDIA_ROOT_URL + imageURL)
            ocrResult = opencv_dface(settings.MEDIA_ROOT_URL + imageURL)
            print(ocrResult)
            pills = Pill.objects.filter(print_front = ocrResult ).distinct() #ocrResult

            context = {
                'form':form,
                'post':post, 
                'ocrResult':ocrResult,
                'pills':pills
                }
            #pillsAlls = PillsAll.objects.get(print_front = ocrResult) #ocrResult
            #print(pillsAlls)
            # context = {'pillsAlls':pillsAlls}

            return render(request, 'opencv/dface.html', context)
    else:
        form = ImageUploadForm()
        return render(request, 'opencv/dface.html',{'form':form})


# def result(request):
        form = ImageUploadForm(request.POST, request.FILES)
        #form = ImageUploadForm(request.POST or None)
        if form.is_valid():

            imageURL = settings.MEDIA_URL + form.instance.document.name
            opencv_dface(settings.MEDIA_ROOT_URL + imageURL)
            ocrResult = opencv_dface(settings.MEDIA_ROOT_URL + imageURL)
    
            imageURL = settings.MEDIA_URL + form.instance.document.name
            # opencv_dface(settings.MEDIA_ROOT_URL + imageURL)
            ocrResult = opencv_dface(settings.MEDIA_ROOT_URL + imageURL)
            print(ocrResult)
            pills = Pill.objects.filter(print_front = ocrResult ).distinct() #ocrResult

            context = {
                'form':form,
                'post':post, 
                'ocrResult':ocrResult,
                'pills':pills
                }
            #pillsAlls = PillsAll.objects.get(print_front = ocrResult) #ocrResult
            #print(pillsAlls)
            # context = {'pillsAlls':pillsAlls}

            return render(request, 'opencv/again.html', context)

def again(request):
    if request.method == 'POST':
        
        form = ImageUploadForm(request.POST, request.FILES)
        if form.is_valid():
            post = form.save(commit=False)
            post.save()


            imageURL = settings.MEDIA_URL + form.instance.document.name
            # opencv_dface(settings.MEDIA_ROOT_URL + imageURL)
            ocrResult = opencv_dface(settings.MEDIA_ROOT_URL + imageURL)
            print(ocrResult)
            pills = Pill.objects.filter(print_front = ocrResult ).distinct() #ocrResult

            context = {
                # 'form':form,
                'post':post, 
                'ocrResult':ocrResult,
                'pills':pills
                }
            #pillsAlls = PillsAll.objects.get(print_front = ocrResult) #ocrResult
            #print(pillsAlls)
            # context = {'pillsAlls':pillsAlls}

            return render(request, 'opencv/again.html', context)
    else:
        form = ImageUploadForm()
        return render(request, 'opencv/again.html',{'form':form})

def final(request):
    return render(request, 'opencv/final.html', {})


def info(request):
    return render(request, 'opencv/info.html', {})

def info2(request):
    return render(request, 'opencv/info2.html', {})

def result(request):

        pills = Pill.objects.filter(print_front = '') #ocrResult
        context = {'pills':pills}

        return render(request, 'opencv/result.html', context)
    
    
    #pilllists = Pilllist.objects.all()
    #pilllists = Pilllist.objects.filter(print_front = 'ks') # 프라이머리 키 
    #context = {'pilllists':pilllists}

    # return render(request, 'opencv/result.html', context)