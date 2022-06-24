package com.dangtruong.utils;

import java.io.File;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext context;

	public String getString(String name, String defaultValue) {
		String result = request.getParameter(name);
		return result != null ? result : defaultValue;

	}

	public double getInt(String name, int defaultValue) {
		String result = request.getParameter(name);
		return result != null ? Integer.valueOf(result) : defaultValue;
	}

	public double getDouble(String name, double defaultValue) {
		String result = request.getParameter(name);
		return result != null ? Double.valueOf(result) : defaultValue;

	}

	public boolean getBoolean(String name, boolean defaultValue) {
		String result = request.getParameter(name);
		return result != null ? Boolean.valueOf(result) : defaultValue;
	}

	public Date getDate(String name, String pattern) {
		try {
			SimpleDateFormat formater = new SimpleDateFormat(pattern);
			return formater.parse(request.getParameter(name));
		}catch(ParseException e) {
			e.printStackTrace();
			return null;
		}

	}

	public File save(MultipartFile file, String path) throws Exception {
		System.out.println("vào");
		File dir = new File(path).getAbsoluteFile();
		System.out.println();
		if(!dir.exists()) {
			dir.mkdir();
		}
		try {
			File saveFile = new File(dir, file.getOriginalFilename());
			return saveFile;
		}catch(Exception e) {
			System.out.println("123");
			throw new Exception();
		}
	}
}
