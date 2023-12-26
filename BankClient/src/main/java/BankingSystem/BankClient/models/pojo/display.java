package BankingSystem.BankClient.models.pojo;

import java.sql.Timestamp;


public class display {
    private Timestamp timeStamp;
	private String type;
    private String id;
    private String deposit;
    private String withdraw;
    private String remarks;
    public display() {
		super();
	}
	public display(Timestamp timeStamp, String type, String id, String deposit, String withdraw, String remarks) {
		super();
		this.timeStamp = timeStamp;
		this.type = type;
		this.id = id;
		this.deposit = deposit;
		this.withdraw = withdraw;
		this.remarks = remarks;
	}
	public Timestamp getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(Timestamp timeStamp) {
		this.timeStamp = timeStamp;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public String getWithdraw() {
		return withdraw;
	}
	public void setWithdraw(String withdraw) {
		this.withdraw = withdraw;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}
