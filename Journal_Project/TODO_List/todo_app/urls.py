# todo_list/todo_app/urls.py
from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.ToDoListView.as_view(), name='index'),
    path('list/<int:list_id>/', views.ItemReadView.as_view(), name='list'),
    path('list/add/', views.ListCreateView.as_view(), name='list-add'),
    path('list/<int:pk>/delete/', views.ListDeleteView.as_view(), name='list-delete'),
    path('list/<int:list_id>/item/add/', views.ItemCreateView.as_view(), name='item-add'),
    path('list/<int:list_id>/item/<int:pk>/update/', views.ItemUpdateView.as_view(), name='ItemUpdate'),
    path('list/<int:list_id>/item/<int:pk>/delete/', views.ItemDeleteView.as_view(), name='item-delete'),
    path('Notepad/', views.NotesView.as_view(), name='Notepad'),
]#+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
