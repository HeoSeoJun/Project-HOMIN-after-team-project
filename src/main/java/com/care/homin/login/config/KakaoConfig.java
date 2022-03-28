package com.care.homin.login.config;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.context.annotation.Configuration;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Configuration
public class KakaoConfig {

	public String getAccessToken (String code) {
		String access_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			String sendMessage = "grant_type=authorization_code" 
					+ "&client_id=6b699a51ed025c4bd6a42e5026901e43"
					+"&redirect_uri=http://localhost:8085/homin/kakaoLogin" 
					+ "&code=" + code;
			URL url = new URL(reqURL);//    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");//    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setDoOutput(true);
			
			//기본 outputStream을 통해 문자열로 처리할 수 있는 OutPutStreamWriter 변환 후
			//처리속도를 빠르게 하기위한 BufferedWriter로 변환해서 사용한다.
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(sendMessage); 
			bw.flush();
			
			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
			System.out.println("responseCode : " + responseCode);
			
			//    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "", result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			System.out.println("result.split : "+result.split(","));
			
			JsonParser parser = new JsonParser();//Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonElement element = parser.parse(result);
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			System.out.println("access_token : " + access_Token);
			
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return access_Token;
	}
	
	public HashMap<String, Object> getUserInfo (String access_Token) {
	    HashMap<String, Object> userInfo = new HashMap<String, Object>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line = "";
	        String result = "";
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);
	        
	        //카카오 계정의 필요한 정보 추출하여 전달 - 닉네임, 이메일(id)
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        userInfo.put("nickname", nickname);
	        
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
//	        System.out.println("email : " + email);
	        userInfo.put("email", email);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return userInfo;
	}
	
	public void logout(String accessToken) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	        int responseCode = conn.getResponseCode();
//	        System.out.println("responseCode : " + responseCode);
	    }catch (Exception e) {
				// TODO: handle exception
			}
	}
}
