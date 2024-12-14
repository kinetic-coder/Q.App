use QApp;
CREATE TABLE Tenant (
    TenantId BINARY(16) PRIMARY KEY,
    TenantName VARCHAR(255) NOT NULL,
    TenantTypeId BINARY(16) NOT NULL
);
CREATE TABLE Principal (
    PrincipalId BINARY(16) PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);
CREATE TABLE TenantPrincipal (
    TenantUserId BINARY(16) PRIMARY KEY,
    TenantId BINARY(16) NOT NULL,
    PrincipalId BINARY(16) NOT NULL,
    FOREIGN KEY (TenantId) REFERENCES Tenant(TenantId),
    FOREIGN KEY (PrincipalId) REFERENCES Principal(PrincipalId)
);
CREATE TABLE TenantType (
    TenantTypeId BINARY(16) PRIMARY KEY,
    Title VARCHAR(50) NOT NULL
);

ALTER TABLE Tenant
ADD CONSTRAINT FK_Tenant_TenantType FOREIGN KEY (TenantTypeId) REFERENCES TenantType(TenantTypeId);