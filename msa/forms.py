from django import forms

class PetInfoForm(forms.Form):
    pet_name = forms.CharField(label='Name', max_length=200, required=True)
    pet_age = forms.IntegerField(label='Age', required=True)