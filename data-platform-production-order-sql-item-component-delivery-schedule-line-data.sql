-- CREATE TABLE `data_platform_production_order_item_component_delivery_schedule_line_data`
--おそらくテーブル名長い
(
		`ProductionOrder`                                 int(16) NOT NULL,
     	`ProductionOrderItem`                             int(6) NOT NULL,
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
        `ComponentProductBatchValidityStartTime`          time DEFAULT NULL,
        `ComponentProductBatchValidityEndDate`            date DEFAULT NULL,
        `ComponentProductBatchValidityEndDTime`           time DEFAULT NULL,
        `RequestedDeliveryDate`                           date NOT NULL,
        `RequestedDeliveryTime`                           time NOT NULL,
        `ConfirmedDeliveryDate`                           date DEFAULT NULL,
        `ConfirmedDeliveryTime`                           time DEFAULT NULL,
        `OriginalRequiredQuantityInBaseUnit`              float(15) NOT NULL,
        `ConfirmedQuantityByPDTAvailCheckInBaseUnit`      float(15) DEFAULT NULL,
        `OpenConfirmedQuantityInBaseUnit`                 float(15) DEFAULT NULL,
        `DeliveredQuantityInBaseUnit`                     float(15) DEFAULT NULL,
        `UndeliveredQuantityInBaseUnit`                   float(15) DEFAULT NULL,
        `StockIsFullyConfirmed`                           tinyint(1) DEFAULT NULL,
        `PlusMinusFlag`                                   varchar(1) DEFAULT NULL,
        `ItemScheduleLineDeliveryBlockStatus`             tinyint(1) DEFAULT NULL,
		`CreationDate`                                    date NOT NULL,
		`CreationTime`                                    time NOT NULL,
		`LastChangeDate`                                  date NOT NULL,
		`LastChangeTime`                                  time NOT NULL,
    	`IsReleased`                                      tinyint(1) DEFAULT NULL,
    	`IsLocked`                                        tinyint(1) DEFAULT NULL,
    	`IsCancelled`                                     tinyint(1) DEFAULT NULL,
        `IsMarkedForDeletion`                             tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`, `ScheduleLine`),
	
    CONSTRAINT `DPFMProductionOrderItemComponentDeliveryScheduleLineData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`) REFERENCES `data_platform_production_order_component_data` (`ProductionOrder`, `ProductionOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`),
    CONSTRAINT `DPFMProductionOrderItemComponentDeliveryScheduleLineDataComponentProduct_fk` FOREIGN KEY (`ComponentProduct`, `StockConfirmationPlantBusinessPartner`, `StockConfirmationPlant`) REFERENCES `data_platform_product_master_bp_plant_data` (`Product`, `BusinessPartner`, `Plant`),
    CONSTRAINT `DPFMProductionOrderItemComponentDeliveryScheduleLineDataStockConfirmationPlantTimeZone_fk` FOREIGN KEY (`StockConfirmationPlantTimeZone`) REFERENCES `data_platform_time_zone_time_zone_data` (`TimeZone`),
    CONSTRAINT `DPFMProductionOrderItemComponentDeliveryScheduleLineDataComponentProductBatch_fk` FOREIGN KEY (`ComponentProduct`, `StockConfirmationPlantBusinessPartner`, `StockConfirmationPlant`, `ComponentProductBatch`) REFERENCES `data_platform_batch_master_record_batch_data` (`Product`, `BusinessPartner`, `Plant`, `Batch`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
