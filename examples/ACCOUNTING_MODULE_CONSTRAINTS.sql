--acc_account_balance----------------------
	
ALTER TABLE acc_account_balance     ADD CONSTRAINT acc_account_balance_fk_01 FOREIGN KEY (account_id) REFERENCES acc_ledger_account (id);
ALTER TABLE acc_account_balance     ADD CONSTRAINT acc_account_balance_fk_02 FOREIGN KEY (fiscal_year_id) REFERENCES period (id);



--------acc_asset_expense_account---------------
	
ALTER TABLE acc_asset_expense_account DROP CONSTRAINT 	fko0d1y1qank673xgkvmry43hsi;
ALTER TABLE acc_asset_expense_account DROP CONSTRAINT	fkkb2v5an10yn33lr2i9ffknk3p;
ALTER TABLE acc_asset_expense_account DROP CONSTRAINT  ukaa4rs77qh6si6gvc93gp1q3ht;

ALTER TABLE acc_account_item ADD CONSTRAINT acc_account_item_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2]));

---------ACCOUNT_ITEM------------
ALTER TABLE acc_account_item DROP CONSTRAINT acc_account_item_ck1;
ALTER TABLE acc_account_item DROP CONSTRAINT acc_account_item_ck2;
ALTER TABLE acc_account_item DROP CONSTRAINT acc_account_item_ck3;
ALTER TABLE acc_account_item DROP CONSTRAINT acc_account_item_ck4;
ALTER TABLE acc_account_item DROP CONSTRAINT acc_account_item_ck6;

ALTER TABLE acc_account_item ADD CONSTRAINT acc_account_item_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2]));
ALTER TABLE acc_account_item ADD CONSTRAINT acc_account_item_ck_02 CHECK (account_group = ANY (ARRAY['CLASS','HEADING', 'SUB_HEADING', 'ACCOUNT']));
ALTER TABLE acc_account_item ADD CONSTRAINT acc_account_item_ck_03 CHECK (account_sens = ANY (ARRAY['CREDIT', 'DEBIT', 'MIXED']));
ALTER TABLE acc_account_item ADD CONSTRAINT acc_account_item_ck_04 CHECK (account_type = ANY (ARRAY['ASSET', 'LIABILITY', 'EQUITY', 'EXPENSE', 'INCOME', 'OFF_BALANCE_SHEET']));
ALTER TABLE acc_account_item ADD CONSTRAINT acc_account_item_ck_05 CHECK (transaction_type = ANY (ARRAY['CREDIT','DEBIT','MIXED']));
ALTER TABLE acc_account_item ADD CONSTRAINT acc_account_item_ck_06 CHECK (account_role= ANY (ARRAY ['CASH_ACCOUNT','GENERAL_LEDGER_ACCOUNT','CONTROL_ACCOUNT','DETAILED_ACCOUNT']));
-------ACC_DELIVERY_NOTE--------------------------------------
ALTER TABLE acc_delivery_note   ADD CONSTRAINT acc_delivered_item_uk_01 UNIQUE (delivery_number);
ALTER TABLE acc_delivery_note   ADD CONSTRAINT acc_delivered_item_fk_01 FOREIGN KEY (requisition_order_id) REFERENCES acc_requistion_order (id);
ALTER TABLE acc_delivery_note   ADD CONSTRAINT acc_delivered_item_fk_02 FOREIGN KEY (branch_id) REFERENCES adm_admin_entity (id);
ALTER TABLE acc_delivery_note   ADD CONSTRAINT acc_delivered_item_fk_03 FOREIGN KEY (year_id) REFERENCES period (id);
ALTER TABLE acc_delivery_note   ADD CONSTRAINT acc_delivery_note_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2])) ;
ALTER TABLE acc_delivery_note   ADD CONSTRAINT acc_delivery_note_ck_02 CHECK(status= ANY (ARRAY ['CREATED','APPROVED','DECLINED']));
------------ACC_DELIVERY_ITEM------------------------------
ALTER TABLE acc_delivered_item  ADD CONSTRAINT acc_delivered_item_fk_02 FOREIGN KEY (delivery_note_id) REFERENCES acc_delivery_note (id);
ALTER TABLE acc_delivered_item  ADD CONSTRAINT acc_delivered_item_fk_03 FOREIGN KEY (travel_details_id) REFERENCES acc_travel_details (id);




