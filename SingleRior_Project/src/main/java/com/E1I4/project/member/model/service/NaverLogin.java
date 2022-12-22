package com.E1I4.project.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Service
public class NaverLogin {
	public String getAccessToken(String code) {
		String accessToken = "";
		String reqURL ="https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=csSoyGLeoDJrrYsbQ_Vt&client_secret=Dalx0jMruX&code="+code+"&state=singlerior";  
		
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
//			System.out.println("response body : " + result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			
//			System.out.println(accessToken);
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return accessToken;
	}

	public HashMap<String, Object> getUserInfo(String accessToken) {
		
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://openapi.naver.com/v1/nid/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
//			System.out.println("response body : " + result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			
			JsonElement response = element.getAsJsonObject().get("response");
			
			String memberId = response.getAsJsonObject().get("id").getAsString();
			String nickname = response.getAsJsonObject().get("nickname").getAsString();
			String email = response.getAsJsonObject().get("email").getAsString();
			String phone = response.getAsJsonObject().get("mobile").getAsString();
			String memberName = response.getAsJsonObject().get("name").getAsString();
			
			userInfo.put("memberId", memberId);
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			userInfo.put("phone", phone);
			userInfo.put("memberName", memberName);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userInfo;
	}
}
