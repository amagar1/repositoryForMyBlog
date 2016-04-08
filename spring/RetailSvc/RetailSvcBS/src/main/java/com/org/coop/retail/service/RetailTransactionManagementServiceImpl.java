package com.org.coop.retail.service;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.coop.canonical.beans.UIModel;
import com.org.coop.retail.servicehelper.RetailTransactionManagementServiceHelperImpl;

@Service
public class RetailTransactionManagementServiceImpl {

	private static final Logger log = Logger.getLogger(RetailTransactionManagementServiceImpl.class); 
	
	@Autowired
	private RetailTransactionManagementServiceHelperImpl retailTransactionManagementServiceHelperImpl;
	
	
	public UIModel getStockTransaction(Integer branchId, Integer customerId, Integer tranId,
						String tranNo, Integer pageNo, Integer recordsPerPage, Date startDate, Date endDate) {
		return retailTransactionManagementServiceHelperImpl.getStockTransaction(branchId, customerId, tranId, tranNo, pageNo, recordsPerPage, startDate, endDate);
	}
	
	public UIModel saveStockTransaction(UIModel uiModel) {
		uiModel = retailTransactionManagementServiceHelperImpl.saveStockTransaction(uiModel);
		if(uiModel.getErrorMsg() != null) {
			return uiModel;
		}
		uiModel = retailTransactionManagementServiceHelperImpl.getStockTransaction(0, 0, uiModel.getBranchBean().getMaterialTranHrds().get(0).getTranId(),
											null, 0, 0, null, null);
		return uiModel;
	}
	
	public UIModel deleteStockTransaction(UIModel uiModel) {
		uiModel = retailTransactionManagementServiceHelperImpl.deleteStockEntries(uiModel);
		return uiModel;
	}
	
}
