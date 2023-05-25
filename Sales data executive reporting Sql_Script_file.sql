Revenue Trend

SELECT Revenue, `Month name`
FROM sales_table;

Top 5 Products by Revenue

Select P.`Product Name`, 
       SUM(St.revenue) As Total_revenue
From sales_table St
Left Join product P
On St.Productindex = P.Index
Group by P.`Product Name`
Order by Total_revenue Desc
Limit 5;

Top 10 Sales team by Revenue

Select Ste.`Sales Team`, 
	 SUM(sta.revenue) As TOtal_revenue
From sales_table Sta
Left Join sales_team Ste
On sta.Salesteamindex = Ste.Index
Group by Ste.`Sales Team`
Order by TOtal_revenue Desc
Limit 10;

Top 10 states by revenue, also showing their population and median income per state 

Select SL.State, 
   Sum(St.Revenue) AS Revenue, 
   Sum(SL.Population) AS Population, 
   Sum(SL.median_income) AS Median_income
From sales_table St
Left Join store_locations SL
On St.Storeindex = SL.Id
Group By State
Order by Revenue Desc
limit 10;
Top 2 revenue products in January?

Select st.`Month name`, 
	   P.`Product name`, 
	   Round(Sum(st.Revenue),2) As Total_revenue
From sales_table st
Left Join product P
On St.Productindex = P.Index
Group by st.`Month name`, P.`Product Name`
Having st.`Month name` = 'Jan'
Order by Total_revenue DESc
Limit 2;

Which sales team made the most revenue from Decoratives in March?

Select Ste.`Sales Team`, 
       Round(SUM(Sta.revenue),2) As Total_revenue, 
        P.`Product Category`, 
        `Month name`
From sales_table Sta
Left Join sales_team Ste
On Sta.Salesteamindex = Ste.Index
Left Join product p
On Sta.Productindex = p.Index
Where P.`Product Category` = 'Decoratives' AND `Month Name` = 'Mar'
Group by Ste.`Sales Team`
Order by Total_revenue DESC
Limit 1;

Relationship between revenue, population and median income of the states? 

Select Sl.State, 
   ROUND(Sum(St.Revenue),2) AS Total_revenue, 
   Sum(Sl.Population) AS Total_P, 
   Sum(Sl.median_income) AS Total_m
From sales_table St
Left Join store_locations Sl
On St.Storeindex = Sl.Id
Group By State
Order by Total_P;













