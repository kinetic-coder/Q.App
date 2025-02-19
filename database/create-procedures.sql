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


DROP PROCEDURE IF EXISTS sp_add_kit;

DELIMITER //
CREATE PROCEDURE sp_add_kit(
    IN TenantId int, 
    IN Nickname VARCHAR(255), 
    IN KitName VARCHAR(100), 
    IN KitDescription VARCHAR(255),
    IN PurchaseDate DATE,
    IN PurchasePrice DECIMAL(10,2), 
    IN LiftSpanInYears INT, 
    IN EstimatedInsuranceValue DECIMAL(10,2), 
    IN EstimatedReplacementDate DATE, 
    IN KitCategory VARCHAR(255), 
    IN KitCondition VARCHAR(255), 
    IN Notes VARCHAR(255),
    IN KitCode VARCHAR(255)
)
BEGIN
    DECLARE kit_category_id INT DEFAULT 0;
    DECLARE kit_condition_id INT DEFAULT 0;
    
    SELECT KitCategoryId INTO kit_category_id FROM KitCategory WHERE lcase(trim(CategoryName)) = lcase(trim(KitCategory));
    SELECT KitConditionId INTO kit_condition_id FROM KitCondition WHERE lcase(trim(ConditionName)) = lcase(trim(KitCondition));
    
    INSERT INTO Kit (TenantId, Nickname, KitName, KitDescription, PurchaseDate, PurchasePrice, LiftSpanInYears, EstimatedInsuranceValue, EstimatedReplacementDate, KitCategoryId, KitConditionId, Notes, KitCode)
    VALUES (TenantId, Nickname, KitName, KitDescription, PurchaseDate, PurchasePrice, LiftSpanInYears, EstimatedInsuranceValue, EstimatedReplacementDate, kit_category_id, kit_condition_id, Notes, KitCode);
    
END;
//
DELIMITER ;