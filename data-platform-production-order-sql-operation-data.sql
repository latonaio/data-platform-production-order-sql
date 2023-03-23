CREATE TABLE `data_platform_production_order_operation_data`
(
		`ProductionOrder`                         int(16) NOT NULL,
		`ProductionOrderItem`                     int(6) NOT NULL,
		`ProductionOrderSequence`                 varchar(4) NOT NULL,
		`ProductionOrderOperation`                varchar(4) NOT NULL,
		`OrderInternalBillOfOperations`           varchar(4) NOT NULL,
        `OrderIntBillOfOperationsItem`            int(6) NOT NULL,
		`ProductionOrderSequenceText`             varchar(200) DEFAULT NULL,
		`ProductionOrderOperationText`            varchar(200) DEFAULT NULL,
        `OperationIsReleased`                     tinyint(1) DEFAULT NULL,
        `OperationIsPartiallyConfirmed`           tinyint(1) DEFAULT NULL,
        `OperationIsConfirmed`                    tinyint(1) DEFAULT NULL,
        `OperationIsClosed`                       tinyint(1) DEFAULT NULL,
        `OperationIsMarkedForDeletion`            tinyint(1) DEFAULT NULL,
		`ProductionPlant`                         varchar(4) DEFAULT NULL,
		`WorkCenter`                              int(16) DEFAULT NULL,
		`OperationErlstSchedldExecStrtDte`        date DEFAULT NULL,
   		`OperationErlstSchedldExecStrtTme`        time DEFAULT NULL,
		`OperationErlstSchedldExecEndDte`         date DEFAULT NULL,
   		`OperationErlstSchedldExecEndTme`         time DEFAULT NULL,
		`OperationActualExecutionStartDate`       date DEFAULT NULL,
   		`OperationActualExecutionStartTime`       time DEFAULT NULL,
		`OperationActualExecutionEndDate`         date DEFAULT NULL,
   		`OperationActualExecutionEndTime`         time DEFAULT NULL,
		`ErlstSchedldExecDurnInWorkdays`          varchar(4) DEFAULT NULL,
		`OperationActualExecutionDays`            varchar(4) DEFAULT NULL,
		`OperationUnit`                           varchar(3) DEFAULT NULL,
		`OperationPlannedTotalQuantity`           float(15) DEFAULT NULL,
		`OperationTotalConfirmedYieldQuantity`    float(15) DEFAULT NULL,
  
    PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`, `ProductionOrderSequence`, `ProductionOrderOperation`, `OrderInternalBillOfOperations`, `OrderIntBillOfOperationsItem`),
	
    CONSTRAINT `DataPlatformProductionOrderOperationData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`) REFERENCES `data_platform_production_order_item_data` (`ProductionOrder`, `ProductionOrderItem`),
    CONSTRAINT `DataPlatformProductionOrderOperationDataComponentProductionPlant_fk` FOREIGN KEY (`ProductionPlant`) REFERENCES `data_platform_plant_general_data` (`Plant`),
    CONSTRAINT `DataPlatformProductionOrderOperationDataComponentProductionWorkCenter_fk` FOREIGN KEY (`WorkCenter`) REFERENCES `data_platform_work_center_header_data` (`WorkCenter`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
