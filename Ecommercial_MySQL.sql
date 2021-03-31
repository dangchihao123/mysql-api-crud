/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     22/03/21 4:11:38 PM                          */
/*==============================================================*/

use abc;

/*drop table if exists BRANCH;

drop table if exists BRANCH_PRODUCT_UNIT;

drop table if exists BUY;

drop table if exists BUY_CONTRACT;

drop table if exists BUY_CONTRACT_DETAIL;

drop table if exists BUY_DETAIL;

drop table if exists CATEGORY;

drop table if exists IMPORT;

drop table if exists IMPORT_DETAIL;

drop table if exists OWNER;

drop table if exists PAYMENT;

drop table if exists PRODUCT;

drop table if exists PRODUCT_DETAIL;

drop table if exists REASON;

drop table if exists ROLE;

drop table if exists STATUS;

drop table if exists STORE;

drop table if exists SUPPLIER;

drop table if exists SUPPLIER_BRANCH;

drop table if exists TYPE;

drop table if exists UNIT;

drop table if exists USER;

drop table if exists USER_ROLE;

drop table if exists USER_STATUS;
*/

/*==============================================================*/
/* Table: BRANCH                                                */
/*==============================================================*/
create table BRANCH
(
   ID_BRANCH            int(10) not null auto_increment,
   ID_TYPE              int(10) not null,
   ID_OWNER             int(10) not null,
   NAME_BRANCH          national varchar(100),
   ADDRESS_BRANCH       national varchar(100),
   TEL_BRANCH           numeric(8,0),
   LOGO_BRANCH          longblob,
   primary key (ID_BRANCH)
);

/*==============================================================*/
/* Table: BRANCH_PRODUCT_UNIT                                   */
/*==============================================================*/
create table BRANCH_PRODUCT_UNIT
(
   ID_BRANCH_PRODUCT_UNIT int(15) not null auto_increment,
   ID_UNIT              int(10) not null,
   ID_PRODUCT           int(15) not null,
   ID_BRANCH            int(10) not null,
   SPECIFICATION_BRANCH_PRODUCT_UNIT numeric(8,0),
   CHILD_ID_UNIT        numeric(8,0),
   PRICE_BUY_REF_BRANCH_PRODUCT_UNIT float,
   PRICE_SELL_REF_BRANCH_PRODUCT_UNIT float,
   primary key (ID_BRANCH_PRODUCT_UNIT)
);

/*==============================================================*/
/* Table: BUY                                                   */
/*==============================================================*/
create table BUY
(
   ID_BUY               int(15) not null auto_increment,
   ID_SUPPLIER          int(15) not null,
   ID_USER              int(15) not null,
   ID_BUY_CONTRACT      int(15) not null,
   DATE_BUY             date,
   VAT_BUY              float,
   NOTE_BUY             national varchar(255),
   primary key (ID_BUY)
);

/*==============================================================*/
/* Table: BUY_CONTRACT                                          */
/*==============================================================*/
create table BUY_CONTRACT
(
   ID_BUY_CONTRACT      int(15) not null auto_increment,
   ID_USER              int(15),
   ID_SUPPLIER          int(15) not null,
   DATE_BUY_CONTRACT    datetime,
   VAT_BUY_CONTRACT     float,
   NOTE_BUY_CONTRACT    national varchar(255),
   primary key (ID_BUY_CONTRACT)
);

/*==============================================================*/
/* Table: BUY_CONTRACT_DETAIL                                   */
/*==============================================================*/
create table BUY_CONTRACT_DETAIL
(
   ID_BUY_CONTRACT_DETAIL int(15) not null auto_increment,
   ID_BUY_CONTRACT      int(15) not null,
   ID_BRANCH_PRODUCT_UNIT int(15) not null,
   AMOUNT_BUY_CONTRACT_DETAIL float,
   PRICE_BUY_CONTRACT_DETAIL float,
   primary key (ID_BUY_CONTRACT_DETAIL)
);

/*==============================================================*/
/* Table: BUY_DETAIL                                            */
/*==============================================================*/
create table BUY_DETAIL
(
   ID_BUY_DETAIL        int(15) not null auto_increment,
   ID_BRANCH_PRODUCT_UNIT int(15) not null,
   ID_BUY               int(15) not null,
   AMOUNT_BUY_DETAIL    float,
   PRICE_BUY_DETAIL     float,
   EXPIRY_DATE_BUY_DETAIL date,
   MANUFACTURE_DATE_BUY_DETAIL date,
   primary key (ID_BUY_DETAIL)
);

