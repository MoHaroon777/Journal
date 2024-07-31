# todo_list/todo_app/models.py
from django.utils import timezone
from django.db import models
from django.urls import reverse
from markdownfield.models import MarkdownField, RenderedMarkdownField
from markdownfield.validators import VALIDATOR_CLASSY
from markdownfield.validators import Validator

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
        

class Journal(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField(null=True, unique=False)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    content = MarkdownField()
    is_pinned = models.BooleanField(default=False)
    # is_deleted = models.BooleanField(default=False)
    
    def __str__(self):
        return self.title
    

# class Author(models.Model):
#     name = models.CharField(max_length=100)
#     email = models.EmailField()
#     phone = models.CharField(max_length=20)
#     image_url = models.URLField(blank=True, null=True)

#     def __str__(self):
#         return self.name