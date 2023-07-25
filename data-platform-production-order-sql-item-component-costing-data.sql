CREATE TABLE `data_platform_production_order_item_component_costing_data`
(
		`ProductionOrder`                         int(16) NOT NULL,
     	`ProductionOrderItem`                     int(6) NOT NULL,
		`BillOfMaterial`                          int(16) NOT NULL,
		`BillOfMaterialItem`                      int(4) NOT NULL,
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

    PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`),
	
    CONSTRAINT `DPFMProductionOrderItemComponentCostingData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`) REFERENCES `data_platform_production_order_item_component_data` (`ProductionOrder`, `ProductionOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`),
    CONSTRAINT `DPFMProductionOrderItemComponentCostingDataCurrency_fk` FOREIGN KEY (`Currency`) REFERENCES `data_platform_currency_currency_data` (`Currency`)    
    
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