/*==============================================================*/
/* Table: CATEGORY                                              */
/*==============================================================*/
create table CATEGORY
(
   ID_CATEGORY          int(10) not null auto_increment,
   NAME_CATEGORY        national varchar(100),
   primary key (ID_CATEGORY)
);

/*==============================================================*/
/* Table: IMPORT                                                */
/*==============================================================*/
create table IMPORT
(
   ID_IMPORT            int(15) not null auto_increment,
   ID_BUY               int(15) not null,
   DATE_IMPORT          datetime,
   NOTE_IMPORT          national varchar(255),
   primary key (ID_IMPORT)
);

/*==============================================================*/
/* Table: IMPORT_DETAIL                                         */
/*==============================================================*/
create table IMPORT_DETAIL
(
   ID_IMPORT_DETAIL     int(15) not null auto_increment,
   ID_IMPORT            int(15) not null,
   ID_PRODUCT_DETAIL    int(15),
   ID_STORE             int(10) not null,
   primary key (ID_IMPORT_DETAIL)
);

/*==============================================================*/
/* Table: OWNER                                                 */
/*==============================================================*/
create table OWNER
(
   ID_OWNER             int(10) not null auto_increment,
   NAME_OWNER           national varchar(100),
   primary key (ID_OWNER)
);

/*==============================================================*/
/* Table: PAYMENT                                               */
/*==============================================================*/
create table PAYMENT
(
   ID_PAYMENT           int(15) not null auto_increment,
   ID_SUPPLIER          int(15) not null,
   ID_USER              int(15) not null,
   ID_BUY               int(15) not null,
   ID_REASON            int(10) not null,
   DATE_PAYMENT         datetime,
   MONEY_PAYMENT        float,
   NOTE_PAYMENT         national varchar(255),
   primary key (ID_PAYMENT)
);

/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
create table PRODUCT
(
   ID_PRODUCT           int(15) not null auto_increment,
   ID_CATEGORY          int(10) not null,
   CODE_PRODUCT         national varchar(100),
   NAME_PRODUCT         national varchar(100),
   primary key (ID_PRODUCT)
);

/*==============================================================*/
/* Table: PRODUCT_DETAIL                                        */
/*==============================================================*/
create table PRODUCT_DETAIL
(
   ID_PRODUCT_DETAIL    int(15) not null auto_increment,
   ID_IMPORT_DETAIL     int(15) not null,
   ID_PRODUCT           int(15) not null,
   BARCODE_PRODUCT_DETAIL varchar(10),
   SERIAL_PRODUCT_DETAIL varchar(10),
   WARRANTY_FROM_PRODUCT_DETAIL date,
   WARRANTY_TO_PRODUCT_DETAIL date,
   primary key (ID_PRODUCT_DETAIL)
);

/*==============================================================*/
/* Table: REASON                                                */
/*==============================================================*/
create table REASON
(
   ID_REASON            int(10) not null auto_increment,
   NAME_REASON          national varchar(100),
   primary key (ID_REASON)
);

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE
(
   ID_ROLE              int(10) not null auto_increment,
   NAME_ROLE            national varchar(100),
   primary key (ID_ROLE)
);

/*==============================================================*/
/* Table: STATUS                                                */
/*==============================================================*/
create table STATUS
(
   ID_STATUS            int(10) not null auto_increment,
   NAME_STATUS          national varchar(100),
   primary key (ID_STATUS)
);

/*==============================================================*/
/* Table: STORE                                                 */
/*==============================================================*/
create table STORE
(
   ID_STORE             int(10) not null auto_increment,
   ID_BRANCH            int(10) not null,
   STO_ID_STORE         int(10),
   NAME_STORE           national varchar(100),
   ADDRESS_STORE        national varchar(100),
   TEL_STORE            numeric(8,0),
   primary key (ID_STORE)
);

/*==============================================================*/
/* Table: SUPPLIER                                              */
/*==============================================================*/
create table SUPPLIER
(
   ID_SUPPLIER          int(15) not null auto_increment,
   ID_TYPE              int(10) not null,
   NAME_SUPPLIER        national varchar(100),
   ADDRESS_SUPPLIER     national varchar(100),
   TEL_SUPPLIER         numeric(8,0),
   EMAIL_SUPPLIER       national varchar(100),
   primary key (ID_SUPPLIER)
);

