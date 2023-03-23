# data-platform-production-order-sql

data-platform-production-order-sql は、データ連携基盤において、製造指図データを維持管理するSQLテーブルを作成するためのレポジトリです。 

## 前提条件  
data-platform-production-order-sql は、データ連携にあたり、API を利用し、本レポジトリ の sql 設定ファイルの内容は、下記 URL の API 仕様を前提としています。  
https://api.XXXXXXXX.com/api/OP_API_XXXXXXX_XXX/overview  

## sqlの設定ファイル

data-platform-production-order-sql には、sqlの設定ファイルとして、以下のファイルが含まれています。  

* data-platform-production-order-sql-header-data.sql（データ連携基盤 製造指図 - ヘッダデータ）
* data-platform-production-order-sql-header-doc-data.sql（データ連携基盤 設備マスタ - 基本文書データ）
* data-platform-production-order-sql-item-data.sql（データ連携基盤 設備マスタ - 明細データ）
* data-platform-production-order-sql-component-data.sql（データ連携基盤 製造指図 - 構成品目データ）
* data-platform-production-order-sql-component-stock-confirmation-data.sql（データ連携基盤 製造指図 - 構成品目在庫確認データ）
* data-platform-production-order-sql-component-costing-data.sql（データ連携基盤 製造指図 - 構成品目原価計算データ）
* data-platform-production-order-sql-operation-data.sql（データ連携基盤 製造指図 - 作業データ）

## MySQLのセットアップ / Kubernetesの設定 / SQLテーブルの作成方法

MySQLのセットアップ / Kubernetesの設定 / 具体的なSQLテーブルの作成方法、については、[mysql-kube](https://github.com/latonaio/mysql-kube)を参照ください。
