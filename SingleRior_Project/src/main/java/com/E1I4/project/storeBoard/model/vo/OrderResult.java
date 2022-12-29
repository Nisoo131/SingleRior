package com.E1I4.project.storeBoard.model.vo;

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
public class OrderResult {
 private int orderDetailNo;
 private int productNo;
 private String status;
 private String productQty;
 private int productPrice;
 private String productOption;
 private int orderNo;
 //orderproduct
 private String recipient;
 private String address;
 private String phone;
 private Date orderDate;
 private int totalPrice;
 private String memberId;
 private String orderTotalStatus;
 private String deliveryMsg;
 //pay
 private int payNo;
 private int payAmount; // == totalPrice
 private Date payDate;
 private String payStatus;

 

 
 
}
  