/*==============================================================*/
/* Table: SUPPLIER_BRANCH                                       */
/*==============================================================*/
create table SUPPLIER_BRANCH
(
   ID_SUPPLIER_BRANCH   int(15) not null auto_increment,
   ID_BRANCH            int(10),
   ID_SUPPLIER          int(15) not null,
   primary key (ID_SUPPLIER_BRANCH)
);

/*==============================================================*/
/* Table: TYPE                                                  */
/*==============================================================*/
create table TYPE
(
   ID_TYPE              int(10) not null auto_increment,
   NAME_TYPE            national varchar(100),
   primary key (ID_TYPE)
);

/*==============================================================*/
/* Table: UNIT                                                  */
/*==============================================================*/
create table UNIT
(
   ID_UNIT              int(10) not null auto_increment,
   NAME_UNIT            national varchar(100),
   primary key (ID_UNIT)
);

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
create table USER
(
   ID_USER              int(15) not null auto_increment,
   ID_BRANCH            int(10) not null,
   NAME_USER            national varchar(100),
   PASSWORD_USER        national varchar(100),
   ADDRESS_USER         national varchar(100),
   TEL_USER             numeric(8,0),
   EMAIL_USER           national varchar(100),
   primary key (ID_USER)
);

/*==============================================================*/
/* Table: USER_ROLE                                             */
/*==============================================================*/
create table USER_ROLE
(
   ID_USER_ROLE         int(15) not null auto_increment,
   ID_ROLE              int(10) not null,
   ID_USER              int(15) not null,
   TIME_START_USER_ROLE datetime,
   TIME_END_USER_ROLE   datetime,
   primary key (ID_USER_ROLE)
);

/*==============================================================*/
/* Table: USER_STATUS                                           */
/*==============================================================*/
create table USER_STATUS
(
   IDUSER_ROLE2         int(15) not null auto_increment,
   ID_USER              int(15) not null,
   ID_STATUS            int(10) not null,
   TIME_START_USER_STATUS datetime,
   TIME_END_USER_STATUS datetime,
   primary key (IDUSER_ROLE2)
);

alter table BRANCH add constraint FK_RELATIONSHIP_28 foreign key (ID_OWNER)
      references OWNER (ID_OWNER) on delete restrict on update restrict;

