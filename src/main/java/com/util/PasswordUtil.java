package com.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class PasswordUtil {
	public static String hashPassword(String password) {
      
       return Base64.getEncoder().encodeToString(password.getBytes());
        
    }

}

