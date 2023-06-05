CREATE TABLE `data_platform_production_order_item_component_costing_data`
(
		`ProductionOrder`                         int(16) NOT NULL,
     	`ProductionOrderItem`                     int(6) NOT NULL,
		`Operations`                              int(16) NOT NULL,
		`OperationsItem`                          int(4) NOT NULL,
		`BillOfMaterial`                          int(16) NOT NULL,
		`BillOfMaterialItem`                      int(4) NOT NULL,
        `ComponentProduct`                        varchar(40) NOT NULL,
        `Currency`                                varchar(3) DEFAULT NULL,
        `CostingAmount`                           float(13) DEFAULT NULL,
        `IsCancelled`                             tinyint(1) DEFAULT NULL,
        `IsMarkedForDeletion`                     tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`),
	
    CONSTRAINT `DataPlatformProductionOrderItemComponentCostingData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `BillOfMaterial`, `BillOfMaterialItem`) REFERENCES `data_platform_production_order_component_data` (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `BillOfMaterial`, `BillOfMaterialItem`),
    CONSTRAINT `DataPlatformProductionOrderItemComponentCostingDataCurrency_fk` FOREIGN KEY (`Currency`) REFERENCES `data_platform_currency_currency_data` (`Currency`)    
    
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
