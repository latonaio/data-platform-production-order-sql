CREATE TABLE `data_platform_production_order_item_data`
(
		`ProductionOrder`                         int(16) NOT NULL,
    	`ProductionOrderItem`                     int(6) NOT NULL,
		`CreationDate`                            date NOT NULL,
		`LastChangeDate`                          date NOT NULL,
    	`ItemIsReleased`               		  	  tinyint(1) DEFAULT NULL,
    	`ItemIsPartiallyConfirmed`                tinyint(1) DEFAULT NULL,
    	`ItemIsConfirmed`                         tinyint(1) DEFAULT NULL,
    	`ItemIsLocked`                            tinyint(1) DEFAULT NULL,
    	`ItemIsMarkedForDeletion`                 tinyint(1) DEFAULT NULL,
    	`ProductionOrderHasGeneratedOperations`   tinyint(1) DEFAULT NULL,
    	`ProductAvailabilityIsNotChecked`         tinyint(1) DEFAULT NULL,
        `PrecedingItem`                           int(6) DEFAULT NULL,
      　`FollowingItem`                           int(6) DEFAULT NULL,
		`Product`                                 varchar(40) DEFAULT NULL,
		`ProductionPlant`                         varchar(4) NOT NULL,
		`ProductionPlantBusinessPartner`          int(12) NOT NULL,
		`ProductionPlantStorageLocation`          varchar(4) DEFAULT NULL,
        `MRPArea`                                 varchar(10) DEFAULT NULL,
        `MRPController`                           varchar(3) DEFAULT NULL,
        `ProductionSupervisor`                    varchar(100) DEFAULT NULL,
        `ProductionVersion`                       int(16) DEFAULT NULL,
		`PlannedOrder`                            int(16) DEFAULT NULL,
		`OrderID`                                 int(16) DEFAULT NULL,
		`OrderItem`                               int(6) DEFAULT NULL,
      　`MinimumLotSizeQuantity`                  float(15) DEFAULT NULL,
        `StandardLotSizeQuantity`                 float(15) DEFAULT NULL,
        `LotSizeRoundingQuantity`                 float(15) DEFAULT NULL,
        `MaximumLotSizeQuantity`                  float(15) DEFAULT NULL,
        `LotSizeIsFixed`                          tinyint(1) DEFAULT NULL,
		`ProductionOrderPlannedStartDate`         date DEFAULT NULL,
		`ProductionOrderPlannedStartTime`         time DEFAULT NULL,
		`ProductionOrderPlannedEndDate`           date DEFAULT NULL,
		`ProductionOrderPlannedEndTime`           time DEFAULT NULL,
		`ProductionOrderActualReleaseDate`        date DEFAULT NULL,
		`ProductionOrderActualReleaseTime`        time DEFAULT NULL,
		`ProductionOrderActualStartDate`          date DEFAULT NULL,
		`ProductionOrderActualStartTime`          time DEFAULT NULL,
		`ProductionOrderActualEndDate`            date DEFAULT NULL,
		`ProductionOrderActualEndTime`            time DEFAULT NULL,
        `ProductionUnit`                          varchar(3) DEFAULT NULL,
        `TotalQuantity`                           float(15) NOT NULL,
        `PlannedScrapQuantity`                    float(15) DEFAULT NULL,
        `ConfirmedYieldQuantity`                  float(15) DEFAULT NULL,
        `ProductionOrderItemText`                 varchar(200) DEFAULT NULL,

    PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`),
	
    CONSTRAINT `DataPlatformProductionOrderItemData_fk` FOREIGN KEY (`ProductionOrder`) REFERENCES `data_platform_production_order_header_data` (`ProductionOrder`),
    CONSTRAINT `DataPlatformProductionOrderItemDataProduct_fk` FOREIGN KEY (`Product`) REFERENCES `data_platform_product_master_general_data` (`Product`),
    CONSTRAINT `DataPlatformProductionOrderHeaderDataProductionPlant_fk` FOREIGN KEY (`ProductionPlant`) REFERENCES `data_platform_plant_general_data` (`Plant`),
    CONSTRAINT `DataPlatformProductionOrderHeaderDataProductionStorageLocation_fk` FOREIGN KEY (`ProductionPlantBusinessPartner`, `ProductionPlant`, `StorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
    CONSTRAINT `DataPlatformProductionOrderHeaderDataProductionPlannedOrder_fk` FOREIGN KEY (`PlannedOrder`) REFERENCES `data_platform_planned_order_header_data` (`PlannedOrder`),
    CONSTRAINT `DataPlatformProductionOrderHeaderDataProductionOrder_fk` FOREIGN KEY (`OrderID`, `OrderItem`) REFERENCES `data_platform_orders_item_data` (`OrderID`, `OrderItem`),
    
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
