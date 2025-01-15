BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "blog_bookmarks" (
	"id"	INTEGER NOT NULL,
	"date_submitted"	DATETIME,
	"post_id"	INTEGER,
	"user_id"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("post_id") REFERENCES "blog_posts"("id"),
	FOREIGN KEY("user_id") REFERENCES "blog_user"("id")
);
CREATE TABLE IF NOT EXISTS "blog_comments" (
	"id"	INTEGER NOT NULL,
	"date_submitted"	DATETIME,
	"text"	VARCHAR(500) NOT NULL,
	"blocked"	VARCHAR(5),
	"if_blocked"	VARCHAR(100),
	"post_id"	INTEGER,
	"user_id"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("post_id") REFERENCES "blog_posts"("id"),
	FOREIGN KEY("user_id") REFERENCES "blog_user"("id")
);
CREATE TABLE IF NOT EXISTS "blog_contact" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR(200) NOT NULL,
	"date_created"	DATETIME,
	"email"	VARCHAR(100) NOT NULL,
	"message"	VARCHAR(700),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "blog_likes" (
	"id"	INTEGER NOT NULL,
	"date_submitted"	DATETIME,
	"post_id"	INTEGER,
	"user_id"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("post_id") REFERENCES "blog_posts"("id"),
	FOREIGN KEY("user_id") REFERENCES "blog_user"("id")
);
CREATE TABLE IF NOT EXISTS "blog_posts" (
	"id"	INTEGER NOT NULL,
	"date_submitted"	DATETIME,
	"date_to_post"	DATETIME,
	"title"	VARCHAR(200) NOT NULL,
	"intro"	VARCHAR(200) NOT NULL,
	"body"	TEXT NOT NULL,
	"picture_v"	VARCHAR(200),
	"picture_v_source"	VARCHAR(500),
	"picture_h"	VARCHAR(200),
	"picture_h_source"	VARCHAR(500),
	"picture_s"	VARCHAR(200),
	"picture_s_source"	VARCHAR(500),
	"picture_alt"	VARCHAR(200),
	"meta_tag"	VARCHAR(200),
	"title_tag"	VARCHAR(200),
	"admin_approved"	VARCHAR(5),
	"featured"	VARCHAR(5),
	"author_id"	INTEGER,
	"theme_id"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("author_id") REFERENCES "blog_user"("id"),
	FOREIGN KEY("theme_id") REFERENCES "blog_theme"("id")
);
CREATE TABLE IF NOT EXISTS "blog_replies" (
	"id"	INTEGER NOT NULL,
	"date_submitted"	DATETIME,
	"text"	VARCHAR(500) NOT NULL,
	"blocked"	VARCHAR(5),
	"if_blocked"	VARCHAR(100),
	"likes"	INTEGER,
	"comment_id"	INTEGER,
	"post_id"	INTEGER,
	"user_id"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("comment_id") REFERENCES "blog_comments"("id"),
	FOREIGN KEY("post_id") REFERENCES "blog_posts"("id"),
	FOREIGN KEY("user_id") REFERENCES "blog_user"("id")
);
CREATE TABLE IF NOT EXISTS "blog_stats" (
	"id"	INTEGER NOT NULL,
	"user_total"	INTEGER,
	"user_active_total"	INTEGER,
	"posts_approved"	INTEGER,
	"comments_total"	INTEGER,
	"likes_total"	INTEGER,
	"bookmarks_total"	INTEGER,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "blog_theme" (
	"id"	INTEGER NOT NULL,
	"theme"	VARCHAR(30) NOT NULL,
	"picture"	VARCHAR(700) NOT NULL,
	"picture_source"	VARCHAR(700),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "blog_user" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR(200) NOT NULL,
	"email"	VARCHAR(200) NOT NULL,
	"password"	VARCHAR(200) NOT NULL,
	"date_created"	DATETIME,
	"about"	VARCHAR(385),
	"picture"	VARCHAR,
	"type"	VARCHAR(100) NOT NULL,
	"blocked"	VARCHAR(5),
	"admin_notes"	TEXT,
	UNIQUE("email"),
	PRIMARY KEY("id"),
	UNIQUE("name")
);
INSERT INTO "blog_comments" VALUES (1,'2025-01-15 04:39:19.055316','nice','FALSE','[removed]',1,1);
INSERT INTO "blog_posts" VALUES (1,'2025-01-15 04:30:09.458855','2025-01-15 00:00:00.000000','Stay in the Present with these 10 Technology Blogs','Professionals in almost every industry have trouble keeping up to date with changing tech trends.','<p>Professionals in almost every industry have trouble keeping up to date with changing tech trends. So, the best and the only way to stay relevant with technology is through the information available online!</p>

<p>So, if you want intuitive articles along with insights from the tech industry, you need to read blogs that are consistently updated by people that know about the trends, and market, and care about giving quality content to their readers.</p>

<p>Let&rsquo;s take a look at some of the best technology blogs out there!!</p>
','Picture_v_1.png','http://','Picture_h_1.png','http://','Picture_s_1.png','http://','make','Professionals in almost every industry have trouble keeping up to date with changing tech trends. with technology is through the information available online!','So, the best and the only way to stay relevant ','TRUE','FALSE',2,2);
INSERT INTO "blog_stats" VALUES (1,1,0,1,0,0,0);
INSERT INTO "blog_theme" VALUES (1,'Tech Insights','theme_6b20d51e-0b0c-4a84-be4d-9c89102cc608_pexels-photo-1181244.jpeg','https://images.pexels.com/photos/1181244/pexels-photo-1181244.jpeg');
INSERT INTO "blog_theme" VALUES (2,'Cloud Architecture','theme_9b84bd67-51d4-48fa-b2f1-50759c34f742_pexels-photo-1624895.jpeg','https://images.pexels.com/photos/1624895/pexels-photo-1624895.jpeg');
INSERT INTO "blog_theme" VALUES (3,'DevOps Engineering','theme_959d1b02-21ff-4dce-8fe3-d4800907f8fb_pexels-photo-3861969.jpeg','https://images.pexels.com/photos/3861969/pexels-photo-3861969.jpeg');
INSERT INTO "blog_theme" VALUES (4,'Software Development','theme_d9319e68-0216-406d-a98d-08808105913a_pexels-photo-546819.jpeg','https://images.pexels.com/photos/546819/pexels-photo-546819.jpeg');
INSERT INTO "blog_theme" VALUES (5,'AI & Machine Learning','theme_5fca1ae6-9bdf-416f-9b4e-49d5aacb441d_pexels-photo-8566472.jpeg','https://images.pexels.com/photos/8566472/pexels-photo-8566472.jpeg');
INSERT INTO "blog_user" VALUES (1,'Super Admin','super@admin','pbkdf2:sha256:260000$honODun4$9393ab606130ee2ee32cba8f7ec81788e82b35933d9d7112ec739a936f9effde','2025-01-15 04:01:47.848845','','Picture_default.jpg','super_admin','FALSE',NULL);
INSERT INTO "blog_user" VALUES (2,'Devtegrate','author@devtegrate.com','pbkdf2:sha256:260000$KqTT9eNo$868b8191a1c14848204fd80377e39d975fa5d27b91348bbe50f2abb8d857c610','2025-01-15 04:01:47.850846','Tech enthusiast and cloud solutions architect with over 5 years of experience in enterprise-scale deployments. Specializing in AWS, Azure, and Google Cloud platforms, I help businesses navigate their digital transformation journey. When not architecting cloud solutions, I''m exploring emerging technologies and sharing insights through technical writing.','Picture_default_author.jpg','author','FALSE',NULL);
INSERT INTO "blog_user" VALUES (4,'joezeal','joeljosephad@gmail.com','pbkdf2:sha256:260000$eyAbP1LI$bca10b2c02f713eb27ae4f1ebe5c4f091b88e9c953820dd5b1cb4c2ae65ef554','2025-01-15 04:05:23.656710','','Picture_default.jpg','author','FALSE',NULL);
COMMIT;
