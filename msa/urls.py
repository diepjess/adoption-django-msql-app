from django.urls import path

from . import views

app_name = 'msa'
urlpatterns = [
    # ex: /msa/
    path('', views.index, name='index'),

    # ex /msa/search/
    path('search/', views.search, name='search'),

    #ex /msa/petinfo/1/
    path('petinfo/<int:petinfo_id>', views.petInfoDetail, name='petinfodetail'),

    #ex /msa/getsheltersfromcity/
    path('getSheltersFromCity/', views.getSheltersFromCity, name='getSheltersFromCity'),

    #ex /msa/getspeciesfromshelter/
    path('getSpeciesFromShelter/', views.getSpeciesFromShelter, name='getSpeciesFromShelter'),

    #ex /msa/userpets/1/
    path('userpets/', views.userAdoptedPetResult, name='userpets')
]