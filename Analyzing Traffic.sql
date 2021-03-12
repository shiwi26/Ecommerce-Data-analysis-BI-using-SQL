USE mavenfuzzyfactory;
-- to find the top traffic source
select utm_source, utm_campaign, http_referer, 
count(distinct website_session_id) as sessions
from website_sessions
where created_at < '2012-04-12'
group by 1,2,3
order by sessions desc;

-- calculate conversion rates
-- used left join to include all website sessions
select count(distinct website_sessions.website_session_id) as sessions,
	   count(distinct orders.order_id) as orders,
       count(distinct orders.order_id)/count(distinct website_sessions.website_session_id) as conversion_rate
from website_sessions left join orders on website_sessions.website_session_id = orders.website_session_id
where utm_source = 'gsearch' and utm_campaign = 'nonbrand' and website_sessions.created_at < '2012-04-14';



