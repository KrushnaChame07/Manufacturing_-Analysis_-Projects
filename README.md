Manufacturing Analytics Projects

*INTRODUCTION
This project aimed to analyze and optimize the manufacturing process by identifying key performance indicators (KPIs) related to production efficiency, rejection rates, and employee productivity.
 SQL:  Used for data extraction, cleaning, and transformation from raw manufacturing datasets. Created optimized queries and aggregate views to prepare analysis-ready tables.
Tableau: Developed interactive dashboards for initial data exploration and visualization of trends such as production volume, defect rates, and material utilization.
 Power BI:  Built detailed analytical dashboards to evaluate employee-wise productivity, rejection percentage, and repeat orders. Created DAX measures for KPIs like Total Manufactured Quantity, Employee Productivity, and Rejection %. Integrated slicers and filters for dynamic analysis.
Outcome: Provided actionable insights to improve process efficiency, monitor employee performance, and reduce rejection rates. The visual dashboards supported data-driven decision-making across production teams.

*Strengths
Integrated use of Power BI, Tableau, SQL, and Excel for insights.
• Process optimization through rejected vs produced quantity analysis.
• Enables data-driven decisions for manufacturing improvements.
• Highlights high rejection areas for corrective actions.
• Measures operational efficiency with shift-wise performance.

*About Excel Dashboard
This dashboard provides a clear view of our end-to-end manufacturing performance.
It tracks produced vs. rejected quantities across major processes like Laser Cutting, Outsourcing, and Embroidery, helping us identify where defects are most frequent.
We can also analyze buyer-wise sales, total value, and delivery periods, giving insights into customer demand and delivery efficiency.
The data highlights key areas for process improvement and quality enhancement.By comparing production and rejection trends, we can take targeted actions to reduce waste and improve output.
Overall, this dashboard serves as a decision-support tool to monitor performance, improve quality, and strengthen production planning.

*Strengths
Tracks production vs. rejection to monitor process quality and efficiency.

Highlights top-performing and error-prone processes for improvement.

Provides buyer-wise insights on sales, total value, and delivery timelines.

Supports data-driven decisions for reducing defects and optimizing output.

Presents trends and KPIs clearly through simple, visual dashboards.

Easy to update and interpret, making it useful for both management and operations teams.

*Key Points
Tracks overall production, rejection rates, and process efficiency.

Identifies problem areas like high rejection in embroidery or outsourcing.

Shows buyer-wise sales, total value, and delivery performance.

Helps management make quick, data-based quality decisions.

Simple and visual dashboard for easy performance monitoring.

*About PowerBI Dashboard
The dashboard provides a complete overview of production, quality, and efficiency across all manufacturing units.
It tracks key metrics like production output, rejection rate, downtime, and OEE (Overall Equipment Effectiveness).
Visual insights help identify high-defect processes and areas needing improvement.
Buyer-wise and process-wise data enhance decision-making for production and delivery planning.
Interactive visuals make it easy to monitor real-time performance and compare across departments.
Overall, the dashboard supports data-driven process optimization and quality improvement throughout manufacturing operations.

*Strengths
Real-time Monitoring: Tracks live production, rejection, and efficiency data for quick decision-making.

Process-Level Insights: Highlights performance by department, machine, or operator to pinpoint issues.

Visual Clarity: Uses clear charts and KPIs to make complex data easy to understand.

Quality Control: Detects high rejection or downtime areas, enabling early corrective actions.

Buyer & Process Analysis: Combines buyer-wise and production insights for better planning.

Data Integration: Seamlessly pulls data from multiple sources for one unified dashboard.

Interactive Design: Allows users to drill down and compare performance across processes.

Decision Support Tool: Empowers management with actionable insights for efficiency improvement.

*Key Points
Gives a clear view of production, rejection, and efficiency metrics in one place.

Helps identify high-defect areas and improve overall process quality.

Provides real-time, interactive visuals for quick performance tracking.

Supports data-driven decisions to enhance productivity and reduce waste.

Integrates data from multiple processes for a complete manufacturing overview.

*About Tableau Dashboard
The Tableau dashboard provides a real-time, interactive view of overall manufacturing performance.

It tracks key metrics like production output, rejection rates, downtime, and efficiency across all processes.

The visuals make it easy to compare product lines, departments, and buyer performance at a glance.

It helps identify bottlenecks and quality issues, supporting faster decision-making.

Combines multiple data sources into one view for clear, data-driven insights.

Overall, it’s a powerful tool for monitoring productivity, improving quality, and optimizing operations.

The dashboard provides an overview of total processed quantity (49M), rejected quantity (491K), and manufactured quantity (89,946M), with a wastage rate of 0.82%.

Buyer-wise rejection analysis shows the highest rejection from Uniqlo (2.80L), followed by Zara, H&M, and Nike, helping identify client-specific quality issues.

Department-wise manufacturing output is evenly distributed among Woven Labels, Footwear, Printed Fabric, and Knitwear, indicating balanced production operations.

Customer-wise wastage highlights Gupta Manufacturing (131.8%) and Mohan Industry (119.2%) as top contributors to total waste, requiring quality review.

Employee-wise performance shows Amit Kumar and Pooja Patel leading in total press quantity, reflecting strong individual productivity.

Daily processed quantity trends and operation-wise rejection analysis help monitor day-to-day efficiency and pinpoint operational defects.

*Strengths
Comprehensive Visibility: Displays complete production data — processed, rejected, and manufactured quantities in a single view.

Quality Tracking: Identifies top buyers and departments contributing to higher rejection and wastage rates for corrective action.

Performance Insights: Highlights best-performing employees and departments to recognize productivity leaders.

Efficiency Monitoring: Tracks day-wise production trends to analyze fluctuations and operational consistency.
Data-Driven Decisions: Helps management make informed decisions using visual KPIs like wastage %, rejection rates, and process efficiency.

Interactive and Visual: The dashboard design allows easy filtering by buyer, employee, and date for deeper analysis.

*Key Points
Shows total processed (49M), rejected (491K), and manufactured (89,946M) quantities with 0.82% wastage.

Uniqlo and Zara have the highest rejected quantities among all buyers.

Woven Labels and Footwear lead in overall manufacturing output.

Gupta Manufacturing records the highest wastage percentage, indicating a need for process improvement.

Amit Kumar and Pooja Patel are top performers in press quantity output.

Daily and operation-wise trends help track efficiency, performance, and defect causes.

*SQL Summary
The queries calculate key KPIs such as Total Manufactured Quantity, Rejected Quantity, Wastage %, and Production Efficiency.

It includes delivery percentage, helping evaluate on-time and defect-free production.

Department-wise and operation-wise queries identify which units produce or reject the most.

Employee-level and item-level analytics show individual and product performance.

Daily production trends track fluctuations and overall manufacturing consistency.

Overall, the SQL scripts form the data foundation for performance monitoring, efficiency improvement, and decision-making.

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


*Conclusion
The manufacturing dashboards provide a complete, data-driven view of production, quality, and efficiency
They help identify high-defect areas, improve resource utilization, and reduce wastage.
Real-time insights enable faster decision-making and continuous process improvement.
Overall, they empower manufacturing analysts to enhance productivity and drive operational excellence.









