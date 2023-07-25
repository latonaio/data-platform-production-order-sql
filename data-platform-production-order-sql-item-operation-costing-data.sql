CREATE TABLE `data_platform_production_order_item_operation_costing_data`
(
		`ProductionOrder`                         int(16) NOT NULL,
     	`ProductionOrderItem`                     int(6) NOT NULL,
		`Operations`                              int(16) NOT NULL,
		`OperationsItem`                          int(6) NOT NULL,
		`OperationID`                             int(4) NOT NULL,
        `Currency`                                varchar(3) NOT NULL,
        `CostingAmount`                           float(13) NOT NULL,
		`CreationDate`                            date NOT NULL,
		`CreationTime`                            time NOT NULL,
		`LastChangeDate`                          date NOT NULL,
		`LastChangeTime`                          time NOT NULL,
    	`IsReleased`                              tinyint(1) DEFAULT NULL,
    	`IsLocked`                                tinyint(1) DEFAULT NULL,
    	`IsCancelled`                             tinyint(1) DEFAULT NULL,
        `IsMarkedForDeletion`                     tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `OperationID`),
	
    CONSTRAINT `DPFMProductionOrderItemOperationCostingData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `OperationID`) REFERENCES `data_platform_production_order_item_operation_data` (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `OperationID`),
    CONSTRAINT `DPFMProductionOrderItemOperationCostingDataCurrency_fk` FOREIGN KEY (`Currency`) REFERENCES `data_platform_currency_currency_data` (`Currency`)    
    
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
