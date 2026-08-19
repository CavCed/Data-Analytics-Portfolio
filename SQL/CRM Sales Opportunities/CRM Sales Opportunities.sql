-- Creating clean query as view
CREATE VIEW `crm-sales-data-505221.crm_sales_data.vw_clean_sales_pipelines` AS 
SELECT 
  opportunity_id, 
  sales_agent, 
  CASE WHEN product = 'GTXPro' THEN 'GTX Pro' ELSE product END AS product, -- Aligning product names
  COALESCE(NULLIF(account,''), 'Unknown Account') AS account, -- Handling missing account values
  deal_stage,
  CAST(engage_date AS date) AS engage_date, 
  CAST(close_date AS date) AS close_date, 
  close_value, 
  CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END AS won_flag, 
  CASE WHEN deal_stage = 'Lost' THEN 1 ELSE 0 END AS lost_flag, 
  CASE WHEN deal_stage IN ('Won','Lost') THEN 1 ELSE 0 END AS closed_flag, 
  CASE WHEN close_date IS NOT NULL AND engage_date IS NOT NULL AND deal_stage IN ('Won','Lost') 
       THEN DATE_DIFF(CAST(close_date AS DATE), CAST(engage_date AS DATE), DAY) 
       ELSE NULL 
  END AS sales_cycle_days 
FROM `crm-sales-data-505221.crm_sales_data.Sales_pipeline` 
LIMIT 1000;

-- Cleaning Accounts table
SELECT
  DISTINCT(office_location) AS unique_office_locations
FROM crm-sales-data-505221.crm_sales_data.Accounts
ORDER BY unique_office_locations ASC; -- Philippines spelled incorrectly

SELECT
  DISTINCT(sector) AS unique_sectors
FROM crm-sales-data-505221.crm_sales_data.Accounts
ORDER BY unique_sectors; -- Technology spelled incorrectly

-- creating clean Accounts table
CREATE VIEW
  `crm-sales-data-505221.crm_sales_data.vw_clean_accounts` AS
SELECT
  account,
  CASE
    WHEN sector = 'technolgy' THEN 'technology'
    ELSE sector
END
  AS sector,
  year_established,
  revenue,
  employees,
  CASE
    WHEN office_location = 'Philipines' THEN 'Philippines'
    ELSE office_location
END
  AS office_location,
  subsidiary_of
FROM
  `crm-sales-data-505221`.`crm_sales_data`.`Accounts`;

-- Executive summary Query (Total Revenue, Deals Won/Lost, opportunities, and win rate)
SELECT  
   SUM(CASE WHEN deal_stage = 'Won' THEN close_value ELSE 0 END) AS total_revenue,
   SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) AS deals_won,
   SUM(CASE WHEN deal_stage = 'Lost' THEN 1 ELSE 0 END) AS deals_lost,
   SUM(CASE WHEN deal_stage IN ('Prospecting','Engaging') THEN 1 ELSE 0 END) AS open_oppertunities,
   CAST
      (SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) * 1.0 /
      NULLIF(SUM(CASE WHEN deal_stage IN ('Won','Lost') THEN 1 ELSE 0 END),0)
      AS numeric)*100 AS win_rate,
   ROUND(
      AVG(CASE
         WHEN deal_stage IN ('Won','Lost')
            AND close_date IS NOT NULL
            AND engage_date IS NOT NULL
         THEN DATE_DIFF(close_date,engage_date,DAY)
         ELSE NULL
         END),2)
             AS avg_sales_cycle_days
  FROM `crm-sales-data-505221.crm_sales_data.vw_clean_sales_pipelines` LIMIT 1000;

  -- Quarterly Revenue Trend
SELECT
   EXTRACT(YEAR FROM close_date) AS close_year,
   EXTRACT(quarter FROM close_date) AS close_quarter,
   CONCAT(CAST(EXTRACT(YEAR FROM close_date) AS STRING), '-Q', CAST(EXTRACT(QUARTER FROM close_date) AS STRING)) AS close_year_quarter,
CAST
    (SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) * 1.0 /
    NULLIF(SUM(CASE WHEN deal_stage IN ('Won','Lost') THEN 1 ELSE 0 END),0)
    AS numeric)*100 AS win_rate,
FROM `crm-sales-data-505221.crm_sales_data.vw_clean_sales_pipelines`
WHERE close_date IS NOT NULL
GROUP BY
  EXTRACT(YEAR FROM close_date),
  EXTRACT(quarter FROM close_date),
  close_year_quarter
ORDER BY
  close_year,
  win_rate
LIMIT 1000;