--------ACC_INCOME------------------------------------
ALTER TABLE acc_income ADD CONSTRAINT acc_income_fk_05 FOREIGN KEY (barnch_id) REFERENCES adm_admin_entity (id);
ALTER TABLE acc_income ADD CONSTRAINT acc_income_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2])) ;
ALTER TABLE acc_income ADD CONSTRAINT acc_income_ck_02 CHECK(status=ANY (ARRAY ['CREATED','APPROVED','REJECTED',
'CANCELED','PARTIALLY_PAID','FULLY_PAID','PARTIALLY_RENDERED','FULLY_RENDERED','COMPLETED']));

--------ACC_INCOME_ITEM-----------------------------------
ALTER TABLE acc_income_item ADD CONSTRAINT acc_income_item_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2])) ;
ALTER TABLE acc_income_item ADD CONSTRAINT acc_income_item_ck_02 CHECK(status=ANY (ARRAY ['CREATED','APPROVED','REJECTED',
'CANCELED','PARTIALLY_PAID','FULLY_PAID','PARTIALLY_RENDERED','FULLY_RENDERED','COMPLETED']));


--------ACC_INCOME_PAYMENT--------------------------------
ALTER TABLE acc_income_payment ADD CONSTRAINT acc_income_payment_uk_02 UNIQUE (reference_number);
ALTER TABLE acc_income_payment ADD CONSTRAINT acc_income_payment_fk_04 FOREIGN KEY (fiscal_year_id) REFERENCES period (id);
ALTER TABLE acc_income_payment ADD CONSTRAINT acc_income_payment_fk_05 FOREIGN KEY (branch_id) REFERENCES adm_admin_entity (id);
ALTER TABLE acc_income_payment ADD CONSTRAINT acc_income_payment_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2])) ;
ALTER TABLE acc_income_payment ADD CONSTRAINT acc_income_payment_ck_02 CHECK(status= ANY (ARRAY ['CREATED','APPROVED','REJECTED','CANCELED']));
ALTER TABLE acc_income_payment ADD CONSTRAINT acc_income_payment_ck_03 CHECK(payment_method= ANY (ARRAY ['BANK','CASH','ACCOUNT','PAYABLE']));


---------ACC_INCOME_PAYMENT_STATUS---------------------------
ALTER TABLE acc_income_payment_status ADD CONSTRAINT acc_income_payment_status_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2])) ;
ALTER TABLE acc_income_payment_status ADD CONSTRAINT acc_income_payment_status_ck_02 CHECK(status= ANY (ARRAY ['CREATED','APPROVED','REJECTED','CANCELED']));


-----------ACC_INCOME_STATUS---------------------------------
ALTER TABLE acc_income_status ADD CONSTRAINT acc_income_status_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2])) ;
ALTER TABLE acc_income_status ADD CONSTRAINT acc_income_status_ck_02 CHECK(status=ANY (ARRAY ['CREATED','APPROVED','REJECTED',
'CANCELED','PARTIALLY_PAID','FULLY_PAID','PARTIALLY_RENDERED','FULLY_RENDERED','COMPLETED']));



--------ACC_INCOME_TYPE---------------
ALTER TABLE acc_income_type ADD CONSTRAINT acc_income_type_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2])) ;
ALTER TABLE acc_income_type ADD CONSTRAINT acc_income_type_ck_02 CHECK(type= ANY (ARRAY ['SERVICE_RENDERED_PAID','SERVICE_PAID_IN_ADVANCE','SERVICE_RENDERED_NOT_PAID']));



-------ACC_LEDGER_ACCOUNT-----------------------
ALTER TABLE acc_ledger_account DROP CONSTRAINT acc_ledger_account_ck1;
ALTER TABLE acc_ledger_account DROP CONSTRAINT acc_ledger_account_ck2;
ALTER TABLE acc_ledger_account DROP CONSTRAINT acc_ledger_account_ck3;
ALTER TABLE acc_ledger_account DROP CONSTRAINT acc_ledger_account_ck4;


ALTER TABLE acc_ledger_account ADD CONSTRAINT acc_ledger_account_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2]));
ALTER TABLE acc_ledger_account ADD CONSTRAINT acc_ledger_account_ck_02 CHECK (account_type= ANY (ARRAY['ASSET', 'LIABILITY', 'EQUITY', 'EXPENSE', 'INCOME', 'OFF_BALANCE_SHEET']));
ALTER TABLE acc_ledger_account ADD CONSTRAINT acc_ledger_account_ck_03 CHECK (account_sens = ANY (ARRAY['CREDIT','DEBIT','MIXED']));
ALTER TABLE acc_ledger_account ADD CONSTRAINT acc_ledger_account_ck_04 CHECK (account_role= ANY (ARRAY['CASH_ACCOUNT', 'CONTROL_ACCOUNT', 'DETAILED_ACCOUNT', 'GENERAL_LEDGER_ACCOUNT']));
    ALTER TABLE acc_ledger_account ADD CONSTRAINT acc_ledger_account_ck_05 CHECK(product_type=
ANY (ARRAY ['SHARE_ACCOUNT','CURRENT_ACCOUNT','SAVING_ACCOUNT','SAVING_SCHEME','TERM_DEPOSIT','LOAN','SECURITY_SAVING']));

