-- Active: 1735507046328@@127.0.0.1@3306
use QApp;

DELIMITER //

CREATE FUNCTION BinaryToGuid(binary_value BINARY(16)) 
RETURNS CHAR(36) DETERMINISTIC
BEGIN
    RETURN LOWER(
        CONCAT_WS('-',
            SUBSTRING(HEX(binary_value), 1, 8),
            SUBSTRING(HEX(binary_value), 9, 4),
            SUBSTRING(HEX(binary_value), 13, 4),
            SUBSTRING(HEX(binary_value), 17, 4),
            SUBSTRING(HEX(binary_value), 21, 12)
        )
    );
END //

DELIMITER ;


-- DROP PROCEDURE IF EXISTS sp_add_kit;

-- DELIMITER //
-- CREATE PROCEDURE sp_add_kit(
--     IN TenantId BINARY(16), 
--     IN Nickname VARCHAR(255), 
--     IN KitName VARCHAR(100), 
--     IN KitDescription VARCHAR(255),
--     IN PurchaseDate DATE,
--     IN PurchasePrice DECIMAL(10,2), 
--     IN LiftSpanInYears INT, 
--     IN EstimatedInsuranceValue DECIMAL(10,2), 
--     IN EstimatedReplacementDate DATE, 
--     IN KitCategory VARCHAR(255), 
--     IN KitCondition VARCHAR(255), 
--     IN Notes VARCHAR(255),
--     IN KitCode VARCHAR(255)
-- )
-- BEGIN
--     DECLARE kit_category_id BINARY(16) DEFAULT 0;
--     DECLARE kit_condition_id BINARY(16) DEFAULT 0;
    
--     SELECT KitCategoryId INTO kit_category_id FROM KitCategory WHERE lcase(trim(CategoryName)) = lcase(trim(KitCategory));
--     SELECT KitConditionId INTO kit_condition_id FROM KitCondition WHERE lcase(trim(ConditionName)) = lcase(trim(KitCondition));
    
--     INSERT INTO Kit (TenantId, Nickname, KitName, KitDescription, PurchaseDate, PurchasePrice, LiftSpanInYears, EstimatedInsuranceValue, EstimatedReplacementDate, KitCategoryId, KitConditionId, Notes, KitCode)
--     VALUES (TenantId, Nickname, KitName, KitDescription, PurchaseDate, PurchasePrice, LiftSpanInYears, EstimatedInsuranceValue, EstimatedReplacementDate, kit_category_id, kit_condition_id, Notes, KitCode);
    
-- END;
-- //
-- DELIMITER ;

DROP PROCEDURE IF EXISTS get_categories;

DELIMITER //
CREATE PROCEDURE get_categories()
BEGIN
    SELECT 
		BinaryToGuid(KitCategoryId) AS KitCategoryId,
		BinaryToGuid(TenantId) AS TenantId,
		CategoryName,
		CategoryDescription,
		CreatedOn,
		UpdatedOn
	FROM KitCategory;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_get_conditions;

DELIMITER //
CREATE PROCEDURE get_conditions()
BEGIN
    SELECT 
		BinaryToGuid(KitConditionId) AS KitConditionId,
		BinaryToGuid(TenantId) AS TenantId,
		ConditionName,
		ConditionDescription,
		CreatedOn,
		UpdatedOn
	FROM KitCategory;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS get_addresses;

DELIMITER //
CREATE PROCEDURE get_addresses(
	IN TenantId BINARY(16)
)
BEGIN
    SELECT 
		BinaryToGuid(AddressId) AS AddressId,
		BinaryToGuid(TenantId) AS TenantId,
		Nickname,
		AddressLine1,
		AddressLine2,
		City,
		Town,
		PostCode,
		AddressLocationStatus

	FROM Address
	WHERE TenantId = TenantId;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS get_kit;

