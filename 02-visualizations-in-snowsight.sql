
-- 2.0.0   Visualizations in Snowsight
--         The purpose of this lab is to show you how to use the visualization
--         features and tools available in Snowsight. Specifically, you’ll learn
--         how to leverage our built-in contextual statistics columns in order
--         to gain quick insights into data. Also, you’ll learn how to create a
--         dashboard from an existing query.
--         - Use ad hoc filters to gain insights into data.
--         - Create a dashboard from a worksheet.
--         - Add tiles to a dashboard.
--         - Share a dashboard.
--         - Explore visualizations in Workspaces.
--         Snowbear Air is interested in seeing a year-by-year summary of gross
--         sales. You’ve been asked to write a query with a graph and share it
--         via a Snowflake dashboard. You’ve decided to use the
--         PROMO_CATALOG_SALES schema to accomplish your task.
--         HOW TO COMPLETE THIS LAB
--         In the previous lab, you may have created a new worksheet, loaded the
--         SQL file for the lab, and then followed the instructions in the file
--         without looking at the workbook PDF. That approach will be modified
--         due to the nature of this exercise.
--         Note that this lab contains a step in which you will create a
--         dashboard using the worksheet you created from this lab’s SQL file.
--         Once you complete that step, you will lose access to the worksheet
--         (and, thus, the instructions). Because of this, the best way to
--         complete this exercise is to read the instructions from the PDF
--         workbook for the entire lab from start to finish.
--         Let’s get started!

-- 2.1.0   Set Up for the Lab

-- 2.1.1   Create a worksheet by loading the SQL file for this lab.
--         To load the SQL file, in the left navigation bar select Projects,
--         then select Worksheets. From the Worksheets page, in the upper-right
--         corner, click the ellipsis (…) to the left of the blue plus (+)
--         button. Select Create Worksheet from SQL File from the drop-down
--         menu. Then:
--         - Navigate to where you downloaded and unzipped the lab files.
--         - Open the USERS folder, and then open the sub-folder with your
--         username.
--         - Open the file for this lab: 02-visualizations-in-snowsight.sql. A
--         new worksheet will open with the selected SQL file loaded.

-- 2.1.2   Rename the worksheet.
--         Select the three vertical dots to the right of your worksheet’s
--         default name (which is the name of the SQL file). Change the name of
--         your worksheet to Dashboard Data.

-- 2.1.3   Set the context by executing the statements below in your worksheet.
--         If you follow along in your SQL worksheet for this lab, you’ll notice
--         that the file is filled with commented instructions. Just scroll down
--         to the context commands shown below and execute them.

USE ROLE fund_role;
USE SCHEMA snowbearair_db.promo_catalog_sales;
CREATE WAREHOUSE IF NOT EXISTS INSTRUCTOR1_fund_wh;
USE WAREHOUSE INSTRUCTOR1_fund_wh;


-- 2.1.4   Run the query below.

SELECT 
  YEAR(o.o_orderdate) AS year,
  SUM(l.l_extendedprice) AS sum_gross_revenue
FROM
        customer c
        INNER JOIN orders o on c.c_custkey = o.o_custkey
        INNER JOIN lineitem l on o.o_orderkey = l.l_orderkey
GROUP BY year
ORDER BY year;

--         You should see the results below:

-- 2.2.0   Analyze the Results and Data

-- 2.2.1   Review the Query Details pane.
--         To the right of your query result, you will see the Query Details
--         pane. Click the Show more button in the Query Details pane for more
--         information, such as the role and virtual warehouse used by the
--         query.

-- 2.2.2   View contextual statistics.
--         Scroll down. Below the Query Details pane, you will see contextual
--         statistics for the two columns in your table: one pane labeled YEAR
--         and the other labeled SUM_GROSS_REVENUE. The contextual statistics,
--         one for each column returned by the query, can be used interactively
--         as filters on the query result.

-- 2.2.3   Activate the YEAR filter.
--         Click on the YEAR filter in the contextual statistics pane. This will
--         also highlight the YEAR column in the query results, as shown below:

-- 2.2.4   Click on the leftmost column in the graph.
--         Now the results should be filtered for 2012 only:

-- 2.2.5   Select 2012 and 2013.
--         Note, the two oval selectors beneath the chosen column in the
--         filter’s graph. Click, hold, and drag the right-most selector to
--         include both 2012 and 2013. Your filter should now appear as shown
--         below:
--         Now click different bars or select any combination of contiguous bars
--         to see how the filter changes the data shown.