-- Revenue by Manager and Sales Agent
SELECT
  sp.sales_agent,
  st.manager,
  st.regional_office,
  SUM(CASE WHEN sp.deal_stage = 'Won' THEN sp.close_value ELSE 0 END) AS total_revenue_by_agent,
  COUNT(*) AS total_opportunities,
  SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) AS deals_won,
  SUM(CASE WHEN sp.deal_stage = 'Lost'THEN 1 ELSE 0 END) AS deals_lost,
  CAST(
      SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) * 1.0 /
      NULLIF(SUM(CASE WHEN sp.deal_stage IN ('Won','Lost') THEN 1 ELSE 0 END), 0)
      AS NUMERIC) AS win_rate,
  AVG(sp.sales_cycle_days) AS avg_sales_cycle_days
FROM `crm-sales-data-505221.crm_sales_data.vw_clean_sales_pipelines` sp 
  JOIN `crm-sales-data-505221.crm_sales_data.Sales_Teams` st ON sp.sales_agent = st.sales_agent
GROUP BY
  sp.sales_agent,
  st.manager,
  st.regional_office
ORDER BY
  total_revenue_by_agent DESC;

-- Product performance summary
SELECT
  sp.product,
  p.series,
  p.sales_price,
  SUM(CASE WHEN sp.deal_stage = 'Won' THEN sp.close_value ELSE 0 END) AS total_revenue,
  COUNT(*) as total_opportunities,
  SUM(CASE WHEN sp.deal_stage = 'Won' THEN 1 ELSE 0 END) as deals_won,
  SUM(CASE WHEN sp.deal_stage = 'Lost' THEN 1 ELSE 0 END) as deals_lost,
  CAST
    (SUM(CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END) * 1.0 /
    NULLIF(SUM(CASE WHEN deal_stage IN ('Won','Lost') THEN 1 ELSE 0 END),0)
    AS numeric)*100 AS win_rate  
FROM `crm-sales-data-505221.crm_sales_data.vw_clean_sales_pipelines` sp
  LEFT JOIN `crm-sales-data-505221.crm_sales_data.Products` P ON sp.product = P.product 
GROUP BY
  sp.product,
  p.series,
  p.sales_price
ORDER BY
  total_revenue DESC
LIMIT 1000;

-- Account and Sector Analysis
WITH cleaned_sales AS (
    SELECT
        opportunity_id,
        COALESCE(NULLIF(account, ''), 'Unknown Account') AS account,
        deal_stage,
        close_value,
        CASE WHEN deal_stage = 'Won' THEN 1 ELSE 0 END AS won_flag,
        CASE WHEN deal_stage = 'Lost' THEN 1 ELSE 0 END AS lost_flag,
        CASE WHEN deal_stage IN ('Won', 'Lost') THEN 1 ELSE 0 END AS closed_flag
    FROM `crm-sales-data-505221.crm_sales_data.Sales_pipeline`
),

cleaned_accounts AS (
    SELECT
        account,
        CASE
            WHEN sector = 'technolgy' THEN 'technology'
            ELSE sector
        END AS sector,
        revenue AS account_annual_revenue,
        employees,
        CASE
            WHEN office_location = 'Philipines' THEN 'Philippines'
            ELSE office_location
        END AS office_location
    FROM `crm-sales-data-505221.crm_sales_data.Accounts`
),

joined_data AS (
    SELECT
        cs.*,
        ca.sector,
        ca.account_annual_revenue,
        ca.employees,
        ca.office_location
    FROM cleaned_sales cs
    LEFT JOIN cleaned_accounts ca
        ON cs.account = ca.account
)

SELECT
    account,
    COALESCE(sector, 'Unknown Sector') AS sector,
    COALESCE(office_location, 'Unknown Location') AS office_location,
    account_annual_revenue,
    employees,

    COUNT(DISTINCT opportunity_id) AS total_opportunities,
    SUM(won_flag) AS deals_won,
    SUM(lost_flag) AS deals_lost,

    SUM(CASE WHEN deal_stage = 'Won' THEN close_value ELSE 0 END) AS total_revenue,

    ROUND(SAFE_DIVIDE(
        SUM(CASE WHEN deal_stage = 'Won' THEN close_value ELSE 0 END),
        SUM(won_flag)),2
    ) AS avg_deal_size,

    ROUND(SAFE_DIVIDE(
        SUM(won_flag),
        SUM(closed_flag)
    ),2) AS win_rate

FROM joined_data

GROUP BY
    account,
    sector,
    office_location,
    account_annual_revenue,
    employees

ORDER BY
    total_revenue DESC

LIMIT 1000;
