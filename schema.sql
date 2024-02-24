// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table follows {
  following_user_id integer
  followed_user_id integer
  created_at timestamp 
}

Table users {
  id integer [primary key]
  username varchar
  role varchar
  created_at timestamp
}

Table posts {
  id integer [primary key]
  title varchar
  body text [note: 'Content of the post']
  user_id integer
  status varchar
  created_at timestamp
}

Table pages {
  id integer [primary key]
  title varchar
  body text [note: 'Content of the post']
  user_id integer
  status varchar
  created_at timestamp
}

Table groups {
  id integer [primary key]
  title varchar
  body text [note: 'Content of the post']
  user_id integer
  status varchar
  created_at timestamp
}

Table pages_followed {
  id integer [primary key]
  page_id varchar
  user_id integer
  created_at timestamp
}

Table groups_followed {
  id integer [primary key]
  page_id varchar
  user_id integer
  created_at timestamp
}

Table liked_posts {
  id integer [primary key]
  post_id integer
  user_id integer
  created_at timestamp
}

Table commented_posts {
  id integer [primary key]
  post_id integer
  user_id integer
  parent_id integer
  comment varchar
  created_at timestamp
}

Ref: posts.user_id > users.id // many-to-one

Ref: users.id < follows.following_user_id

Ref: users.id < follows.followed_user_id

Ref: users.id < pages.user_id

Ref: users.id < groups.user_id

Ref: users.id < pages_followed.user_id
Ref: pages.id < pages_followed.page_id

Ref: users.id < liked_posts.user_id
Ref: posts.id < liked_posts.post_id

Ref: users.id < commented_posts.user_id
Ref: posts.id < commented_posts.post_id
Ref: commented_posts.id < commented_posts.parent_id
