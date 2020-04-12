from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.template import loader
from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from django.db import connection
from collections import namedtuple

from .models import Question, Choice

# show a view of the 5 most recently published questions
def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    template = loader.get_template('msa/index.html')
    context = {
        'latest_question_list': latest_question_list,
    }
    return HttpResponse(template.render(context, request))

# show a view on the Question details - right now it's just the question text
def detail(request, question_id):
    # if you can't get the object, return a 404
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'msa/detail.html', {'question': question})


# show a view that has the Question voting results
def results(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'msa/results.html', {'question': question})


# post url for voting and redirecting to results or shows error message
def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)

    try:
        selected_choice = question.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        # Redisplay the question voting form.
        return render(request, 'msa/detail.html', {
            'question': question,
            'error_message': "You didn't select a choice.",
        })
    else:
        # choice successfully voted, increase vote and redirect to results
        selected_choice.votes += 1
        selected_choice.save()
        # return an HttpResponseRedirect after successfully dealing
        # with POST data to prevent resubmissions, reconstruct a url
        # for results based on  question id
        return HttpResponseRedirect(reverse('msa:results', args=(question.id,)))


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


# show a view that has all pet info
def search(request):
    with connection.cursor() as cursor:
        cursor.callproc('GetAllPetInfos')
        #cursor.execute("SELECT * FROM msa_petinfo")
        #queryset = cursor.fetchall()
        queryset = namedtuplefetchall(cursor)

        template = loader.get_template('msa/search.html')
        context = {
            'queryset': queryset,
        }
        return HttpResponse(template.render(context, request))


def petInfoDetail(request, petinfo_id):
    # if you can't get the object, return a 404
    with connection.cursor() as cursor:
        cursor.callproc('GetAllPetInfosDetailReadable', [petinfo_id])
        queryset = namedtuplefetchall(cursor)

        template = loader.get_template('msa/search.html')
        context = {
            'queryset': queryset,
        }
        return HttpResponse(template.render(context, request))
