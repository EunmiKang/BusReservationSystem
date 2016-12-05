package DAO;

public class TERMINALDAO {
	private String terminalName = null;
	private String address = null;
	private String teleNum = null;
	private String busClass = null;
	public String getTerminalName() {
		return terminalName;
	}
	public void setTerminalName(String terminalName) {
		this.terminalName = terminalName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTeleNum() {
		return teleNum;
	}
	public void setTeleNum(String teleNum) {
		this.teleNum = teleNum;
	}
	public String getBusClass() {
		return busClass;
	}
	public void setBusClass(String busClass) {
		this.busClass = busClass;
	}
	public TERMINALDAO(String terminalName, String address, String teleNum, String busClass) {
		super();
		this.terminalName = terminalName;
		this.address = address;
		this.teleNum = teleNum;
		this.busClass = busClass;
	}
			
}
