# todo_list/todo_app/models.py
from django.utils import timezone
from ckeditor_uploader.fields import RichTextUploadingField
from django.db import models
from django.urls import reverse

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
    description = RichTextUploadingField()
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