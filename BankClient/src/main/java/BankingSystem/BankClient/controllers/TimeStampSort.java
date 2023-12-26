package BankingSystem.BankClient.controllers;

import java.util.Comparator;

import BankingSystem.BankClient.models.pojo.display;

public class TimeStampSort implements Comparator<display>{

	@Override
	public int compare(display o1, display o2) {
		if (o1.getTimeStamp()
				.compareTo(o2.getTimeStamp())<0) //compareTo for comparing LocalDate
			return 1;
		else if(o1.getTimeStamp().compareTo(o2.getTimeStamp())>0)
			return -1;
		else
			return 0;
	}
}

