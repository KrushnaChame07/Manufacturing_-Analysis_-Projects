CREATE DATABASE MANUFACTURING_ANALYTIC;

/* 1.Total_Manufactured_Qty*/
SELECT SUM(Produced_Qty) AS Total_Manufactured_Qty
FROM manufacturing_dataset;

/* 2.Total Rejected Quantity*/
SELECT SUM(Rejected_Qty) AS Total_Rejected_Qty
FROM manufacturing_dataset;

/* 3.Wastage %*/
select (SUM(rejected_qty)*100.0)/SUM(produced_qty)
from manufacturing_dataset;

/* 4.Production_Efficiency*/
SELECT (SUM(Produced_Qty) * 1.0 / SUM(TotalQty)) * 100 AS Production_Efficiency
FROM manufacturing_dataset;

/* 5.delivery_percent*/
SELECT
    (SUM(produced_qty - rejected_qty) * 100.0 / SUM(wo_qty)) AS delivery_percent
FROM manufacturing_dataset;

/* 6.Total Manufactured Quantity by Department*/
SELECT 
    department_name,
    SUM(produced_qty) AS total_manufactured_qty
FROM manufacturing_dataset
GROUP BY department_name
ORDER BY total_manufactured_qty DESC;

/* 7.Total Rejected Quantity by Operation*/
SELECT 
    operation_name,
    SUM(rejected_qty) AS total_rejected_Qty
FROM manufacturing_dataset
GROUP BY operation_name
ORDER BY total_rejected_Qty DESC;

/* 8.Total Production Value by Item*/
SELECT 
    item_code, 
    item_name, 
    SUM(totalvalue) AS total_item_value
FROM manufacturing_dataset
GROUP BY item_code, item_name
ORDER BY total_item_value DESC;

/* 9. Employee wise rejected qty*/
SELECT 
  EMP_Name, 
  SUM(Rejected_Qty) AS Total_Rejected_Qty
FROM manufacturing_dataset
GROUP BY EMP_Name
ORDER BY Total_Rejected_Qty DESC;

/* 10.Daily Manufactured Quantity Trend */
SELECT 
    doc_date,
    SUM(today_manufactured_qty) AS daily_manufactured
FROM manufacturing_dataset
GROUP BY doc_date
ORDER BY doc_date;


