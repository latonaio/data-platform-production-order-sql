CREATE TABLE `data_platform_production_order_component_stock_confirmation_data`
(
		`ProductionOrder`                         int(16) NOT NULL,
     	`ProductionOrderItem`                     int(6) NOT NULL,
		`ProductionOrderSequence`                 varchar(4) NOT NULL,
		`ProductionOrderOperation`                varchar(4) NOT NULL,
		`OrderInternalBillOfOperations`           varchar(4) NOT NULL,
        `ComponentProduct`                        varchar(40) NOT NULL,
    	`ComponentProductRequirementDate`         date DEFAULT NULL,     
    	`ComponentProductRequirementTime`         time DEFAULT NULL, 
        `InventoryStockType`                      varchar(2) DEFAULT NULL,
        `InventorySpecialStockType`               varchar(2) DEFAULT NULL,
        `AvailableProductStock`                   float(15) NOT NULL,
        `IsMarkedForDeletion`                     tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`, `ProductionOrderSequence`, `ProductionOrderOperation`, `OrderInternalBillOfOperations`, `ComponentProduct`),
	
    CONSTRAINT `DataPlatformProductionOrderComponentStockConfirmationData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`) REFERENCES `data_platform_production_order_item_data` (`ProductionOrder`, `ProductionOrderItem`),
    CONSTRAINT `DataPlatformProductionOrderComponentStockConfirmationDataComponentProduct_fk` FOREIGN KEY (`ComponentProduct`) REFERENCES `data_platform_product_master_general_data` (`Product`),

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;