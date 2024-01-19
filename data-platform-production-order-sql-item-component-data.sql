CREATE TABLE `data_platform_production_order_item_component_data`
(
    `ProductionOrder`                                  int(16) NOT NULL,
    `ProductionOrderItem`                              int(6) NOT NULL,
    `BillOfMaterial`                                   int(16) NOT NULL,
    `BillOfMaterialItem`                               int(6) NOT NULL,
    `SupplyChainRelationshipID`                        int(16) NOT NULL,
    `SupplyChainRelationshipDeliveryID`                int(6) NOT NULL,
    `SupplyChainRelationshipDeliveryPlantID`           int(4) NOT NULL,
    `SupplyChainRelationshipStockConfPlantID`          int(4) NOT NULL,
    `ProductionPlantBusinessPartner`                   int(12) NOT NULL,
    `ProductionPlant`                                  varchar(4) NOT NULL,
    `MRPArea`                                          varchar(10) DEFAULT NULL,
    `MRPController`                                    varchar(3) DEFAULT NULL,
    `ProductionVersion`                                int(16) DEFAULT NULL,
    `ProductionVersionItem`                            int(6) DEFAULT NULL,
    `ComponentProduct`                                 varchar(40) NOT NULL,
    `ComponentProductBuyer`                            int(12) NOT NULL,
    `ComponentProductSeller`                           int(12) NOT NULL,
    `ComponentProductDeliverToParty`                   int(12) NOT NULL,
    `ComponentProductDeliverToPlant`                   varchar(4) NOT NULL,
    `ComponentProductDeliverFromParty`                 int(12) NOT NULL,
    `ComponentProductDeliverFromPlant`                 varchar(4) NOT NULL,
    `ComponentProductBaseUnit`                         varchar(3) NOT NULL,
    `ComponentProductDeliveryUnit`                     varchar(3) NOT NULL,
    `ComponentProductRequirementDate`                  date NOT NULL,
    `ComponentProductRequirementTime`                  time NOT NULL,
    `ComponentProductRequiredQuantityInBaseUnit`       float(15) NOT NULL,
    `ComponentProductRequiredQuantityInDeliveryUnit`   float(15) NOT NULL,
    `ComponentProductPlannedScrapInPercent`            float(7) DEFAULT NULL,
    `ComponentProductIsMarkedForBackflush`             tinyint(1) DEFAULT NULL,
    `StockConfirmationBusinessPartner`                 int(12) NOT NULL,
    `StockConfirmationPlant`                           varchar(4) NOT NULL,
    `StockConfirmationPlantStorageLocation`            varchar(4) NOT NULL,
    `PlannedOrder`                                     int(16) DEFAULT NULL,
    `PlannedOrderItem`                                 int(6) DEFAULT NULL,
    `BillOfMaterialItemText`                           varchar(200) DEFAULT NULL,
    `ComponentProductBatch`                            varchar(10) DEFAULT NULL,
    `ComponentProductBatchValidityStartDate`           date DEFAULT NULL,
    `ComponentProductBatchValidityStartTime`           time DEFAULT NULL,
    `ComponentProductBatchValidityEndDate`             date DEFAULT NULL,
    `ComponentProductBatchValidityEndTime`             time DEFAULT NULL,
    `ComponentProductCostingPolicy`                    varchar(1) DEFAULT NULL,
    `ComponentProductPriceUnitQuantity`                int(11) DEFAULT NULL,
    `ComponentProductStandardPrice`                    float(13) DEFAULT NULL,
    `ComponentProductMovingAveragePrice`               float(13) DEFAULT NULL,
    `ComponentProductWithdrawnQuantity`                float(15) DEFAULT NULL,
    `CreationDate`                                     date NOT NULL,
    `CreationTime`                                     time NOT NULL,
    `LastChangeDate`                                   date NOT NULL,
    `LastChangeTime`                                   time NOT NULL,
    `ComponentProductAvailabilityIsNotChecked`         tinyint(1) DEFAULT NULL,
    `IsReleased`                                       tinyint(1) DEFAULT NULL,
    `IsLocked`                                         tinyint(1) DEFAULT NULL,
    `IsCancelled`                                      tinyint(1) DEFAULT NULL,
    `IsMarkedForDeletion`                              tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`),

    CONSTRAINT `DPFMProductionOrderItemComponentData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`) REFERENCES `data_platform_production_order_item_data` (`ProductionOrder`, `ProductionOrderItem`),
    CONSTRAINT `DPFMProductionOrderItemComponentDataOperations_fk` FOREIGN KEY (`Operations`, `OperationsItem`) REFERENCES `data_platform_operations_item_data` (`Operations`, `OperationsItem`),
    CONSTRAINT `DPFMProductionOrderItemComponentDataBillOfMaterial_fk` FOREIGN KEY (`BillOfMaterial`, `BillOfMaterialItem`) REFERENCES `data_platform_bill_of_material_item_data` (`BillOfMaterial`, `BillOfMaterialItem`),
    CONSTRAINT `DPFMProductionOrderItemComponentDataPlant_fk` FOREIGN KEY (`ComponentProduct`, `ProductionPlantBusinessPartner`, `ProductionPlant`) REFERENCES `data_platform_product_master_bp_plant_data` (`Product`, `BusinessPartner`, `Plant`),
--     CONSTRAINT `DPFMProductionOrderItemComponentDataProductionVersion_fk` FOREIGN KEY (`ProductionVersion`, `ProductionVersionItem`) REFERENCES `data_platform_production_version_item_data` (`ProductionVersion`, `ProductionVersionItem`),
    CONSTRAINT `DPFMProductionOrderItemComponentDataStockConfirmationPlant_fk` FOREIGN KEY (`ComponentProduct`, `StockConfirmationBusinessPartner`, `StockConfirmationPlant`) REFERENCES `data_platform_product_master_bp_plant_data` (`Product`, `BusinessPartner`, `Plant`),
    CONSTRAINT `DPFMProductionOrderItemComponentDataPlannedOrder_fk` FOREIGN KEY (`PlannedOrder`, `PlannedOrderItem`) REFERENCES `data_platform_planned_order_item_data` (`PlannedOrder`, `PlannedOrderItem`),
    CONSTRAINT `DPFMProductionOrderItemComponentDataOrderItem_fk` FOREIGN KEY (`OrderID`, `OrderItem`) REFERENCES `data_platform_orders_item_data` (`OrderID`, `OrderItem`),
    CONSTRAINT `DPFMProductionOrderItemComponentDataProductionPlantStorageLoc_fk` FOREIGN KEY (`ProductionPlantBusinessPartner`, `ProductionPlant`, `ProductionPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
    CONSTRAINT `DPFMProductionOrderItemComponentDataStockConfPlantStorageLoc_fk` FOREIGN KEY (`StockConfirmationBusinessPartner`, `StockConfirmationPlant`, `StockConfirmationPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
    CONSTRAINT `DPFMProductionOrderItemComponentDataComponentBatch_fk` FOREIGN KEY (`ComponentProduct`, `StockConfirmationBusinessPartner`, `StockConfirmationPlant`, `ComponentProductBatch`) REFERENCES `data_platform_batch_master_record_batch_data` (`Product`, `BusinessPartner`, `Plant`, `Batch`),
    CONSTRAINT `DPFMProductionOrderItemComponentDataComponentBaseUnit_fk` FOREIGN KEY (`ComponentProductBaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMProductionOrderItemComponentDataComponentDeliveryUnit_fk` FOREIGN KEY (`ComponentProductDeliveryUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
