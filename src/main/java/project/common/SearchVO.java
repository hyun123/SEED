package project.common;


public class SearchVO extends PageVO  {

    private String searchKeyword = "";         // 검색 키워드
    private String searchType = "";            // 검색 필드: 제목, 내용  
    private String[] searchTypeArr;            // 검색 필드를 배열로 변환
    private String searchExt1 = "";            // 검색 확장 필드  
    private String PK_SAWON_CODE;  
    
    public String getSearchKeyword() {
        return searchKeyword;
    }
    
    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }
    
    public String getSearchType() {
        return searchType;
    }
    
    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }
    
    public String[] getSearchTypeArr() {
        return searchType.split(",");
    }

    public String getSearchExt1() {
        return searchExt1;
    }

    public void setSearchExt1(String searchExt1) {
        this.searchExt1 = searchExt1;
    }

	public String getPK_SAWON_CODE() {
		return PK_SAWON_CODE;
	}

	public void setPK_SAWON_CODE(String pK_SAWON_CODE) {
		PK_SAWON_CODE = pK_SAWON_CODE;
	}

	public void setSearchTypeArr(String[] searchTypeArr) {
		this.searchTypeArr = searchTypeArr;
	}

    
    
}
 