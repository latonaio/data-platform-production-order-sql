CREATE TABLE `data_platform_production_order_item_operations_data`
(
		`ProductionOrder`                         int(16) NOT NULL,
		`ProductionOrderItem`                     int(6) NOT NULL,
		`Operations`  		                      int(16) NOT NULL,
        `OperationsItem`	                      int(6) NOT NULL,
        `Sequence`			                      int(4) NOT NULL,
		`OperationsText`           			      varchar(200) DEFAULT NULL,
		`SequenceText`				              varchar(200) DEFAULT NULL,
        `OperationIsReleased`                     tinyint(1) DEFAULT NULL,
        `OperationIsPartiallyConfirmed`           tinyint(1) DEFAULT NULL,
        `OperationIsConfirmed`                    tinyint(1) DEFAULT NULL,
        `OperationIsClosed`                       tinyint(1) DEFAULT NULL,
        `OperationIsMarkedForDeletion`            tinyint(1) DEFAULT NULL,
		`ProductionPlant`                         varchar(4) DEFAULT NULL,
		`WorkCenter`                              int(16) DEFAULT NULL,
		`OperationErlstSchedldExecStrtDte`        date DEFAULT NULL,
   		`OperationErlstSchedldExecStrtTme`        time DEFAULT NULL,
		`OperationErlstSchedldExecEndDate`         date DEFAULT NULL,
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
  
    PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`),
	
    CONSTRAINT `DataPlatformProductionOrderItemOperationsData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`) REFERENCES `data_platform_production_order_item_data` (`ProductionOrder`, `ProductionOrderItem`),
    CONSTRAINT `DataPlatformProductionOrderItemOperationsDataComponentProductionPlant_fk` FOREIGN KEY (`ProductionPlant`) REFERENCES `data_platform_plant_general_data` (`Plant`),
    CONSTRAINT `DataPlatformProductionOrderItemOperationsDataComponentProductionWorkCenter_fk` FOREIGN KEY (`WorkCenter`) REFERENCES `data_platform_work_center_header_data` (`WorkCenter`)
	
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
