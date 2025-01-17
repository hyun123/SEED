package hr.pay.p0002.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("SALARY_calculVO")
public class SALARY_calculVO {
	private String salary_CAL_SAWON_NAME; 
	private String salary_CAL_SAWON_CODE;
	private String salary_CAL_ATTRIBUTION;
	private String salary_CAL_PAYMENTDAY;
	private String salary_CAL_INQUIRY_CONDITION;
	private String salary_CAL_WORKPLACE_CODE;
	private String salary_CAL_SALARY_ITEM;
	private String salary_CAL_MONEY;
	private String pk_SALARY_CAL_INFO;
	private String salary_CAL_INT_USER_ID;
	private String salary_CAL_INT_DATE;
	private String salary_CAL_USER_ID;
	private String salary_CAL_MOD_DATE;
	private String fk_SALARY_CAL_SAWON_CODE;
	
	
	private String fk_WORKPLACE_CODE;
	private String pk_WORKPLACE_CODE;
	private String workplace_NAME;
	private String workplace_HEADOFF_WHE;
	private String pk_SAWON_CODE;
	private String sawon_NAME;
	private String pk_DEPT_CODE;
	private String dept_NAME;

	
	private String d_B_PAYMENT_DATE_ATTRIBUT;
	private String d_B_PAYMENT_DT;
	

	private String pk_D_B_PAYMENT_SEQ_CODE;
	
	

	public SALARY_calculVO() {
		System.out.println("SALARY_calculVO");
	}




	public String getSalary_CAL_SAWON_NAME() {
		return salary_CAL_SAWON_NAME;
	}




	public void setSalary_CAL_SAWON_NAME(String salary_CAL_SAWON_NAME) {
		this.salary_CAL_SAWON_NAME = salary_CAL_SAWON_NAME;
	}




	public String getSalary_CAL_SAWON_CODE() {
		return salary_CAL_SAWON_CODE;
	}




	public void setSalary_CAL_SAWON_CODE(String salary_CAL_SAWON_CODE) {
		this.salary_CAL_SAWON_CODE = salary_CAL_SAWON_CODE;
	}




	public String getSalary_CAL_ATTRIBUTION() {
		return salary_CAL_ATTRIBUTION;
	}




	public void setSalary_CAL_ATTRIBUTION(String salary_CAL_ATTRIBUTION) {
		this.salary_CAL_ATTRIBUTION = salary_CAL_ATTRIBUTION;
	}




	public String getSalary_CAL_PAYMENTDAY() {
		return salary_CAL_PAYMENTDAY;
	}




	public void setSalary_CAL_PAYMENTDAY(String salary_CAL_PAYMENTDAY) {
		this.salary_CAL_PAYMENTDAY = salary_CAL_PAYMENTDAY;
	}




	public String getSalary_CAL_INQUIRY_CONDITION() {
		return salary_CAL_INQUIRY_CONDITION;
	}




	public void setSalary_CAL_INQUIRY_CONDITION(String salary_CAL_INQUIRY_CONDITION) {
		this.salary_CAL_INQUIRY_CONDITION = salary_CAL_INQUIRY_CONDITION;
	}




	public String getSalary_CAL_WORKPLACE_CODE() {
		return salary_CAL_WORKPLACE_CODE;
	}




	public void setSalary_CAL_WORKPLACE_CODE(String salary_CAL_WORKPLACE_CODE) {
		this.salary_CAL_WORKPLACE_CODE = salary_CAL_WORKPLACE_CODE;
	}




	public String getSalary_CAL_SALARY_ITEM() {
		return salary_CAL_SALARY_ITEM;
	}




	public void setSalary_CAL_SALARY_ITEM(String salary_CAL_SALARY_ITEM) {
		this.salary_CAL_SALARY_ITEM = salary_CAL_SALARY_ITEM;
	}




	public String getSalary_CAL_MONEY() {
		return salary_CAL_MONEY;
	}




	public void setSalary_CAL_MONEY(String salary_CAL_MONEY) {
		this.salary_CAL_MONEY = salary_CAL_MONEY;
	}




	public String getPk_SALARY_CAL_INFO() {
		return pk_SALARY_CAL_INFO;
	}




	public void setPk_SALARY_CAL_INFO(String pk_SALARY_CAL_INFO) {
		this.pk_SALARY_CAL_INFO = pk_SALARY_CAL_INFO;
	}




	public String getSalary_CAL_INT_USER_ID() {
		return salary_CAL_INT_USER_ID;
	}




