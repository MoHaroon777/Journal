# todo_list/todo_app/forms.py

from django import forms
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit, Layout, Field
from .models import ToDoItem

class ToDoItemForm(forms.ModelForm):
    description = forms.CharField(widget=forms.Textarea)

    class Meta:
        model = ToDoItem
        fields = ['title', 'description', 'urgent', 'due']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.layout = Layout(
            Field('title'),
            Field('description'),
            Field('urgent'),
            Field('due'),
            Submit('submit', 'Submit', css_class='btn btn-primary'),
            Submit('cancel', 'Cancel', css_class='btn btn-secondary', onclick="window.history.back()")
        )