DELIMITER //
CREATE PROCEDURE get_kit(
	IN TenantId BINARY(16)
)
BEGIN
    SELECT 
		BinaryToGuid(k.KitId) AS KitId,
		BinaryToGuid(k.TenantId) AS TenantId,
		k.Nickname,
		k.KitName,
		k.KitDescription,
		k.PurchaseDate,
		k.PurchasePrice,
		k.LiftSpanInYears,
		k.EstimatedInsuranceValue,
		k.EstimatedReplacementDate,
		BinaryToGuid(k.KitCategoryId) AS KitCategoryId,
		kcat.CategoryName,
		BinaryToGuid(k.KitConditionId) AS KitConditionId,
		kcond.ConditionName,
		k.Notes,
		k.KitCode,
		k.KitStatus,
		a.Nickname AS AddressNickname
	FROM Kit k
	LEFT JOIN KitCategory kcat
		ON k.KitCategoryId = kcat.KitCategoryId
	LEFT JOIN KitCondition kcond
		ON k.KitConditionId = kcond.KitConditionId 
	LEFT JOIN KitAddress ka
		ON k.KitId = ka.KitId
	LEFT JOIN Address a
		ON ka.AddressId = a.AddressId
	WHERE TenantId = TenantId;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS get_kit_by_id;

DELIMITER //
CREATE PROCEDURE get_kit_by_id(
	IN TenantId BINARY(16),
	IN KitId BINARY(16)
)
BEGIN
    SELECT 
		BinaryToGuid(k.KitId) AS KitId,
		BinaryToGuid(k.TenantId) AS TenantId,
		k.Nickname,
		k.KitName,
		k.KitDescription,
		k.PurchaseDate,
		k.PurchasePrice,
		k.LiftSpanInYears,
		k.EstimatedInsuranceValue,
		k.EstimatedReplacementDate,
		BinaryToGuid(k.KitCategoryId) AS KitCategoryId,
		kcat.CategoryName,
		BinaryToGuid(k.KitConditionId) AS KitConditionId,
		kcond.ConditionName,
		k.Notes,
		k.KitCode,
		k.KitStatus,
		a.Nickname AS AddressNickname
	FROM Kit k
	LEFT JOIN KitCategory kcat
		ON k.KitCategoryId = kcat.KitCategoryId
	LEFT JOIN KitCondition kcond
		ON k.KitConditionId = kcond.KitConditionId 
	LEFT JOIN KitAddress ka
		ON k.KitId = ka.KitId
	LEFT JOIN Address a
		ON ka.AddressId = a.AddressId
	WHERE TenantId = TenantId
	AND k.KitId = KitId;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS add_kit;

DELIMITER //
CREATE PROCEDURE add_kit(
	IN TenantId BINARY(16),
	IN KitId BINARY(16),
	IN Nickname VARCHAR(255),
	IN KitName VARCHAR(100),
	IN KitDescription VARCHAR(255),
	IN PurchaseDate DATE,
	IN PurchasePrice DECIMAL(10,2),
	IN LiftSpanInYears INT,
	IN EstimatedInsuranceValue DECIMAL(10,2),
	IN EstimatedReplacementDate DATE,
	IN KitCategoryId BINARY(16),
	IN KitConditionId BINARY(16),
	IN Notes VARCHAR(255),
	IN KitCode VARCHAR(255),
	IN KitStatus VARCHAR(255),
	IN AddressId BINARY(16)
)
BEGIN
    INSERT INTO `QApp`.`Kit`(
		`KitId`,
		`TenantId`,
		`Nickname`,
		`KitName`,
		`KitDescription`,
		`PurchaseDate`,
		`PurchasePrice`,
		`LiftSpanInYears`,
		`EstimatedInsuranceValue`,
		`EstimatedReplacementDate`,
		`KitCategoryId`,
		`KitConditionId`,
		`Notes`,
		`KitCode`,
		`KitStatus`
	) VALUES (
		KitId,
		TenantId,
		Nickname,
		KitName,
		KitDescription,
		PurchaseDate,
		PurchasePrice,
		LiftSpanInYears,
		EstimatedInsuranceValue,
		EstimatedReplacementDate,
		KitCategoryId,
		KitConditionId,
		Notes,
		KitCode,
		KitStatus
	);

	DELETE FROM `QApp`.`KitAddress` WHERE KitId = KitId;
	INSERT INTO `KitAddress`(
		`KitId`,
		`AddressId`
	) VALUES (
		KitId,
		AddressId
	);

END;
//
DELIMITER ;
