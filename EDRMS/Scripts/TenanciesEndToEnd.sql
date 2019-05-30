SELECT
--i.ID
oo.id
,ip.[Tenancy Number]
FROM [SERVER].[Housing_Test].[dbo].[Occupancies_Occupancy] oo with (NOLOCK)
inner JOIN [SERVER].[Housing_Test].[dbo].[PropertyStructure_Unit] psu with (NOLOCK) ON
oo.Company = psu.Company AND
oo.Unit = psu.id
left JOIN [SERVER].[Housing_Test].[dbo].[Occupancies_people] op ON
oo.company = op.Company AND
oo.id = op.Occupancy AND
op.CurrentPerson = 1 AND
op.MainTenant = 1
left JOIN [SERVER].[Housing_Test].[dbo].[Peoples_People] pp ON
op.Company = pp.Company AND
op.People = pp.ID
inner JOIN Itemprofiles ip
      ON oo.unit Collate SQL_Latin1_General_CP1_CI_AS = ip.[Property Reference]
WHERE oo.id = 99
      
