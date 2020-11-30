from django.conf.urls import url
from . import views
from django.urls import path


from django.conf import settings # add
from django.conf.urls.static import static # add


#urlpatterns = [

#    path('pilllist/', views.pilllist_view),
#]
urlpatterns = [
    url(r'^$', views.first_view, name='first_view'),
    url(r'^uimage/$', views.uimage, name='uimage'),
    url(r'^dface/$', views.dface, name='dface'), # add
    url(r'^result/$', views.result, name='result'),
    url(r'^again/$', views.again, name='again'),
    url(r'^final/$', views.final, name='final'),
    url(r'^info/$', views.info, name='info'),
    url(r'^info2/$', views.info2, name='info2'),
    url(r'^first/$', views.first, name='first'),

]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) # add

