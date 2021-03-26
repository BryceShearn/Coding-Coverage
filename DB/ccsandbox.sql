show tables;

desc code_concept;
desc comment;
desc comment_vote;
desc language;
desc post;
desc post_has_language;
desc post_vote;
desc roadmap;
desc task;
desc resource;
desc resource_has_language;
desc user;
desc user_has_roadmap;
desc user_roadmap_task;

SELECT * FROM user;
SELECT * FROM post;
SELECT * FROM post_vote;
SELECT * FROM comment_vote;
SELECT * FROM comment;
SELECT * FROM language;
SELECT * FROM task;
SELECT * FROM roadmap;
SELECT * FROM user_roadmap_task;
SELECT * FROM user_has_roadmap;
SELECT * FROM resource;

Select * from comment join user on user.id = comment.user_id where user.id = 2;
select * from user left join user_has_roadmap on user.id = user_has_roadmap.user_id left join roadmap on user_has_roadmap.roadmap_id = roadmap.id where user.id = 8;

SELECT * FROM post join post_vote on post.id = post_vote.post_id where post.id = 1;




