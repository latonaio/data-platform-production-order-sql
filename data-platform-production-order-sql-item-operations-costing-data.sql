CREATE TABLE `data_platform_production_order_item_operations_costing_data`
(
		`ProductionOrder`                         int(16) NOT NULL,
     	`ProductionOrderItem`                     int(6) NOT NULL,
		`Operations`                              int(16) NOT NULL,
		`OperationsItem`                          int(4) NOT NULL,
        `Currency`                                varchar(3) DEFAULT NULL,
        `CostingAmount`                           float(13) DEFAULT NULL,
        `IsMarkedForDeletion`                     tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`),
	
    CONSTRAINT `DataPlatformProductionOrderItemOperationsCostingData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`) REFERENCES `data_platform_production_order_item_operations_data` (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`),
    CONSTRAINT `DataPlatformProductionOrderItemOperationsCostingDataCurrency_fk` FOREIGN KEY (`Currency`) REFERENCES `data_platform_currency_currency_data` (`Currency`)    
    
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
