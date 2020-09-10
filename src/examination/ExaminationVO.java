package examination;

public class ExaminationVO {
	private String subject_no;
	private String subject_name;
	private String test_no;
	private String answer;
	private String content;
	private String explan_no;
	private String explan_answer;
	private String answer_check;
	
	public ExaminationVO() {}
	
	public ExaminationVO(String subject_no, String subject_name, String test_no, String answer, String content,
			String explan_no, String explan_answer, String answer_check) {
		super();
		this.subject_no = subject_no;
		this.subject_name = subject_name;
		this.test_no = test_no;
		this.answer = answer;
		this.content = content;
		this.explan_no = explan_no;
		this.explan_answer = explan_answer;
		this.answer_check = answer_check;
	}

	public String getSubject_no() {
		return subject_no;
	}

	public void setSubject_no(String subject_no) {
		this.subject_no = subject_no;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public String getTest_no() {
		return test_no;
	}

	public void setTest_no(String test_no) {
		this.test_no = test_no;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getExplan_no() {
		return explan_no;
	}

	public void setExplan_no(String explan_no) {
		this.explan_no = explan_no;
	}

	public String getExplan_answer() {
		return explan_answer;
	}

	public void setExplan_answer(String explan_answer) {
		this.explan_answer = explan_answer;
	}

	public String getAnswer_check() {
		return answer_check;
	}

	public void setAnswer_check(String answer_check) {
		this.answer_check = answer_check;
	}
	
	
}
