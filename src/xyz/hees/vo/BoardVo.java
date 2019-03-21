package xyz.hees.vo;

import java.sql.Timestamp;

public class BoardVo {
	private int num;
	private String name;
	private String pass;
	private String title;
	private String content;
	private int readCount;
	private Timestamp writeDate;
	private String id;
	private String fileName;
	private String originFileName;
	
	public BoardVo() {}

	public BoardVo(int num, String name, String pass, String title, String content, int readCount, Timestamp writeDate,
			String id, String fileName, String originFileName) {
		super();
		this.num = num;
		this.name = name;
		this.pass = pass;
		this.title = title;
		this.content = content;
		this.readCount = readCount;
		this.writeDate = writeDate;
		this.id = id;
		this.fileName = fileName;
		this.originFileName = originFileName;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
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

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	@Override
	public String toString() {
		return "BoardVo [num=" + num + ", name=" + name + ", pass=" + pass + ", title=" + title + ", content=" + content
				+ ", readCount=" + readCount + ", writeDate=" + writeDate + ", id=" + id + ", fileName=" + fileName
				+ ", originFileName=" + originFileName + "]";
	}

}
