use QApp;

INSERT INTO Tenant (TenantName, TenantEmail) VALUES ('Test Tenant', 'test.tenant@gmail.com');

INSERT INTO Address (Nickname, TenantId, AddressLine1, AddressLine2, Town, County, PostCode, AddressLocationStatus) VALUES ('Church Loft', 1, 'Euxton Methodist Church Hall', 'Wigan Road', 'Chorley', 'Lancashire', 'PR7 6LP', 'Active');
INSERT INTO Address (Nickname, TenantId, AddressLine1, AddressLine2, Town, County, PostCode, AddressLocationStatus) VALUES ('Choir Store', 1, 'Euxton Methodist Church Hall', 'Wigan Road', 'Chorley', 'Lancashire', 'PR7 6LP', 'Active');