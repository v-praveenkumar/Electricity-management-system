package com.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {

	public static boolean passwordStrengthValidate(String password) {
		String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]).{8,}$";
		
		Pattern pattern=Pattern.compile(regex);
		Matcher matcher=pattern.matcher(password);
		
		return matcher.matches();
	}

	public static boolean emailValidation(String email) {
		String regex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
		Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
		
		return matcher.matches();
	}

	public static boolean userIdValidate(String userId) {
		// TODO Auto-generated method stub
		return false;
	}

	public static boolean mobileValidate(String mobileNumber) {
		String regex = "^[9876]\\d{9}$";
		Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(mobileNumber);
		return matcher.matches();
	}

}