package com.E1I4.project.common.model.vo;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString

public class Report {
	
	private int reportNo;
	private int boardNo;
	private String reportType;
	private String reportCate;
	private String memberId;
	private Date createDate;
}
