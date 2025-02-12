use QApp;

SET @tenant_id = UNHEX(REPLACE(UUID(), '-', ''));

INSERT INTO Tenant (TenantId, TenantName, TenantEmail) VALUES (@tenant_id,'Test Tenant', 'test.tenant@gmail.com');

SET @loft_address_id = UNHEX(REPLACE(UUID(), '-', ''));
SET @choir_address_id = UNHEX(REPLACE(UUID(), '-', ''));

INSERT INTO Address (AddressId, Nickname, TenantId, AddressLine1, AddressLine2, Town, County, PostCode, AddressLocationStatus) VALUES (@loft_address_id, 'Church Loft', @tenant_id, 'Chorley Methodist Church Hall', 'Chorley Old Road', 'Chorley', 'Lancashire', 'PR7 8LX', 'Active');
INSERT INTO Address (AddressId, Nickname, TenantId, AddressLine1, AddressLine2, Town, County, PostCode, AddressLocationStatus) VALUES (@choir_address_id, 'Choir Store', @tenant_id, 'Chorley Methodist Church Hall', 'Chorley Old Road', 'Chorley', 'Lancashire', 'PR7 8LX', 'Active');

SET @category_id = UNHEX(REPLACE(UUID(), '-', ''));
/* Kit Category */
INSERT INTO KitCategory (KitCategoryId, TenantId, CategoryName, CategoryDescription) VALUES (@category_id, @tenant_id, 'Consumables', 'Regularly used items that need regularly replacing');
SET @category_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO KitCategory (KitCategoryId, TenantId, CategoryName, CategoryDescription) VALUES (@category_id, @tenant_id, 'Activity Equipment', 'Items used for specific activities');
SET @category_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO KitCategory (KitCategoryId, TenantId, CategoryName, CategoryDescription) VALUES (@category_id, @tenant_id, 'Personal Equipment', 'Items used by individuals');
SET @category_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO KitCategory (KitCategoryId, TenantId, CategoryName, CategoryDescription) VALUES (@category_id, @tenant_id, 'Camp Equipment', 'Items used for camping');
SET @category_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO KitCategory (KitCategoryId, TenantId, CategoryName, CategoryDescription) VALUES (@category_id, @tenant_id, 'Tent', 'Items used for camping');
SET @category_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO KitCategory (KitCategoryId, TenantId, CategoryName, CategoryDescription) VALUES (@category_id, @tenant_id, 'Cooking Equipment', 'Items used for cooking');
SET @category_id = UNHEX(REPLACE(UUID(), '-', ''));
INSERT INTO KitCategory (KitCategoryId, TenantId, CategoryName, CategoryDescription) VALUES (@category_id, @tenant_id, 'Trailer', 'Items used for sleeping');

-- /* Kit Condition */
-- INSERT INTO KitCondition (TenantId, ConditionName, ConditionDescription) VALUES (1, 'New', 'Brand new in the bag');
-- INSERT INTO KitCondition (TenantId, ConditionName, ConditionDescription) VALUES (1, 'Good', 'In good condition');
-- INSERT INTO KitCondition (TenantId, ConditionName, ConditionDescription) VALUES (1, 'Damaged', 'Needs repair');
-- INSERT INTO KitCondition (TenantId, ConditionName, ConditionDescription) VALUES (1, 'Lost', 'Cannot be found');
-- INSERT INTO KitCondition (TenantId, ConditionName, ConditionDescription) VALUES (1, 'Unchecked', 'Not checked for condition.');

