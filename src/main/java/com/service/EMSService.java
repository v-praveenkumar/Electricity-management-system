package com.service;

import java.util.List;

import com.bean.Bills;
import com.bean.payment;
import com.dao.BillsDao;

public class EMSService {
	
	public List<Bills> getBillsList(Long ConsumerNumber) {
		BillsDao dao=new BillsDao();
		return dao.getBillsList(ConsumerNumber);
	}
	public boolean insertPaymentDetails(payment ptm) {
		BillsDao dao = new BillsDao();
		return dao.insertPaymentDetails(ptm);
	}

	public payment viewInvoice(String txnId) {
		BillsDao dao = new BillsDao();
		return dao.viewInvoice(txnId);
	}
}
