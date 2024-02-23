from django.urls import path
from django.contrib.auth.views import LoginView
from . import views 

urlpatterns = [
    path('', LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', views.CustomLogoutView.as_view(next_page='/'), name='logout'),
    path('register/', views.register_view, name='register'),
    path('home/', views.index_view, name='index'),
    path('recipes/<int:recipe_id>/add_comment/', views.add_comment, name='add_comment'),
    path('comment/<int:pk>/edit/', views.edit_comment, name='edit_comment'),
    path('delete_comment/<int:comment_id>/', views.delete_comment, name='delete_comment'),
    path('edit_comment/<int:comment_id>/', views.edit_comment, name='edit_comment'),


]
