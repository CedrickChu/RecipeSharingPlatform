from django.shortcuts import render
from django.contrib.auth.views import LogoutView
from .forms import CustomUserCreationForm, UserAndProfileForm, UserProfileForm, CommentForm, LogoutForm, RecipeForm, RatingForm
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login, authenticate
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.views.generic import TemplateView
from .models import Recipe, Comment, Rating
from django.http import JsonResponse
from django.views.decorators.http import require_POST
from django.urls import reverse_lazy
from django.views import View
from django.db.models import Avg


def login_view(request):
    if request.method == 'POST':
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(request, username=username, password=password)

            if user is not None:
                login(request, user)
                return redirect('index')
            else:
                messages.error(request, 'Invalid username or password.')
    else:
        form = AuthenticationForm()

    return render(request, 'login.html', {'form': form})

class CustomLogoutView(LogoutView):
    next_page = reverse_lazy('/')  # Set your desired next page here

    def post(self, request, *args, **kwargs):
        response = super().post(request, *args, **kwargs)
        return redirect(self.get_next_page())

    def get_next_page(self):
        next_page = self.request.POST.get('next', self.next_page)
        return next_page
    
def register_view(request):
    if request.method == 'POST':
        user_form = CustomUserCreationForm(request.POST)
        profile_form = UserProfileForm(request.POST)

        if user_form.is_valid() and profile_form.is_valid():
            user = user_form.save()
            profile = profile_form.save(commit=False)
            profile.user = user
            profile.save()
            return redirect('index')
    else:
        user_form = CustomUserCreationForm()
        profile_form = UserProfileForm()

    return render(request, 'register.html', {'user_form': user_form, 'profile_form': profile_form})

def index_view(request):
    recipes = Recipe.objects.all()
    context = {'recipes': recipes}
    return render(request, 'index.html', context)

def add_comment(request, recipe_id):
    recipe = get_object_or_404(Recipe, pk=recipe_id)

    if request.method == 'POST':
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.user = request.user 
            comment.recipe = recipe
            comment.save()
            return redirect('recipe_detail', recipe_id=recipe.pk)

    else:
        form = CommentForm()

    return render(request, 'index.html', {'recipe': recipe, 'form': form})

@login_required
def edit_comment(request, pk):
    comment = get_object_or_404(Comment, pk=pk)
    if request.user != comment.user:
        return redirect('index')

    if request.method == 'POST':
        form = CommentForm(request.POST, instance=comment)
        if form.is_valid():
            form.save()
            return redirect('recipe_detail', pk=comment.pk)
    else:
        form = CommentForm(instance=comment)

    return render(request, 'edit_comment.html', {'form': form, 'comment': comment})



@login_required
@require_POST
def delete_comment(request, comment_id):
    comment = get_object_or_404(Comment, id=comment_id)
    if request.user != comment.user:
        return JsonResponse({'success': False, 'error': 'You do not have permission to delete this comment.'})
    comment.delete()
    return JsonResponse({'success': True})

@login_required
@require_POST
def edit_comment(request, comment_id):
    comment = get_object_or_404(Comment, id=comment_id)

    if comment.user != request.user:
        return JsonResponse({'success': False, 'error': 'Permission denied'})

    new_text = request.POST.get('new_text', '')
    if new_text:
        comment.text = new_text
        comment.save()
        return JsonResponse({'success': True})
    else:
        return JsonResponse({'success': False, 'error': 'Empty comment not allowed'})
    
@login_required
def create_recipe(request):
    if request.method == 'POST':
        form = RecipeForm(request.POST, request.FILES)
        if form.is_valid():
            recipe = form.save(commit=False)
            recipe.created_by = request.user
            recipe.save()
            return redirect('recipe_details', pk=recipe.pk)
    else:
        form = RecipeForm()

    return render(request, 'create_recipe.html', {'form': form})


@login_required
def recipe_detail(request, recipe_id):  
    recipe = get_object_or_404(Recipe, id=recipe_id) 
    average_rating = Rating.objects.filter(recipe=recipe).aggregate(Avg('value'))['value__avg']

    context = {
        'recipe': recipe,
        'average_rating': average_rating,
    }

    return render(request, 'recipe_detail.html', context)

@require_POST
@login_required
def recipe_rating(request, recipe_id):
    if request.method == 'POST':
        user = request.user
        rating_value = request.POST.get('rating_value')

        # Check if rating_value is not None and can be converted to an integer
        if rating_value is not None and rating_value.isdigit():
            value = int(rating_value)
            recipe = get_object_or_404(Recipe, id=recipe_id)

            try:
                existing_rating = Rating.objects.get(user=user, recipe=recipe)
                existing_rating.value = value
                existing_rating.save()
            except Rating.DoesNotExist:
                Rating.objects.create(user=user, recipe=recipe, value=value)

            average_rating = Rating.objects.filter(recipe=recipe).aggregate(Avg('value'))['value__avg']

            return JsonResponse({'success': True, 'average_rating': average_rating})

        return JsonResponse({'success': False, 'error_message': 'Invalid rating value'})

    return JsonResponse({'success': False, 'error_message': 'Invalid request method'})
        

