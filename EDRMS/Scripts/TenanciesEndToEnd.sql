select
--i.ID
oo.id
,ip.[Tenancy Number]
from [SERVER].[Housing_Test].[dbo].[Occupancies_Occupancy] oo with (NOLOCK)
inner join [SERVER].[Housing_Test].[dbo].[PropertyStructure_Unit] psu with (NOLOCK) on
oo.Company = psu.Company and
oo.Unit = psu.id
left join [SERVER].[Housing_Test].[dbo].[Occupancies_people] op on
oo.company = op.Company and
oo.id = op.Occupancy and
op.CurrentPerson = 1 and
op.MainTenant = 1
left join [SERVER].[Housing_Test].[dbo].[Peoples_People] pp on
op.Company = pp.Company and
op.People = pp.ID
inner join Itemprofiles ip
      on oo.unit Collate SQL_Latin1_General_CP1_CI_AS = ip.[Property Reference]
      where oo.id = 99
      /*AND CAST(oo.id AS nvarchar(25)) = ip.[Tenancy Number]
      inner join items i
      ON i.id = ip._i_itemID
      AND i.ItemTypeID = 6
      AND ip.StructureID = 12
WHERE 
oo.[enddate] <= GETDATE()*/