/*alter table BRANCH add constraint FK_RELATIONSHIP_40 foreign key (ID_TYPE)
      references TYPE (ID_TYPE) on delete restrict on update restrict;

alter table BRANCH_PRODUCT_UNIT add constraint FK_RELATIONSHIP_6 foreign key (ID_BRANCH)
      references BRANCH (ID_BRANCH) on delete restrict on update restrict;

alter table BRANCH_PRODUCT_UNIT add constraint FK_RELATIONSHIP_7 foreign key (ID_PRODUCT)
      references PRODUCT (ID_PRODUCT) on delete restrict on update restrict;

alter table BRANCH_PRODUCT_UNIT add constraint FK_RELATIONSHIP_8 foreign key (ID_UNIT)
      references UNIT (ID_UNIT) on delete restrict on update restrict;

alter table BUY add constraint FK_RELATIONSHIP_19 foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table BUY add constraint FK_RELATIONSHIP_20 foreign key (ID_BUY_CONTRACT)
      references BUY_CONTRACT (ID_BUY_CONTRACT) on delete restrict on update restrict;

alter table BUY add constraint FK_RELATIONSHIP_23 foreign key (ID_SUPPLIER)
      references SUPPLIER (ID_SUPPLIER) on delete restrict on update restrict;

alter table BUY_CONTRACT add constraint FK_RELATIONSHIP_17 foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table BUY_CONTRACT add constraint FK_RELATIONSHIP_36 foreign key (ID_SUPPLIER)
      references SUPPLIER (ID_SUPPLIER) on delete restrict on update restrict;

alter table BUY_CONTRACT_DETAIL add constraint FK_RELATIONSHIP_14 foreign key (ID_BRANCH_PRODUCT_UNIT)
      references BRANCH_PRODUCT_UNIT (ID_BRANCH_PRODUCT_UNIT) on delete restrict on update restrict;

alter table BUY_CONTRACT_DETAIL add constraint FK_RELATIONSHIP_16 foreign key (ID_BUY_CONTRACT)
      references BUY_CONTRACT (ID_BUY_CONTRACT) on delete restrict on update restrict;

alter table BUY_DETAIL add constraint FK_RELATIONSHIP_15 foreign key (ID_BRANCH_PRODUCT_UNIT)
      references BRANCH_PRODUCT_UNIT (ID_BRANCH_PRODUCT_UNIT) on delete restrict on update restrict;

alter table BUY_DETAIL add constraint FK_RELATIONSHIP_18 foreign key (ID_BUY)
      references BUY (ID_BUY) on delete restrict on update restrict;

alter table IMPORT add constraint FK_RELATIONSHIP_32 foreign key (ID_BUY)
      references BUY (ID_BUY) on delete restrict on update restrict;

alter table IMPORT_DETAIL add constraint FK_RELATIONSHIP_29 foreign key (ID_PRODUCT_DETAIL)
      references PRODUCT_DETAIL (ID_PRODUCT_DETAIL) on delete restrict on update restrict;

alter table IMPORT_DETAIL add constraint FK_RELATIONSHIP_31 foreign key (ID_IMPORT)
      references IMPORT (ID_IMPORT) on delete restrict on update restrict;

alter table IMPORT_DETAIL add constraint FK_RELATIONSHIP_33 foreign key (ID_STORE)
      references STORE (ID_STORE) on delete restrict on update restrict;

alter table PAYMENT add constraint FK_RELATIONSHIP_24 foreign key (ID_SUPPLIER)
      references SUPPLIER (ID_SUPPLIER) on delete restrict on update restrict;

alter table PAYMENT add constraint FK_RELATIONSHIP_25 foreign key (ID_BUY)
      references BUY (ID_BUY) on delete restrict on update restrict;

alter table PAYMENT add constraint FK_RELATIONSHIP_26 foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table PAYMENT add constraint FK_RELATIONSHIP_27 foreign key (ID_REASON)
      references REASON (ID_REASON) on delete restrict on update restrict;

alter table PRODUCT add constraint FK_RELATIONSHIP_9 foreign key (ID_CATEGORY)
      references CATEGORY (ID_CATEGORY) on delete restrict on update restrict;

alter table PRODUCT_DETAIL add constraint FK_RELATIONSHIP_22 foreign key (ID_PRODUCT)
      references PRODUCT (ID_PRODUCT) on delete restrict on update restrict;

alter table PRODUCT_DETAIL add constraint FK_RELATIONSHIP_30 foreign key (ID_IMPORT_DETAIL)
      references IMPORT_DETAIL (ID_IMPORT_DETAIL) on delete restrict on update restrict;

alter table STORE add constraint FK_CHILDSTORE foreign key (STO_ID_STORE)
      references STORE (ID_STORE) on delete restrict on update restrict;

alter table STORE add constraint FK_RELATIONSHIP_2 foreign key (ID_BRANCH)
      references BRANCH (ID_BRANCH) on delete restrict on update restrict;

alter table SUPPLIER add constraint FK_RELATIONSHIP_37 foreign key (ID_TYPE)
      references TYPE (ID_TYPE) on delete restrict on update restrict;

alter table SUPPLIER_BRANCH add constraint FK_RELATIONSHIP_38 foreign key (ID_SUPPLIER)
      references SUPPLIER (ID_SUPPLIER) on delete restrict on update restrict;

alter table SUPPLIER_BRANCH add constraint FK_RELATIONSHIP_39 foreign key (ID_BRANCH)
      references BRANCH (ID_BRANCH) on delete restrict on update restrict;

alter table USER add constraint FK_RELATIONSHIP_35 foreign key (ID_BRANCH)
      references BRANCH (ID_BRANCH) on delete restrict on update restrict;

alter table USER_ROLE add constraint FK_RELATIONSHIP_11 foreign key (ID_ROLE)
      references ROLE (ID_ROLE) on delete restrict on update restrict;

alter table USER_ROLE add constraint FK_RELATIONSHIP_13 foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;

alter table USER_STATUS add constraint FK_RELATIONSHIP_10 foreign key (ID_STATUS)
      references STATUS (ID_STATUS) on delete restrict on update restrict;

alter table USER_STATUS add constraint FK_RELATIONSHIP_12 foreign key (ID_USER)
      references USER (ID_USER) on delete restrict on update restrict;*/

