package com.cec.Util;

import java.util.UUID;

public class UUID_16 {
	public static String getAccountIdByUUId() {
		 int machineId = 1;//���֧��?1-9����Ⱥ��������
		 int hashCodeV = UUID.randomUUID().toString().hashCode();
		 if(hashCodeV < 0) {//�п����Ǹ���
		 hashCodeV = - hashCodeV;
		 }
		 return machineId + String.format("%015d", hashCodeV);
		}
	public static void main(String[] args) {
		System.out.println(getAccountIdByUUId());
	}
}