	public void setSalary_CAL_INT_USER_ID(String salary_CAL_INT_USER_ID) {
		this.salary_CAL_INT_USER_ID = salary_CAL_INT_USER_ID;
	}




	public String getSalary_CAL_INT_DATE() {
		return salary_CAL_INT_DATE;
	}




	public void setSalary_CAL_INT_DATE(String salary_CAL_INT_DATE) {
		this.salary_CAL_INT_DATE = salary_CAL_INT_DATE;
	}




	public String getSalary_CAL_USER_ID() {
		return salary_CAL_USER_ID;
	}




	public void setSalary_CAL_USER_ID(String salary_CAL_USER_ID) {
		this.salary_CAL_USER_ID = salary_CAL_USER_ID;
	}




	public String getSalary_CAL_MOD_DATE() {
		return salary_CAL_MOD_DATE;
	}




	public void setSalary_CAL_MOD_DATE(String salary_CAL_MOD_DATE) {
		this.salary_CAL_MOD_DATE = salary_CAL_MOD_DATE;
	}




	public String getFk_SALARY_CAL_SAWON_CODE() {
		return fk_SALARY_CAL_SAWON_CODE;
	}




	public void setFk_SALARY_CAL_CODE(String fk_SALARY_CAL_CODE) {
		this.fk_SALARY_CAL_SAWON_CODE = fk_SALARY_CAL_CODE;
	}




	public String getPk_WORKPLACE_CODE() {
		return pk_WORKPLACE_CODE;
	}




	public void setPk_WORKPLACE_CODE(String pk_WORKPLACE_CODE) {
		this.pk_WORKPLACE_CODE = pk_WORKPLACE_CODE;
	}




	public String getWorkplace_NAME() {
		return workplace_NAME;
	}




	public void setWorkplace_NAME(String workplace_NAME) {
		this.workplace_NAME = workplace_NAME;
	}




	public String getWorkplace_HEADOFF_WHE() {
		return workplace_HEADOFF_WHE;
	}




	public void setWorkplace_HEADOFF_WHE(String workplace_HEADOFF_WHE) {
		this.workplace_HEADOFF_WHE = workplace_HEADOFF_WHE;
	}




	public String getPk_SAWON_CODE() {
		return pk_SAWON_CODE;
	}




	public void setPk_SAWON_CODE(String pk_SAWON_CODE) {
		this.pk_SAWON_CODE = pk_SAWON_CODE;
	}




	public String getSawon_NAME() {
		return sawon_NAME;
	}




	public void setSawon_NAME(String sawon_NAME) {
		this.sawon_NAME = sawon_NAME;
	}




	public String getPk_DEPT_CODE() {
		return pk_DEPT_CODE;
	}




	public void setPk_DEPT_CODE(String pk_DEPT_CODE) {
		this.pk_DEPT_CODE = pk_DEPT_CODE;
	}




	public String getDept_NAME() {
		return dept_NAME;
	}




	public void setDept_NAME(String dept_NAME) {
		this.dept_NAME = dept_NAME;
	}




	public String getFk_WORKPLACE_CODE() {
		return fk_WORKPLACE_CODE;
	}




	public void setFk_WORKPLACE_CODE(String fk_WORKPLACE_CODE) {
		this.fk_WORKPLACE_CODE = fk_WORKPLACE_CODE;
	}




	public String getD_B_PAYMENT_DATE_ATTRIBUT() {
		return d_B_PAYMENT_DATE_ATTRIBUT;
	}




	public void setD_B_PAYMENT_DATE_ATTRIBUT(String d_B_PAYMENT_DATE_ATTRIBUT) {
		this.d_B_PAYMENT_DATE_ATTRIBUT = d_B_PAYMENT_DATE_ATTRIBUT;
	}




	public String getD_B_PAYMENT_DT() {
		return d_B_PAYMENT_DT;
	}




	public void setD_B_PAYMENT_DT(String d_B_PAYMENT_DT) {
		this.d_B_PAYMENT_DT = d_B_PAYMENT_DT;
	}




	public String getPk_D_B_PAYMENT_SEQ_CODE() {
		return pk_D_B_PAYMENT_SEQ_CODE;
	}




	public void setPk_D_B_PAYMENT_SEQ_CODE(String pk_D_B_PAYMENT_SEQ_CODE) {
		this.pk_D_B_PAYMENT_SEQ_CODE = pk_D_B_PAYMENT_SEQ_CODE;
	}




	

	

	

	
}
