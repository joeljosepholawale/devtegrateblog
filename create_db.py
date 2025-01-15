from flask import current_app
from app.extensions import db
from app.models.user import Blog_User
from app.models.posts import Blog_Posts
from app.models.themes import Blog_Theme
from app.models.comments import Blog_Comments, Blog_Replies
from app.models.stats import Blog_Stats
from app.models.bookmarks import Blog_Bookmarks
from app.models.likes import Blog_Likes
from app.models.contact import Blog_Contact
# from app.models.text import about_text_author, about_text_user  # dummie strings
from app.dummie_data import authors, posts, themes, comments
from app.account.helpers import hash_pw
from app.models.helpers import pic_src_user, pic_src_post, pic_src_theme, update_stats_comments_total, update_stats_users_total, update_likes, update_bookmarks, delete_comment, delete_reply, update_approved_post_stats, update_stats_users_active
from datetime import datetime



ADMIN_NAME = "Super Admin"
ADMIN_EMAIL = "super@admin"
ADMIN_PW = "admin123"
ADMIN_PICTURE = "Picture_default.jpg"
DEFAULT_AUTHOR_NAME = "devtegrate"
DEFAULT_AUTHOR_EMAIL = "author@devtegrate.com"
DEFAULT_AUTHOR_PW = "author123"
DEFAULT_AUTHOR_ABOUT = authors.authors_about
DEFAULT_AUTHOR_PICTURE = "Picture_default_author.jpg"
DEFAULT_USER_NAME = "[Deleted]"
DEFAULT_USER_EMAIL = "deleted@users"
DEFAULT_USER_PW = "user123"
DEFAULT_USER_ABOUT = "This user's account has been deleted"
DEFAULT_USER_PICTURE = "Picture_default.jpg"

def create_admin_acct():
    
    super_admin_exists = Blog_User.query.get(1)
    if not super_admin_exists:
        the_super_admin = Blog_User(
            name=ADMIN_NAME, email=ADMIN_EMAIL, password=hash_pw(ADMIN_PW), type="super_admin", picture=ADMIN_PICTURE)
        the_default_author = Blog_User(name=DEFAULT_AUTHOR_NAME, email=DEFAULT_AUTHOR_EMAIL, password=hash_pw(DEFAULT_AUTHOR_PW),
                                    type="author", about=DEFAULT_AUTHOR_ABOUT, picture=DEFAULT_AUTHOR_PICTURE)
        the_default_user = Blog_User(name=DEFAULT_USER_NAME, email=DEFAULT_USER_EMAIL, password=hash_pw(DEFAULT_USER_PW),
                                    type="user", about=DEFAULT_USER_ABOUT, picture=DEFAULT_USER_PICTURE)
        db.session.add(the_super_admin)
        db.session.add(the_default_author)
        db.session.add(the_default_user)
        db.session.commit()

# Creating the stats
def create_stats():
    # Check if stats table exists, if not, then add it:
    stats_exists = Blog_Stats.query.get(1)
    if not stats_exists:
        the_stats_table = Blog_Stats()
        db.session.add(the_stats_table)
        db.session.commit()

# Creating the themes
def create_themes():
    # Check if themes exist in the database, if not, add themes:
    dummies_exists = Blog_Theme.query.get(1)
    if not dummies_exists:
        theme1 = Blog_Theme(
            theme=themes.themes_data[0]["theme"], picture=themes.themes_data[0]["picture"], picture_source=themes.themes_data[0]["picture_source"])
        theme2 = Blog_Theme(
            theme=themes.themes_data[1]["theme"], picture=themes.themes_data[1]["picture"], picture_source=themes.themes_data[1]["picture_source"])
        theme3 = Blog_Theme(
            theme=themes.themes_data[2]["theme"], picture=themes.themes_data[2]["picture"], picture_source=themes.themes_data[2]["picture_source"])
        theme4 = Blog_Theme(
            theme=themes.themes_data[3]["theme"], picture=themes.themes_data[3]["picture"], picture_source=themes.themes_data[3]["picture_source"])

        db.session.add(theme1)
        db.session.add(theme2)
        db.session.add(theme3)
        db.session.add(theme4)
        db.session.commit()