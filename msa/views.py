from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.template import loader
from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from django.db import connection, IntegrityError
from collections import namedtuple
from django.http import JsonResponse

# show the base view of the actions a user can do, hyperlinked
def index(request):
    template = loader.get_template('msa/index.html')
    context = {
        'context': 'context',
    }
    return HttpResponse(template.render(context, request))

# FUNCTIONS TO MANIPULATE QUERYSET RETURNED FROM STORED PROCEDURE
def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

def namedtuplefetchall(cursor):
    "Return all rows from a cursor as a namedtuple"
    desc = cursor.description
    nt_result = namedtuple('Result', [col[0] for col in desc])
    return [nt_result(*row) for row in cursor.fetchall()]


# show a view that can help filter what pet info's we can see
def search(request):
    with connection.cursor() as cursor:
        cursor.callproc('GetAllPetInfos')
        #cursor.execute("SELECT * FROM msa_petinfo")
        #queryset = cursor.fetchall()
        queryset = namedtuplefetchall(cursor)
        cursor.close()

    with connection.cursor() as cursor:
        cursor.callproc('GetAllCity')
        cityset = namedtuplefetchall(cursor)
        cursor.close()

    template = loader.get_template('msa/search.html')
    context = {
        'queryset': queryset,
        'cityset': cityset
    }
    return HttpResponse(template.render(context, request))


# a view that gets all the shelters given a city id
def getSheltersFromCity(request):
    city_id = request.GET['id']
    if city_id == "null":
        return []
    with connection.cursor() as cursor:
        cursor.callproc('GetShelterFromCity', [city_id])
        queryset = namedtuplefetchall(cursor)
        jsondata = []
        for item in queryset:
            jsondata.append({'id': item.id, 'name':item.name})
        # print(jsondata)
    data = {
        'data': jsondata
    }
    return JsonResponse(data)


# a view that gives all the species given a shelter id
def getSpeciesFromShelter(request):
    species_id = request.GET['id']
    if species_id == "null":
        return []
    with connection.cursor() as cursor:
        cursor.callproc('GetSpeciesFromShelter', [species_id])
        queryset = namedtuplefetchall(cursor)
        print(queryset)
        jsondata = []
        for item in queryset:
            jsondata.append({'id': item.id, 'name':item.species_name})
        print(jsondata)
    data = {
        'data': jsondata
    }
    return JsonResponse(data)


# a view that displays all the useful info for a pet info given the pet info id
def petInfoDetail(request, petinfo_id):
    # if you can't get the object, return a 404
    with connection.cursor() as cursor:
        cursor.callproc('GetAllPetInfosDetailReadable', [petinfo_id])
        queryset = namedtuplefetchall(cursor)

        template = loader.get_template('msa/petinfo.html')
        context = {
            'queryset': queryset,
            'user_id': request.user.id
        }
        return HttpResponse(template.render(context, request))


# a view that displays all the pet infos of all the users adopted pets
def userAdoptedPetResult(request):
    # if you can't get the object, return a 404
    with connection.cursor() as cursor:
        cursor.callproc('GetUserAdoptedPetsReadable', [request.user.id])
        queryset = namedtuplefetchall(cursor)

        template = loader.get_template('msa/userPetResults.html')
        context = {
            'queryset': queryset,
        }
        return HttpResponse(template.render(context, request))


# a view that is meant to adopt a pet
def adoptPet(request):
    try:
        with connection.cursor() as cursor:
            cursor.callproc('AdoptPet', [request.POST['pet_id'], request.POST['user_id']])
            queryset = namedtuplefetchall(cursor)

            template = loader.get_template('msa/userPetResults.html')
            context = {
                'queryset': queryset,
            }
        return HttpResponse('post')
    except(IntegrityError):
        return HttpResponse('Not allowed to adopt this pet.')



