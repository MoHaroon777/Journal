from typing import Any
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from .models import ToDoList, ToDoItem
from django.urls import reverse_lazy, reverse
from .forms import ToDoItemForm


class ToDoListView(ListView):
    model = ToDoList
    template_name = 'todo_app/index.html'

class ListCreateView(CreateView):
    model = ToDoList
    fields = ['title']

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["title"] = 'Add a new list'
        return context

class ListDeleteView(DeleteView):
    model = ToDoList
    success_url = reverse_lazy("index")

class ItemCreateView(CreateView):
    model = ToDoItem
    form_class = ToDoItemForm

    def get_initial(self):
        initial_data = super(ItemCreateView, self).get_initial()
        todo_list = ToDoList.objects.get(id=self.kwargs["list_id"])
        initial_data["todo_list"] = todo_list
        return initial_data
    
    def get_context_data(self, **kwargs):
        context = super(ItemCreateView, self).get_context_data()
        todo_list = ToDoList.objects.get(id=self.kwargs["list_id"])
        context["todo_list"] = todo_list
        context["title"] = "Create a new Item"
        return context
    
    def form_valid(self, form):
        form.instance.todo_list_id = self.kwargs["list_id"]
        return super().form_valid(form)
    
    def get_success_url(self):
        return reverse("list", args=[self.object.todo_list.id])

class ItemReadView(ListView):
    model = ToDoItem
    template_name = 'todo_app/todo_list.html'

    def get_queryset(self):
        return ToDoItem.objects.filter(todo_list_id=self.kwargs["list_id"])

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['todo_list'] = ToDoList.objects.get(id=self.kwargs["list_id"])
        return context

class ItemUpdateView(UpdateView):
    model = ToDoItem
    from .forms import ToDoItemForm

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["todo_list"] = self.get_object().todo_list
        context["title"] = "Edit Item"
        return context
    
    def get_success_url(self):
        return reverse("list", args=[self.object.todo_list.id])

class ItemDeleteView(DeleteView):
    model = ToDoItem

    def get_success_url(self):
        return reverse_lazy("list", args=[self.kwargs["list_id"]])

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["todo_list"] = self.object.todo_list
        return context

class DashBoardView(ListView):
    model = ToDoItem
    template_name = 'todo_app/dashboard.html'

    # def get_queryset(self):
    #     return ToDoItem.objects.filter(due__lte=timezone.now())

    # def get_context_data(self, **kwargs):
    #     context = super().get_context_data(**kwargs)
    #     context["title"] = "Dashboard"
    #     return context