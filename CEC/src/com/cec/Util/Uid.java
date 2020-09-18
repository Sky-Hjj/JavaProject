package com.cec.Util;

import java.util.Random;

public class Uid {
	public static String generateUID(){
	    Random random = new Random();
	    String result="";
	    for(int i=0;i<8;i++){
	        //首字母不能为0
	        result += (random.nextInt(9)+1);
	    }
	    return result;
	}
	public static void main(String[] args) {
		System.out.println(generateUID());
	}
}
