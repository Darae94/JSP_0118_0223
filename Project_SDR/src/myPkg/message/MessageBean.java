package myPkg.message;

public class MessageBean {
	
	private int num;
	private String writer;
	private String subject;
	private String toInfo;
	private String content;
	private String reg_date;
	private int toRead;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getToInfo() {
		return toInfo;
	}

	public void setToInfo(String toInfo) {
		this.toInfo = toInfo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getToRead() {
		return toRead;
	}

	public void setToRead(int toRead) {
		this.toRead = toRead;
	}
	
}
