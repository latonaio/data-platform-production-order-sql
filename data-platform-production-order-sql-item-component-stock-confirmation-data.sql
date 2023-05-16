CREATE TABLE `data_platform_production_order_item_component_stock_confirmation_data`
(
		`ProductionOrder`                         int(16) NOT NULL,
     	`ProductionOrderItem`                     int(6) NOT NULL,
		`Operations`                              int(16) NOT NULL,
		`OperationsItem`                          int(6) NOT NULL,
		`BillOfMaterial`                          int(16) NOT NULL,
		`BillOfMaterialItem`                      int(6) NOT NULL,
        `InventoryStockType`                      varchar(2) DEFAULT NULL,
        `InventorySpecialStockType`               varchar(2) DEFAULT NULL,
        `AvailableProductStock`                   float(15) NOT NULL,
        `IsMarkedForDeletion`                     tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `BillOfMaterial`, `BillOfMaterialItem`),
	
    CONSTRAINT `DataPlatformProductionOrderItemComponentStockConfirmationData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `BillOfMaterial`, `BillOfMaterialItem`) REFERENCES `data_platform_production_order_component_data` (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `BillOfMaterial`, `BillOfMaterialItem`)
    
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
