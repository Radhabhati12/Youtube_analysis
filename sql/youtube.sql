*************Sql_Queries******************


# Average comments count per country
 select publish_country,avg(comment_count) as avg_comments from youtube group by publish_country
 order by avg_comments desc;

 # Average likes per category
select category_id, avg(likes) as avg_likes from youtube group by category_id;


 # channel with most trending video
select  channel_title, count(*) as trending_video from youtube 
group by channel_title limit 10;

# count of videos by category
select category_id, count(*) as video_count from youtube
group by category_id order by video_count desc;

# day with highest number of video published
select published_day_of_week, count(*) as total_videos from youtube
group by published_day_of_week order by total_videos desc limit 1;


#  most common time frame for published
 select time_frame, count(*) as total_published from youtube
 group by time_frame order by total_published limit 1;


# no of video published each day of week
select published_day_of_week, count(*) as published_videos from youtube 
group by published_day_of_week order by  FIELD(published_day_of_week,
    'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'); 

# no of videos with comments disabled
select  count(*)as disabled_comments from youtube 
where comments_disabled= 'TRUE';

# percentage of videos with disabled rating  
select (sum(case when ratings_disabled='True' then 1 else 0 end)* 100)/ count(*) 
as percentage_disabled from youtube;

# top 10 most viewed videos
select title, channel_title, views from youtube
order by views desc limit 10;

# total records
select count(*) from youtube

# total views by country
select publish_country, count(views) as total_views from youtube
group by publish_country;

# videos removed or by error
SELECT COUNT(*) AS Videos_with_error
FROM youtube
WHERE REPLACE(video_error_or_removed, '\r', '') = 'FALSE';


# Likes to views ratio by channel
SELECT 
    channel_title,
    SUM(likes) AS total_likes,
    SUM(views) AS total_views,
    ROUND(SUM(likes) / SUM(views) * 100, 2) AS like_to_view_ratio_percentage
FROM youtube
GROUP BY channel_title
ORDER BY like_to_view_ratio_percentage DESC limit 10;
