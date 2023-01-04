package com.E1I4.project.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoLogin {

	// 카카오 로그인
		public String getAccessToken(String code) {
			
			String access_Token = "";
			String reqURL = "https://kauth.kakao.com/oauth/token";
			
			try {
				URL url = new URL(reqURL);
				
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				
				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
				
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				StringBuilder sb = new StringBuilder();
				
				sb.append("grant_type=authorization_code");
	            
				sb.append("&client_id=3511f863b828fb1a348dbb6100a0ddb0"); //본인이 발급받은 key
				sb.append("&redirect_uri=http://localhost:8088/SingleRior/kakaoLogin.me"); // 본인이 설정한 주소
	            
				sb.append("&code=" + code);
				bw.write(sb.toString());
				bw.flush();
				
				int responseCode = conn.getResponseCode();
//				System.out.println("responseCode : " + responseCode);
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
	            
				while ((line = br.readLine()) != null) {
					result += line;
				}
	            
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
	            
				access_Token = element.getAsJsonObject().get("access_token").getAsString();
//				String refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	            
//				System.out.println("access_token : " + access_Token);
//				System.out.println("refresh_token : " + refresh_Token);
	            
				br.close();
				bw.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return access_Token;
		}

		public HashMap<String, Object> getUserInfo(String access_Token) {
			HashMap<String, Object> userInfo = new HashMap<String, Object>();
			String reqURL = "https://kapi.kakao.com/v2/user/me";
			try {
				URL url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");

				conn.setRequestProperty("Authorization", "Bearer " + access_Token);

				int responseCode = conn.getResponseCode();

				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

				String line = "";
				String result = "";

				while ((line = br.readLine()) != null) {
					result += line;
				}
//				System.out.println("response body : " + result);

				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
				
					
				
				JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
				JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
				JsonElement kakaoId = element.getAsJsonObject().get("id");
				
				
				String id = kakaoId.toString();
				
//				System.out.println("ddd "+ id);
				String nickname = properties.getAsJsonObject().get("nickname").getAsString();
				String email = kakao_account.getAsJsonObject().get("email").getAsString();

				userInfo.put("nickname", nickname);
				userInfo.put("email", email);
				userInfo.put("kakaoId", id);
				userInfo.put("provider", "kakao");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return userInfo;
		}
	
	
}
