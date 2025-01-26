use QApp;

/* table used to hold the Tenant informaiton which represents the registered organisation */
CREATE TABLE Tenant (
    TenantId BINARY(16) PRIMARY KEY,
    TenantName VARCHAR(100) NOT NULL,
    TenantEmail VARCHAR(255),
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* table used to hold the User information */
CREATE TABLE User (
    UserId BINARY(16) PRIMARY KEY,
    TenantId BINARY(16) NOT NULL,
    UserName VARCHAR(100) NOT NULL,
    UserEmail VARCHAR(255) NOT NULL,
    UserPassword VARCHAR(255) NOT NULL,
    UserPhone VARCHAR(20),
    UserAddress VARCHAR(255),
    UserCity VARCHAR(100),
    UserState VARCHAR(100),
    UserCountry VARCHAR(100),
    UserZip VARCHAR(20),
    UserStatus VARCHAR(20) DEFAULT 'Active',
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (TenantId) REFERENCES Tenant(TenantId)
);
/* table used to link the User and Tenant tables with a many-to-many relationship */
CREATE TABLE UserTenant (
    UserTenantId BINARY(16) PRIMARY KEY,
    UserId BINARY(16) NOT NULL,
    TenantId BINARY(16) NOT NULL,
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES User(UserId),
    FOREIGN KEY (TenantId) REFERENCES Tenant(TenantId),
    UNIQUE (UserId, TenantId)
);

/* Create an address location table */
CREATE TABLE Address (
    AddressLocationId BINARY(16) PRIMARY KEY,
    Nickname VARCHAR(100) DEFAULT'',
    TenantId BINARY(16) NOT NULL,
    AddressLine1 VARCHAR(255) NOT NULL,
    AddressLine2 VARCHAR(255),
    Town varchar(255),
    County varchar(255),
    PostCode varchar(255),
    AddressLocationStatus VARCHAR(20) DEFAULT 'Active',
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (TenantId) REFERENCES Tenant(TenantId)
);

/* Table to hold the category the kit falls into */
CREATE TABLE KitCategory (
    KitCategoryId BINARY(16) PRIMARY KEY,
    TenantId BINARY(16) NOT NULL,
    CategoryName VARCHAR(100) NOT NULL,
    CategoryDescription VARCHAR(255),
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (TenantId) REFERENCES Tenant(TenantId)
);
/* store condition of the kit */
CREATE TABLE KitCondition (
    KitConditionId BINARY(16) PRIMARY KEY,
    TenantId BINARY(16) NOT NULL,
    ConditionName VARCHAR(100) NOT NULL,
    ConditionDescription VARCHAR(255),
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (TenantId) REFERENCES Tenant(TenantId)
);


/* Create a table for kit */
CREATE TABLE Kit (
    KitId BINARY(16) PRIMARY KEY,
    TenantId BINARY(16) NOT NULL,
    Nickname varchar(255) NOT NULL,
    KitName VARCHAR(100) NOT NULL,
    KitDescription VARCHAR(255),
    PurchaseDate DATE,
    PurchasePrice DECIMAL(10,2),
    LiftSpanInYears INT,
    EstimatedInsuranceValue DECIMAL(10,2),
    EstimatedReplacementDate DATE,
    KitCategoryId BINARY(16) NOT NULL,
    KitConditionId BINARY(16) NOT NULL,
    Notes VARCHAR(255),
    KitCode VARCHAR(255),
    FOREIGN KEY (KitCategoryId) REFERENCES KitCategory(KitCategoryId),
    KitStatus VARCHAR(20) DEFAULT 'Active',
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (TenantId) REFERENCES Tenant(TenantId)
);


/* Table to store which address the kit is stored at */
CREATE TABLE KitAddress (
    KitAddressId BINARY(16) PRIMARY KEY,
    KitId BINARY(16) NOT NULL,
    AddressLocationId BINARY(16) NOT NULL,
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (KitId) REFERENCES Kit(KitId),
    FOREIGN KEY (AddressLocationId) REFERENCES Address(AddressLocationId),
    UNIQUE (KitId, AddressLocationId)
);

