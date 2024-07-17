# todo_list/todo_app/models.py
from django.utils import timezone
from django.db import models
from django.urls import reverse
from markdownfield.models import MarkdownField, RenderedMarkdownField
from markdownfield.validators import VALIDATOR_CLASSY
from markdownfield.validators import Validator

VALIDATOR_COMMENTS = Validator(
    allowed_tags=["b", "i", "strong", "em"],
    allowed_attrs={},
    linkify=False
)

def one_week_hence():
    return timezone.now() + timezone.timedelta(days=7)

class ToDoList(models.Model):
    title = models.CharField(max_length=100, unique=True)

    def get_absolute_url(self):
        return reverse("list", args=[self.id])

    def __str__(self):
        return self.title

class ToDoItem(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField(null=True, unique=False)
    created_date = models.DateTimeField(auto_now_add=True)
    urgent = models.BooleanField(default=False)
    due = models.DateTimeField(default=one_week_hence)
    todo_list = models.ForeignKey(ToDoList, on_delete=models.CASCADE)

    def get_absolute_url(self):
        return reverse(
            "ItemUpdate", args=[str(self.todo_list.id), str(self.id)]
        )

    def __str__(self):
        return f"{self.title}: due {self.due_date}"

    class Meta:
        ordering = ["due"]
        
class Editor(models.Model):
    text = MarkdownField(rendered_field='rendered_text', validators=[Validator])
    rendered_text = RenderedMarkdownField()
