package com.dangtruong.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookiesService {
	@Autowired HttpServletRequest req;
	@Autowired HttpServletResponse resp;
	
	public void add(String name, String value, int days) {
		Cookie cookie = new Cookie(name,value);
		cookie.setMaxAge(days*60*60);
		cookie.setPath("/");
		resp.addCookie(cookie);
	}
	
	public Cookie get(String name) {
		Cookie[] cookies = req.getCookies();
		if(cookies!=null) {
			for(Cookie cookie: cookies) {
				if(cookie.getName().equalsIgnoreCase(name)) return cookie;
			}
		}
		return null;
	}
	
	public String getValue(String name) {
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equalsIgnoreCase(name)) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}
	
	public void remove(String name) {
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equalsIgnoreCase(name)) {
					cookie.setMaxAge(0);
					cookie.setPath("/");
					resp.addCookie(cookie);
					break;
				}
			}
		}
	}
	
}
