//*In the following query, I add a few columns which I need to calculate the CapRate of the properties.
I also filter out all the properties that don't cash-flow.
*//


Select *,
	(((NOI * 12) / ProposedPrice) * 100) as CapRate
From(
Select*,
(Price * .9) as ProposedPrice,
(RentEstimate - MonthlyCost) as NOI
From EPRealEstate
Where RentEstimate > MonthlyCost) as AdjustedTable
Order By CapRate Desc
