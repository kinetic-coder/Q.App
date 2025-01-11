use QApp;

INSERT INTO Tenant (TenantName, TenantEmail) VALUES ('Test Tenant', 'test.tenant@gmail.com');

INSERT INTO Address (Nickname, TenantId, AddressLine1, AddressLine2, Town, County, PostCode, AddressLocationStatus) VALUES ('Church Loft', 1, 'Chorley Methodist Church Hall', 'Chorley Old Road', 'Chorley', 'Lancashire', 'PR7 8LX', 'Active');
INSERT INTO Address (Nickname, TenantId, AddressLine1, AddressLine2, Town, County, PostCode, AddressLocationStatus) VALUES ('Choir Store', 1, 'Chorley Methodist Church Hall', 'Chorley Old Road', 'Chorley', 'Lancashire', 'PR7 8LX', 'Active');

/* Kit Category */
INSERT INTO KitCategory (TenantId, CategoryName, CategoryDescription) VALUES (1, 'Consumables', 'Regularly used items that need regularly replacing');
INSERT INTO KitCategory (TenantId, CategoryName, CategoryDescription) VALUES (1, 'Activity Equipment', 'Items used for specific activities');
INSERT INTO KitCategory (TenantId, CategoryName, CategoryDescription) VALUES (1, 'Personal Equipment', 'Items used by individuals');
INSERT INTO KitCategory (TenantId, CategoryName, CategoryDescription) VALUES (1, 'Camp Equipment', 'Items used for camping');
INSERT INTO KitCategory (TenantId, CategoryName, CategoryDescription) VALUES (1, 'Tent', 'Items used for camping');
INSERT INTO KitCategory (TenantId, CategoryName, CategoryDescription) VALUES (1, 'Cooking Equipment', 'Items used for cooking');
INSERT INTO KitCategory (TenantId, CategoryName, CategoryDescription) VALUES (1, 'Trailer', 'Items used for sleeping');

/* Kit Condition */
INSERT INTO KitCondition (TenantId, ConditionName, ConditionDescription) VALUES (1, 'New', 'Brand new in the bag');
INSERT INTO KitCondition (TenantId, ConditionName, ConditionDescription) VALUES (1, 'Good', 'In good condition');
INSERT INTO KitCondition (TenantId, ConditionName, ConditionDescription) VALUES (1, 'Damaged', 'Needs repair');
INSERT INTO KitCondition (TenantId, ConditionName, ConditionDescription) VALUES (1, 'Lost', 'Cannot be found');
INSERT INTO KitCondition (TenantId, ConditionName, ConditionDescription) VALUES (1, 'Unchecked', 'Not checked for condition.');

