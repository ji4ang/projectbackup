package jisang.poyong.vo;
 // VO = 변수하나하나 만들어주기
public class ChatVO {

	private String senduser; // 보낸이
	private String chattext; // 내용
	private String chatdate; // 날짜
	private String receiveuser; //받는이
	
	public String getSenduser() {
		return senduser;
	}
	public void setSenduser(String senduser) {
		this.senduser = senduser;
	}
	public String getChattext() {
		return chattext;
	}
	public void setChattext(String chattext) {
		this.chattext = chattext;
	}
	public String getChatdate() {
		return chatdate;
	}
	public void setChatdate(String chatdate) {
		this.chatdate = chatdate;
	}
	public String getReceiveuser() {
		return receiveuser;
	}
	public void setReceiveuser(String receiveuser) {
		this.receiveuser = receiveuser;
	}
	@Override
	public String toString() {
		return "ChatVO [senduser=" + senduser + ", chattext=" + chattext + ", chatdate=" + chatdate + ", receiveuser="
				+ receiveuser + "]";
	}
	
	
	
}
	
	