from django.contrib import admin

from .models import Question, Choice, City, Shelter, Species, Breed, PetInfo, AdoptedPet

admin.site.register(Question)
admin.site.register(Choice)
admin.site.register(City)
admin.site.register(Shelter)
admin.site.register(Species)
admin.site.register(Breed)
admin.site.register(PetInfo)
admin.site.register(AdoptedPet)