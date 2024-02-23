from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User, UserProfile, Comment, Rating, Recipe

class CustomUserAdmin(UserAdmin):
    model = User
    list_display = ['email', 'username', 'phone', 'is_active', 'is_staff']
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal info', {'fields': ('username', 'phone', 'first_name', 'about')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'start_date')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'username', 'phone', 'password1', 'password2'),
        }),
    )
    search_fields = ['email', 'username', 'phone']
    ordering = ['email']

admin.site.register(User, CustomUserAdmin)

@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'last_name', 'address', 'city', 'country', 'postal_code', 'about_me', 'profile_image')

class CommentInline(admin.TabularInline):
    model = Comment

class RatingInline(admin.TabularInline):
    model = Rating

class RecipeAdmin(admin.ModelAdmin):
    list_display = ('title', 'created_by', 'created_at', 'average_rating')
    search_fields = ('title', 'created_by__username')
    inlines = [CommentInline, RatingInline]

admin.site.register(Recipe, RecipeAdmin)