-------ACC_PAYMENT_REFUND---------------------
ALTER TABLE acc_payment_refund ADD CONSTRAINT acc_payment_refund_fk_03 FOREIGN KEY (branch_id) REFERENCES adm_admin_entity (id);
ALTER TABLE acc_payment_refund ADD CONSTRAINT acc_payment_refund_fk_04 FOREIGN KEY (period_id) REFERENCES period (id);
ALTER TABLE acc_payment_refund ADD CONSTRAINT acc_payment_refund_fk_05 FOREIGN KEY (ledger_account_id) REFERENCES acc_ledger_account (id);


ALTER TABLE acc_payment_refund ADD CONSTRAINT acc_payment_refund_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2])) ;
ALTER TABLE acc_payment_refund ADD CONSTRAINT acc_payment_refund_ck_02 CHECK(status=ANY (ARRAY ['CREATED','APPROVED','REJECTED',
'CANCELED','PARTIALLY_PROCESSED','FULLY_PROCESSED','PROCESSING']));

ALTER TABLE acc_payment_refund ADD CONSTRAINT acc_payment_refund_ck_03 CHECK(payment_method= ANY (ARRAY ['BANK','CASH','ACCOUNT','PAYABLE']));

-------ACC_PAYMENT_VOUCHER------------------
ALTER TABLE acc_payment_voucher ADD CONSTRAINT acc_payment_voucher_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2])) ;
ALTER TABLE acc_payment_voucher ADD CONSTRAINT acc_payment_voucher_ck_02 CHECK(payment_method= ANY (ARRAY ['BANK','CASH','ACCOUNT','PAYABLE']));


--------ACC_REQUISITION_ITEM------------------
ALTER TABLE acc_requisition_item ADD CONSTRAINT acc_requisition_item_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2])) ;
ALTER TABLE acc_requisition_item ADD CONSTRAINT acc_requisition_item_fk_02 FOREIGN KEY (account_id) REFERENCES acc_account_item (id);

---------ACC_REQUISITION_ORDER------------------
ALTER TABLE acc_requisition_order ADD CONSTRAINT acc_requisition_order_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2])) ;

ALTER TABLE acc_requisition_order ADD CONSTRAINT acc_requisition_order_ck_02 CHECK(status=ANY (ARRAY ['CREATED','APPROVED','DECLINED',
'CANCELED','PARTIALLY_PAID','FULLY_PAID','COMPLETED']));

ALTER TABLE acc_requisition_order ADD CONSTRAINT acc_requisition_order_fk_02 FOREIGN KEY (entity_id) REFERENCES adm_admin_entity (id);


--------ACC_REQUISITION_TYPE----------------
ALTER TABLE acc_requisition_type ADD CONSTRAINT acc_requisition_type_fk_01 FOREIGN KEY (payable_account_id) REFERENCES acc_account_item (id);
ALTER TABLE acc_requisition_type ADD CONSTRAINT acc_requisition_type_fk_02 FOREIGN KEY (receivable_account_id) REFERENCES acc_account_item (id);
ALTER TABLE acc_requisition_type ADD CONSTRAINT acc_requisition_type_ck_01 CHECK (state = ANY (ARRAY[0, 1, 2])) ;
ALTER TABLE acc_requisition_type ADD CONSTRAINT acc_requisition_type_ck_02 CHECK(type= ANY (ARRAY ['PURCHASE','TAX','CASH','TRAVEL','PURCHASE_IN_PROGRESS']));

	
----------ACC_TRAVEL_DETAILS-----------------------------
	
ALTER TABLE acc_travel_details ADD CONSTRAINT acc_travel_details_fk_01 FOREIGN KEY (requisition_order_id) REFERENCES acc_requisition_order (id);
ALTER TABLE acc_travel_details ADD CONSTRAINT acc_travel_details_fk_02 FOREIGN KEY (mission_account_id) REFERENCES acc_account_item (id);
ALTER TABLE acc_travel_details ADD CONSTRAINT acc_travel_details_fk_03 FOREIGN KEY (transport_account_id) REFERENCES acc_account_item (id);
	

	
	

	
	

	
	
	

	
	
	

