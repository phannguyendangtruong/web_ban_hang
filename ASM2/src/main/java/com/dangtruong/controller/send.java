package com.dangtruong.controller;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class send {
	public static final String ACCOUNT_SID = "AC99e28406402fe5f415a05aac2c9c2582";
	public static final String AUTH_TOKEN = "a1925837b854bbca5d0892862e2c6177";


	public void sendotp(String phone, int otp) {
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
		Message message = Message
				.creator(new PhoneNumber("+84"+phone), new PhoneNumber("+13084705554"), "OTP cua ban la : "+otp).create();

		System.out.println(message.getSid());
	}
}
