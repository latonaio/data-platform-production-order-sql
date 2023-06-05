CREATE TABLE `data_platform_production_order_item_component_delivery_schedule_line_data`
(
		`ProductionOrder`                                 int(16) NOT NULL,
     	`ProductionOrderItem`                             int(6) NOT NULL,
        `Operations`                                      int(16) NOT NULL,
		`OperationsItem`                                  int(6) NOT NULL,
		`BillOfMaterial`                                  int(16) NOT NULL,
		`BillOfMaterialItem`                              int(6) NOT NULL,
      	`ScheduleLine`                                    int(6) NOT NULL,
        `SupplyChainRelationshipID`                       int(16) NOT NULL,
        `SupplyChainRelationshipStockConfPlantID`         int(4) NOT NULL,
        `ComponentProduct`                                varchar(40) NOT NULL,
        `StockConfirmationPlantBusinessPartner`           int(12) NOT NULL,
        `StockConfirmationPlant`                          varchar(4) NOT NULL,
        `StockConfirmationPlantTimeZone`                  varchar(3) DEFAULT NULL,
        `ComponentProductBatch`                           varchar(10) DEFAULT NULL,
        `ComponentProductBatchValidityStartDate`          date DEFAULT NULL,
        `ComponentProductBatchValidityEndDate`            date DEFAULT NULL,
        `RequestedDeliveryDate`                           date NOT NULL,
        `RequestedDeliveryTime`                           time NOT NULL,
        `ConfirmedDeliveryDate`                           date NOT NULL,
        `ProductionOrderQuantity`                         float(15) NOT NULL,
        `OriginalOrderQuantityInBaseUnit`                 float(15) NOT NULL,
        `ConfirmedOrderQuantityByPDTAvailCheckInBaseUnit` float(15) NOT NULL,
        `ConfirmedOrderQuantityByPDTAvailCheck`           float(15) NOT NULL,
        `DeliveredQuantityInBaseUnit`                     float(15) DEFAULT NULL,
        `UndeliveredQuantityInBaseUnit`                   float(15) DEFAULT NULL,
        `OpenConfirmedQuantityInBaseUnit`                 float(15) DEFAULT NULL,
        `StockIsFullyConfirmed`                           tinyint(1) DEFAULT NULL,
        `PlusMinusFlag`                                   varchar(1) NOT NULL,
        `ItemScheduleLineDeliveryBlockStatus`             tinyint(1) DEFAULT NULL,
        `IsCancelled`                                     tinyint(1) DEFAULT NULL,
        `IsMarkedForDeletion`                             tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `BillOfMaterial`, `BillOfMaterialItem`, `ScheduleLine`),
	
    CONSTRAINT `DataPlatformProductionOrderItemComponentDeliveryScheduleLineData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `BillOfMaterial`, `BillOfMaterialItem`) REFERENCES `data_platform_production_order_component_data` (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `BillOfMaterial`, `BillOfMaterialItem`),
    CONSTRAINT `DataPlatformProductionOrderItemComponentDeliveryScheduleLineData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `BillOfMaterial`, `BillOfMaterialItem`) REFERENCES `data_platform_production_order_component_data` (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `BillOfMaterial`, `BillOfMaterialItem`),
    CONSTRAINT `DataPlatformProductionOrderItemComponentDeliveryScheduleLineDataComponentProduct_fk`OREIGN KEY (`ComponentProduct`, `StockConfirmationPlantBusinessPartner`, `StockConfirmationPlant`) REFERENCES `data_platform_product_master_bp_plant_data` (`Product`, `BusinessPartner`, `Plant`),
    CONSTRAINT `DataPlatformProductionOrderItemComponentDeliveryScheduleLineDataStockConfirmationPlantTimeZone_fk` FOREIGN KEY (`StockConfirmationPlantTimeZone`) REFERENCES `data_platform_time_zone_time_zone_data` (`TimeZone`),
    CONSTRAINT `DataPlatformProductionOrderItemComponentDeliveryScheduleLineDataComponentProductBatch_fk` FOREIGN KEY (`ComponentProduct`, `StockConfirmationPlantBusinessPartner`, `StockConfirmationPlant`, `ComponentProductBatch`) REFERENCES `data_platform_batch_master_record_batch_data` (`Product`, `BusinessPartner`, `Plant`, `Batch`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
