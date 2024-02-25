from django.urls import path
from django.contrib.auth.views import LoginView
from . import views 

urlpatterns = [
    path('login/', views.login_view, name='login'),
    path('logout/', views.CustomLogoutView.as_view(next_page='/'), name='logout'),
    path('register/', views.register_view, name='register'),
    path('', views.index_view, name='index'),
    path('create_recipe/', views.create_recipe, name='create_recipe'),
    path('recipes/<int:recipe_id>/add_comment/', views.add_comment, name='add_comment'),
    path('comment/<int:pk>/edit/', views.edit_comment, name='edit_comment'),
    path('delete_comment/<int:comment_id>/', views.delete_comment, name='delete_comment'),
    path('edit_comment/<int:comment_id>/', views.edit_comment, name='edit_comment'),
    path('recipe/<int:recipe_id>/', views.recipe_detail, name='recipe_detail'),
    path('recipe/<int:recipe_id>/rate/', views.recipe_rating, name='recipe_rating'),
]
