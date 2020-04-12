from django.urls import path

from . import views

app_name = 'msa'
urlpatterns = [
    # ex: /msa/
    path('', views.index, name='index'),

    # ex /msa/1/
    path('<int:question_id>/', views.detail, name='detail'),

    # ex /msa/1/results/
    path('<int:question_id>/results/', views.results, name='results'),

    # ex /msa/1/vote/
    path('<int:question_id>/vote/', views.vote, name='vote'),

    # ex /msa/search/
    path('search/', views.search, name='search'),
]