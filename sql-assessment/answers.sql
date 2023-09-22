SELECT SUM(impressions) AS sum_impressions, DATE(date) AS day
FROM marketing_data
GROUP BY DAY(date)
ORDER BY day;

SELECT state, SUM(revenue) AS total_revenue
FROM website_revenue
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 3;

SELECT
  SUM(marketing_data.cost) AS total_cost,
  SUM(marketing_data.impressions) AS total_impressions,
  SUM(marketing_data.clicks) AS total_clicks,
  SUM(website_revenue.revenue) AS total_revenue,
  campaign_info.name AS campaign_name
FROM campaign_info
JOIN marketing_data ON campaign_info.id = marketing_data.campaign_id
JOIN website_revenue ON campaign_info.id = website_revenue.campaign_id
GROUP BY campaign_info.name;

SELECT SUM(marketing_data.conversions) AS num_conversions, website_revenue.state
FROM marketing_data
JOIN website_revenue ON marketing_data.campaign_id = website_revenue.campaign_id
WHERE marketing_data.campaign_id = 'Campaign5'
GROUP BY website_revenue.state
ORDER BY num_conversions DESC;
LIMIT 1;

SELECT
  campaign_info.name,
  (SUM(marketing_data.revenue) - SUM(marketing_data.cost)) / SUM(marketing_data.cost) AS ROI
FROM campaign_info
JOIN marketing_data on campaign_info.id = marketing_data.campaign_id
GROUP BY campaign_info.name
ORDER BY ROI DESC
LIMIT 1;

SELECT
  DAYNAME(date) AS day_of_the_week,
  AVG(impressions) AS avg_impressions,
  AVG(clicks) AS avg_clicks,
  AVG(conversions) AS avg_conversions
FROM marketing_data
GROUP BY DAYOFWEEK(date)
ORDER BY avg_clicks DESC, avg_conversions DESC, avg_impressions DESC;

