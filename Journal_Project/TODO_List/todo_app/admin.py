from django.contrib import admin
from todo_app.models import ToDoList, ToDoItem, Journal
# Register your models here.

admin.site.register(ToDoList)
admin.site.register(ToDoItem)
admin.site.register(Journal)