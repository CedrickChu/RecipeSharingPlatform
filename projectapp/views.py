from django.shortcuts import render
from django.contrib.auth.views import LogoutView
from .forms import CustomUserCreationForm, UserAndProfileForm, UserProfileForm, CommentForm
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login, authenticate
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.views.generic import TemplateView
from .models import Recipe, Comment
from django.http import JsonResponse
from django.views.decorators.http import require_POST
from django.urls import reverse


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
    def post(self, request, *args, **kwargs):
        self.next_page = '/' 
        if self.logout(request):
            if self.next_page:
                return redirect(self.next_page)
        return super().post(request, *args, **kwargs)
    
def register_view(request):
    if request.method == 'POST':
        user_form = CustomUserCreationForm(request.POST)
        profile_form = UserProfileForm(request.POST)

        if user_form.is_valid() and profile_form.is_valid():
            user = user_form.save()
            profile = profile_form.save(commit=False)
            profile.user = user
            profile.save()
            return redirect('dashboard')
    else:
        user_form = CustomUserCreationForm()
        profile_form = UserProfileForm()

    return render(request, 'register.html', {'user_form': user_form, 'profile_form': profile_form})

@login_required
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
            return redirect('index')
    else:
        form = CommentForm()

    return render(request, 'index.html', {'recipe': recipe, 'form': form})

@login_required
def edit_comment(request, pk):
    comment = get_object_or_404(Comment, pk=pk)

    # Check if the current user is the owner of the comment
    if request.user != comment.user:
        # Handle unauthorized access (you may redirect or show an error page)
        return redirect('index')

    if request.method == 'POST':
        form = CommentForm(request.POST, instance=comment)
        if form.is_valid():
            form.save()
            return redirect('index')
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

    # Check if the user has permission to edit the comment
    if comment.user != request.user:
        return JsonResponse({'success': False, 'error': 'Permission denied'})

    new_text = request.POST.get('new_text', '')
    if new_text:
        comment.text = new_text
        comment.save()
        return JsonResponse({'success': True})
    else:
        return JsonResponse({'success': False, 'error': 'Empty comment not allowed'})
