from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.template import loader
from django.shortcuts import render, get_object_or_404
from django.urls import reverse

from .models import Question, Choice

# show a view of the 5 most recently published questions
def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    template = loader.get_template('polls/index.html')
    context = {
        'latest_question_list': latest_question_list,
    }
    return HttpResponse(template.render(context, request))
    # shortcut:
    # return render(request, 'polls/index.html', context)

# show a view on the Question details - right now it's just the question text
def detail(request, question_id):
    # if you can't get the object, return a 404
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/detail.html', {'question': question}) 


# show a view that has the Question voting results
def results(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/results.html', {'question': question})


# post url for voting and redirecting to results or shows error message
def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)

    try:
        selected_choice = question.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        # Redisplay the question voting form.
        return render(request, 'polls/detail.html', {
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
        return HttpResponseRedirect(reverse('polls:results', args=(question.id,)))
