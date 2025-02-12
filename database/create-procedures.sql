-- Active: 1735507046328@@127.0.0.1@3306
use QApp;

DROP PROCEDURE IF EXISTS sp_get_kit;

DELIMITER //
CREATE PROCEDURE sp_get_kit(IN TenantId int)
BEGIN
    SELECT * FROM Kit K
	LEFT JOIN KitCategory C 
		ON K.KitCategoryId = C.KitCategoryId
	LEFT JOIN KitCondition KC
		ON K.KitConditionId = KC.KitConditionId
	WHERE K.TenantId = TenantId;
END;
//
DELIMITER ;

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

DROP PROCEDURE IF EXISTS sp_get_all_categories;

DELIMITER //
CREATE PROCEDURE sp_get_all_categories()
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

DROP PROCEDURE IF EXISTS sp_get_all_conditions;

DELIMITER //
CREATE PROCEDURE sp_get_all_conditions()
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