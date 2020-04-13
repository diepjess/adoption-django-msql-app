import datetime
from django.db import models
from django.utils import timezone
from django.conf import settings

class City(models.Model):
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name


class Shelter(models.Model):
    name = models.CharField(max_length=200)
    phone_number = models.CharField(max_length=50)
    city = models.ForeignKey(City, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class Species(models.Model):
    species_name = models.CharField(max_length=200)

    def __str__(self):
        return self.species_name

class Breed(models.Model):
    species = models.ForeignKey(Species, on_delete=models.CASCADE)
    breed_name = models.CharField(max_length=200)

    def __str__(self):
        return self.breed_name


class PetInfo(models.Model):
    shelter = models.ForeignKey(Shelter, on_delete=models.CASCADE)

    name = models.CharField(max_length=200)
    age = models.IntegerField()

    species = models.ForeignKey(Species, on_delete=models.PROTECT)
    breed = models.ForeignKey(Breed, on_delete=models.SET_NULL, null=True)

    adoption_status = models.BooleanField(default=False)

    def __str__(self):
        return self.name


class AdoptedPet(models.Model):
    pet_info = models.ForeignKey(PetInfo, on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True)

    date_adopted = models.DateField()