-- 2.2.6   Clear the filter.
--         Click Clear filter at the top of the statistics pane.
--         This will return the results to their unfiltered state.

-- 2.2.7   Close the filter.
--         Click the X in the upper right corner of the panel. This will clear
--         the column selected, and you should see the Query Details pane and
--         the YEAR and SUM_GROSS_REVENUE filters.

-- 2.2.8   Format the SUM_GROSS_REVENUE column.
--         You can change the formatting of columns with numbers to include or
--         exclude commas. Hover over the SUM_GROSS_REVENUE column name, and
--         click the three vertical dots that appear on the right side of the
--         column header. A formatting panel will appear. Click the picture of
--         the comma to add commas to the values in the column, as shown below:
--         You can click it again to remove the commas. You can also play with
--         the other options to see what they do. You should have commas but no
--         decimal values in the SUM_GROSS_REVENUE column when finished.

-- 2.2.9   Filter the SUM_GROSS_REVENUE data.
--         The filter should appear as below. Click each bar in the graph and
--         observe how the data is filtered. Clicking between the bars will
--         display the following message: Query produced no results. That’s
--         because there is a gap between the value in the left-most bar and the
--         value in the right-most bar.

-- 2.2.10  Clear and close the filter.
--         Click Clear filter and then the X to close the filter.

-- 2.3.0   Create a Dashboard
--         You can create a dashboard either from the dashboard area or by
--         moving an existing worksheet to the dashboard area. The next step
--         will be to move your worksheet out of the worksheet area into the
--         dashboard area, so you will need access to the PDF for the
--         instructions that follow.
--         Creating a dashboard from an existing worksheet moves the worksheet
--         to the dashboard area (so it will no longer appear in your worksheets
--         area). If you’ve been relying on the instructions in the SQL file,
--         you will lose access to those instructions once you move the existing
--         worksheet to a new dashboard. If you have not used your PDF workbook
--         thus far, open it now for the rest of the instructions.

-- 2.3.1   Move your worksheet to the dashboard area.
--         Click on the three vertical dots to the right of your worksheet’s
--         name, and navigate to Move to and then + New Dashboard in the drop-
--         down menu.

-- 2.3.2   Name the dashboard INSTRUCTOR1 Gross Sales.
--         In the pop-up box that appears, enter your user name followed by
--         Gross Sales as the dashboard name, and click Create Dashboard.
--         You will now see that the worksheet has been moved to the Dashboard
--         area. The result of the query is displayed as a tile in the new
--         dashboard.
--         Refresh your browser window if you do not see the dashboard tile.
--         You may see a warning banner relating to secondary roles and
--         dashboards. You can ignore this by clicking on the X in the banner.

-- 2.3.3   Rename the Tile.
--         The tile in the dashboard has the name of your original Worksheet. To
--         rename the tile, click the ellipsis (…) that appears in the upper far
--         right corner of your existing tile (not dashboard) and select Edit
--         Query. The name of the worksheet (shown at the top) becomes the name
--         of the tile. Change the name to Gross Sales Data. Click the drop-down
--         beside the name of the sheet, type in the new name Gross Sales Data,
--         then press the ENTER (or RETURN) key.

-- 2.3.4   Click - Return to INSTRUCTOR1 Gross Sales in the upper left corner.
--         You should now see the new name of the dashboard tile.
--         Tiles are used to present data or graphs in a dashboard.

-- 2.4.0   Add Tiles to a Dashboard
--         There are several ways to add a tile to an existing dashboard. You
--         can create a new tile from scratch, or you can duplicate an existing
--         tile to modify its query. Or, if you have a tile that contains
--         numeric data and you want to create a graph of that data, you can
--         simply edit the query for that tile and press the Chart button. We
--         are going to use the third method since our new tile will just be a
--         different representation of the same data.

-- 2.4.1   Create a new tile.
--         In your dashboard, click the ellipsis (…) that appears in the upper
--         far right corner of your existing tile (not dashboard) and select
--         Edit Query. You will be taken back to the original query with the
--         query result.

-- 2.4.2   Press the Chart button just below the SQL pane and just above the
--         query results.
--         A graph will be displayed. The graph may not be a line graph.
--         To the right of the graph are the chart specifications. Click the
--         down arrow to the right of Chart type and select Line.
--         The resulting chart should look similar to the one shown below.

-- 2.4.3   Click - Return to INSTRUCTOR1 Gross Sales in the upper left.
--         You should now see a completed dashboard like the one shown below:

-- 2.4.4   Reposition the graph tile above the data tile.
--         Click, hold, and drag the graph tile. When you see a blue line appear
--         just above the tile with the gross sales table, release the mouse
--         key.
--         Your dashboard should now appear as it does below.

-- 2.5.0   Share Your Dashboard

-- 2.5.1   Click the Share button in the upper-right corner.
--         In this dialog box, you can search for someone and invite them to
--         view and use this dashboard.

-- 2.5.2   Enter Instructor1 as the user to share with.

-- 2.5.3   Set permissions to View results.
--         Click the down arrow to the right of the user name, and select View
--         results. Then click Done. You have now shared your dashboard.

-- 2.5.4   Return to the home screen.
--         Click the Snowflake logo in the upper left corner.

-- 2.6.0   Explore Visualizations in Workspaces
--         Workspaces has powerful data filtering and visualization
--         capabilities.

-- 2.6.1   Go to the Workspaces page.
--         In the left navigation bar select Projects, then select Workspaces.

-- 2.6.2   Close all open tabs.
--         Click the gear icon in the top right of the Workspaces page and
--         select Close all tabs.

-- 2.6.3   Upload the SQL file for this lab into My Workspace.
--         In the My Workspace pane, click + Add new, then select Upload Files.
--         Then:
--         - Navigate to where you downloaded and unzipped the lab files.
--         - Open the USERS folder, and then open the sub-folder with your
--         username.
--         - Select the file for this lab: 02-visualizations-in-snowsight.sql.
--         Once the file has been uploaded, select the file in the My Workspace
--         pane. The file opens in a new Workspaces tab as shown in the graphic.

-- 2.6.4   In the file scroll down to step 2.6.4 and run the statements to set
--         your context.

USE ROLE fund_role;
USE WAREHOUSE INSTRUCTOR1_fund_wh;
USE SCHEMA snowbearair_db.promo_catalog_sales;


-- 2.6.5   Run the query to determine monthly revenue grouped by order priority.

SELECT 
  -- Truncate order date to month level for aggregation
  DATE_TRUNC('MONTH', o.o_orderdate) AS month,
  -- Calculate total revenue for the month
  SUM(l.l_extendedprice) AS sum_gross_revenue,
  -- Group by order priority level
  o.o_orderpriority AS order_priority,
  -- Count distinct orders to avoid duplicates from line items
  COUNT(DISTINCT o.o_orderkey) AS order_count
FROM
        customer c
        INNER JOIN orders o on c.c_custkey = o.o_custkey
        INNER JOIN lineitem l on o.o_orderkey = l.l_orderkey
GROUP BY month, o_orderpriority
ORDER BY month, o_orderpriority;

--         You should see the results below.

-- 2.6.6   Create a bar chart that shows gross revenue by year.
--         In the results tab click Chart.
--         Then use the following settings in the chart controls panel:
--         Chart type: Bar chart
--         X-Axis: MONTH
--         Time resolution: Year
--         Sort: None
--         Y-AXIS: SUM_GROSS_REVENUE
--         Aggregate: Sum
--         Group by: None
--         Title: Gross Revenue by Year
--         X-axis label: Year
--         Y-axis label: Gross Revenue
--         The resulting chart should look similar to the one shown below.

-- 2.6.7   Modify the chart to a stacked bar chart that shows the gross revenue
--         per year by order priority.
--         Change Chart type to Stacked bar chart.
--         Set Group by to ORDER_PRIORITY.
--         Modify the title of the chart appropriately.
--         The resulting chart should look similar to the one shown below.

-- 2.6.8   Modify the chart to a pie chart that shows the order count
--         categorized by order priority.
--         Change Chart type to Pie chart.
--         Set Categories to ORDER_PRIORITY.
--         Set Values to ORDER_COUNT.
--         Set Aggregate to None.
--         Modify the title of the chart appropriately.
--         The resulting chart should look similar to the one shown below.
--         In the current release of Workspaces, charts and results cannot be
--         shared or displayed in dashboards.

-- 2.6.9   Return to the home screen.
--         Click the Snowflake logo in the upper left corner.

-- 2.7.0   Key Takeaways
--         - While conducting ad hoc analyses, you can use filters to gain
--         insights into your data.
--         - You can create dashboards out of existing worksheets.
--         - Snowflake makes it easy to share worksheets and dashboards with
--         colleagues.
--         - You can visualize data in worksheets, dashboards, and workspaces.
