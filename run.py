from app import create_app
from create_db import create_admin_acct, create_themes, create_stats
from app.extensions import db
# from dotenv import load_dotenv, dotenv_values

app = create_app()

with app.app_context():
    db.create_all()
    create_admin_acct()
    create_themes()
    create_stats()
    # create_dummie_accts ()
    # create_posts()
    # create_comments()
    # create_likes_and_bookmarks()
    # create_contact_db()
    # load_dotenv()
    
if __name__ == '__main__':
    app.run(debug=True)