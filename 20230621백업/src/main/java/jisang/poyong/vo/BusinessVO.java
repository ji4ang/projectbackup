package jisang.poyong.vo;

public class BusinessVO {

	private String userid; //회원가입 아이디
	private String businessidx; // 사업자 번호
	private String businessname; // 사업체 이름
	private String businessboss; // 대표
	private String businessmember; // 사업체 총 인원
	private String businesscode; // 사업체 직군 분류
	private String companyaddress; // 사업체 주소(위치)
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getBusinessidx() {
		return businessidx;
	}
	public void setBusinessidx(String businessidx) {
		this.businessidx = businessidx;
	}
	public String getBusinessname() {
		return businessname;
	}
	public void setBusinessname(String businessname) {
		this.businessname = businessname;
	}
	public String getBusinessboss() {
		return businessboss;
	}
	public void setBusinessboss(String businessboss) {
		this.businessboss = businessboss;
	}
	public String getBusinessmember() {
		return businessmember;
	}
	public void setBusinessmember(String businessmember) {
		this.businessmember = businessmember;
	}
	public String getBusinesscode() {
		return businesscode;
	}
	public void setBusinesscode(String businesscode) {
		this.businesscode = businesscode;
	}
	public String getCompanyaddress() {
		return companyaddress;
	}
	public void setCompanyaddress(String companyaddress) {
		this.companyaddress = companyaddress;
	}
	@Override
	public String toString() {
		return "BusinessVO [userid=" + userid + ", businessidx=" + businessidx + ", businessname=" + businessname
				+ ", businessboss=" + businessboss + ", businessmember=" + businessmember + ", businesscode="
				+ businesscode + ", companyaddress=" + companyaddress + "]";
	}

}
