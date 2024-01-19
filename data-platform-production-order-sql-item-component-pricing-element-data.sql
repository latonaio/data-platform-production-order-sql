CREATE TABLE `data_platform_production_order_item_component_pricing_element_data`
(
  `ProductionOrder`             int(16) NOT NULL,
  `ProductionOrderItem`         int(6) NOT NULL,
  `BillOfMaterial`              int(16) NOT NULL,
  `BillOfMaterialItem`          int(6) NOT NULL,
  `PricingProcedureCounter`     int(3) NOT NULL,
  `SupplyChainRelationshipID`   int(16) NOT NULL,
  `ComponentProductBuyer`       int(12) NOT NULL,
  `ComponentProductSeller`      int(12) NOT NULL,
  `ConditionRecord`             int(12) NOT NULL,
  `ConditionSequentialNumber`   int(2) NOT NULL,
  `ConditionType`               varchar(4) NOT NULL,
  `PricingDate`                 date NOT NULL,
  `ConditionRateValue`          float(13) NOT NULL,
  `ConditionRateValueUnit`      int(6) NOT NULL,
  `ConditionScaleQuantity`      int(13) NOT NULL,
  `ConditionCurrency`           varchar(5) NOT NULL,
  `ConditionQuantity`           float(15) NOT NULL,
  `TaxCode`                     varchar(1) DEFAULT NULL,
  `ConditionAmount`             float(13) NOT NULL,
  `TransactionCurrency`         varchar(5) NOT NULL,
  `ConditionIsManuallyChanged`  tinyint(1) DEFAULT NULL,
  `CreationDate`                date NOT NULL,
  `CreationTime`                time NOT NULL,
  `LastChangeDate`              date NOT NULL,
  `LastChangeTime`              time NOT NULL,
  `IsReleased`                  tinyint(1) DEFAULT NULL,
  `IsLocked`                    tinyint(1) DEFAULT NULL,
  `IsCancelled`                 tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`         tinyint(1) DEFAULT NULL,
  
  PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`, `PricingProcedureCounter`),
    
  CONSTRAINT `DPFMProductionOrderItemComponentPricingElementData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`) REFERENCES `data_platform_production_order_item_component_data` (`ProductionOrder`, `ProductionOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`),
  CONSTRAINT `DPFMProductionOrderItemComponentPricingElementDataSCRID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `ComponentProductBuyer`, `ComponentProductSeller`) REFERENCES `data_platform_scr_general_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`)
  
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
