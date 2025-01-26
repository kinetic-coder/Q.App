use QApp;

set @BusinessTenantTypeId = UUID();

set @IndividualTenantTypeId = UUID();

insert into TenantType (TenantTypeId, TenantTypeName)
values (@BusinessTenantTypeId, 'Business');

insert into TenantType (TenantTypeId, TenantTypeName)
values (@IndividualTenantTypeId, 'Individual');

insert into Tenant 
(TenantId, TenantName, TenantTypeId)
values (UUID(), 'Organisation 1', @BusinessTenantTypeId);
