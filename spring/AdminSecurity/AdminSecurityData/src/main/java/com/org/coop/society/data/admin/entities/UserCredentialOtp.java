package com.org.coop.society.data.admin.entities;

import java.io.Serializable;

import javax.persistence.*;

import java.sql.Timestamp;


/**
 * The persistent class for the user_credential_otp database table.
 * 
 */
@Entity
@Table(name="user_credential_otp")
@NamedQuery(name="UserCredentialOtp.findAll", query="SELECT u FROM UserCredentialOtp u")
public class UserCredentialOtp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
//	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="user_id")
	private int userId;

	@Column(name="end_date")
	private Timestamp endDate;

	private String otp;

	@Column(name="otp_resend_counter")
	private int otpResendCounter;

	@Column(name="start_date")
	private Timestamp startDate;

	//bi-directional one-to-one association to User
	@OneToOne
	@JoinColumn(name="user_id")
	private User user;

	public UserCredentialOtp() {
	}

	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Timestamp getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public String getOtp() {
		return this.otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	public int getOtpResendCounter() {
		return this.otpResendCounter;
	}

	public void setOtpResendCounter(int otpResendCounter) {
		this.otpResendCounter = otpResendCounter;
	}

	public Timestamp getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + userId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserCredentialOtp other = (UserCredentialOtp) obj;
		if (userId != other.userId)
			return false;
		return true;
	}

}