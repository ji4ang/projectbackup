package minseong.board.entity;
// 게시판(object) -> 번호, 제목, 작성자, 작성일, 조회수
// 기왕이면 테이블명으로 VO의 이름을 지어준다.
// lombok 활용 -> @ 주석 형태로 관리
public class Board {
	
	// 필드명 property (프로퍼티, 속성)
	private int idx;
	private String title;
	private String content;
	private String writer;
	private String indate;
	private int count;
	
	// 스프링 프레임워크가 써서 보여주진 않지만 기본(디폴트)생성자를 만들어 노ㅓㅎ음
	// getter, setter 만들기
	
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
