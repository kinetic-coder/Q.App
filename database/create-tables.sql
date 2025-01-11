use QApp;

/* table used to hold the Tenant informaiton which represents the registered organisation */
CREATE TABLE Tenant (
    TenantId INT PRIMARY KEY AUTO_INCREMENT,
    TenantName VARCHAR(100) NOT NULL,
    TenantEmail VARCHAR(255),
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* table used to hold the User information */
CREATE TABLE User (
    UserId INT PRIMARY KEY AUTO_INCREMENT,
    TenantId INT NOT NULL,
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
    UserTenantId INT PRIMARY KEY AUTO_INCREMENT,
    UserId INT NOT NULL,
    TenantId INT NOT NULL,
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES User(UserId),
    FOREIGN KEY (TenantId) REFERENCES Tenant(TenantId),
    UNIQUE (UserId, TenantId)
);

/* Create an address location table */
CREATE TABLE Address (
    AddressLocationId INT PRIMARY KEY AUTO_INCREMENT,
    Nickname VARCHAR(100) DEFAULT'',
    TenantId INT NOT NULL,
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
    KitCategoryId INT PRIMARY KEY AUTO_INCREMENT,
    TenantId INT NOT NULL,
    CategoryName VARCHAR(100) NOT NULL,
    CategoryDescription VARCHAR(255),
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (TenantId) REFERENCES Tenant(TenantId)
);
/* store condition of the kit */
CREATE TABLE KitCondition (
    KitConditionId INT PRIMARY KEY AUTO_INCREMENT,
    TenantId INT NOT NULL,
    ConditionName VARCHAR(100) NOT NULL,
    ConditionDescription VARCHAR(255),
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (TenantId) REFERENCES Tenant(TenantId)
);


/* Create a table for kit */
CREATE TABLE Kit (
    KitId INT PRIMARY KEY AUTO_INCREMENT,
    TenantId INT NOT NULL,
    Nickname varchar(255) NOT NULL,
    KitName VARCHAR(100) NOT NULL,
    KitDescription VARCHAR(255),
    PurchaseDate DATE,
    PurchasePrice DECIMAL(10,2),
    LiftSpanInYears INT,
    EstimatedReplacementDate DATE,
    CategoryId INT NOT NULL,
    KitConditionId INT NOT NULL,
    Notes VARCHAR(255),
    FOREIGN KEY (CategoryId) REFERENCES KitCategory(KitCategoryId),
    KitStatus VARCHAR(20) DEFAULT 'Active',
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (TenantId) REFERENCES Tenant(TenantId)
);


/* Table to store which address the kit is stored at */
CREATE TABLE KitAddress (
    KitAddressId INT PRIMARY KEY AUTO_INCREMENT,
    KitId INT NOT NULL,
    AddressLocationId INT NOT NULL,
    CreatedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (KitId) REFERENCES Kit(KitId),
    FOREIGN KEY (AddressLocationId) REFERENCES Address(AddressLocationId),
    UNIQUE (KitId, AddressLocationId)
);

