package com.org.coop.bs.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

@PropertySource("classpath:adminSvcBS.properties")
@Service
public class AdminSvcCommonUtil {
	
	@Autowired
	private Environment env;
	
	public long diffInTwoDates(Date fromDate, Date toDate) {
		if(fromDate == null || toDate == null) {
			return 0;
		}
		return (toDate.getTime() - fromDate.getTime())/(24 * 60 * 60 * 1000);
	}
	
	/**
	 * This method adds/substract offset days with input date and returns the new date
	 * @param fromDate
	 * @param OFFSET_DAYS
	 * @return
	 */
	public Date getDatesByOffsetDays(Date fromDate, final int OFFSET_DAYS) {
		Date finalDate = null;
		if(fromDate == null) {
			return finalDate;
		}
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(env.getProperty("date.format"));
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(fromDate);
			calendar.add(Calendar.DATE, OFFSET_DAYS);
			String outDate = sdf.format(calendar.getTime());
			finalDate = sdf.parse(outDate);
		} catch (Exception e) {
			
		}
		return finalDate;
	}
	
	public static void main(String args[]) {
		String dateStart = "01/14/2012";
		String dateStop = "01/13/2012";

		//HH converts hour in 24 hours format (0-23), day calculation
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");

		Date d1 = null;
		Date d2 = null;

		try {
			d1 = format.parse(dateStart);
			d2 = format.parse(dateStop);
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(new AdminSvcCommonUtil().diffInTwoDates(d1, d2));
		System.out.println(new AdminSvcCommonUtil().getDatesByOffsetDays(d1, -2));
	}
}
