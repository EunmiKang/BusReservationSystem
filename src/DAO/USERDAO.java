package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class USERDAO {
   private String USERID = null;
   private String USERPW = null;
   private String USERPHONENUM = null;
   private String USERNAME = null;
   private String USERTOTAL_POINT = null;
   private String USERCURRENT_POINT = null;

   public USERDAO(String USERID, String USERPW, String USERNAME, String USERPHONENUM, String USERTOTAL_POINT,
         String USERCURRENT_POINT) {
      super();
      this.USERID = USERID;
      this.USERPW = USERPW;
      this.USERPHONENUM = USERPHONENUM;
      this.USERNAME = USERNAME;
      this.USERTOTAL_POINT = USERTOTAL_POINT;
      this.USERCURRENT_POINT = USERCURRENT_POINT;
   }
   
   public USERDAO(String USERID, String USERPW) {
      super();
      this.USERID = USERID;
      this.USERPW = USERPW;
   }

   public String getUSERID() {
      return USERID;
   }

   public void setUSERID(String uSERID) {
      USERID = uSERID;
   }

   public String getUSERPW() {
      return USERPW;
   }

   public void setUSERPW(String uSERPW) {
      USERPW = uSERPW;
   }

   public String getUSERPHONENUM() {
      return USERPHONENUM;
   }

   public void setUSERPHONENUM(String uSERPHONENUM) {
      USERPHONENUM = uSERPHONENUM;
   }

   public String getUSERNAME() {
      return USERNAME;
   }

   public void setUSERNAME(String uSERNAME) {
      USERNAME = uSERNAME;
   }

   public String getUSERTOTAL_POINT() {
      return USERTOTAL_POINT;
   }

   public void setUSERTOTAL_POINT(String uSERTOTAL_POINT) {
      USERTOTAL_POINT = uSERTOTAL_POINT;
   }

   public String getUSERCURRENT_POINT() {
      return USERCURRENT_POINT;
   }

   public void setUSERCURRENT_POINT(String uSERCURRENT_POINT) {
      USERCURRENT_POINT = uSERCURRENT_POINT;
   }

   public String updateSeat(String seat, int seatNum, String info) {
      StringBuffer SB_seat = new StringBuffer(seat);
      SB_seat.replace(seatNum, seatNum + 1, info);
      return SB_seat.toString();
   }

   public boolean userJoin() {
      
      Connection conn = null;
      ResultSet rs = null;
      
      DAO dao = new DAO();
      dao.createConn();
      conn = dao.getConn();   
      
      try {
         rs = dao.select(conn, "SELECT M_ID FROM MEMBER WHERE M_ID = \'"+USERID+"\'");
         if(rs.next()==true)
         {
            dao.cancel();
            return false;
         }
         else{
            System.out.println("INSERT INTO MEMBER VALUES("+USERID+","+USERPW+","
                  +USERNAME+","+USERPHONENUM
                  +",0,0)");
            try{
            dao.insert(conn, "INSERT INTO "
                  + "MEMBER(M_ID,M_PW,M_NAME,M_PHONENUM,M_TOTALPOINT,M_CURRENTPOINT)"
                  + " VALUES('"+USERID+"','"+USERPW+"','"+USERNAME+"','"+USERPHONENUM+"',0,0)");
   
            }catch(Exception e){
               System.out.println("[*]   JOIN INSERT error: \n" + e.getMessage());
            }
            dao.cancel();
            return true;
         }
      } catch (Exception e) {
         System.out.println("[*]   JOIN SELECT error: \n" + e.getMessage());
      }
      dao.cancel();
      return false;
   }
   
   public int userLogin()
   {
      Connection conn = null;
      ResultSet rs = null;
      DAO dao = new DAO();
      dao.createConn();
      conn = dao.getConn();   
      
      try{
         rs = dao.select(conn, "SELECT M_ID,M_PW FROM MEMBER WHERE M_ID = \'"+USERID+"\'");
         if(rs.next()==false)
         {
            dao.cancel();
            return 0;//ID�� �������� ���� ��
         }else
         {
            if(rs.getString("M_PW").equals(USERPW)){
               if(rs.getString("M_ID").equals("ADMIN")){
                  dao.cancel();                  
                  return 3;//�������ϋ�
               }
               dao.cancel();
               return 1;//login!
            }
            else{
               dao.cancel();               
               return 2;//PW Ʋ���� ��
            }
         }
      }catch(Exception e){
         System.out.println("[*] LOGIN SELECT result error: \n" + e.getMessage());
      }
      dao.cancel();
      return 1;   
   }
   
   public String selectUserInfo(){
      String userInfo=null;
      Connection conn = null;
      ResultSet rs = null;
      DAO dao = new DAO();
      dao.createConn();
      conn = dao.getConn();
      try{
         rs = dao.select(conn, "SELECT * FROM MEMBER WHERE M_ID = \'"+USERID+"\'");
         if(rs.next()==true){
            userInfo = rs.getString("M_ID")+":"+rs.getString("M_PW")+":"+rs.getString("M_NAME")
               +":"+rs.getString("M_PHONENUM")+":"+rs.getString("M_CURRENTPOINT");
         }
      }catch(Exception e){
         System.out.println("[*] SELECTUSERINFO SELECT error: \n" + e.getMessage());
      }
      dao.cancel();
      return userInfo;
   }
   
   public boolean deactivateAccount(){
      Connection conn = null;
      boolean rs = false;
      DAO dao = new DAO();
      dao.createConn();
      conn = dao.getConn();
      try{
         rs = dao.delete(conn, "DELETE FROM MEMBER WHERE M_ID = \'"+USERID+"\'");
         if(rs == true){
            dao.cancel();            
            return true;
         }
         else{
            dao.cancel();            
            return false;
         }
      }catch(Exception e){
         System.out.println("[*]   DEACTIVATEACCOUNT DELETE error: \n" + e.getMessage());
      }
      dao.cancel();
      return false;
   }
   
   public boolean changeUserSetting(String changePW, String changePhoneNum){
      Connection conn = null;
      DAO dao = new DAO();
      dao.createConn();
      conn = dao.getConn();
      try{
         dao.updateBranch(conn, "MEMBER", "M_PW", changePW, "M_ID = \'"+USERID+"\'");
         dao.updateBranch(conn, "MEMBER", "M_PHONENUM", changePhoneNum, "M_ID = \'"+USERID+"\'");
         dao.cancel();
         return true;
      }catch(Exception e){
         System.out.println("[*] changeUserSetting CHANGE error: \n" + e.getMessage());
      }
      dao.cancel();
      return false;
   }
   
   public List<RESERVATIONSTATUS> returnStatusList(RESERVATIONSTATUS reStatus){
      Connection conn = null;
      String scheduleNo = null;
      ResultSet rs = null;
      ResultSet rs2 = null;
      List<RESERVATIONSTATUS> RSSList = new ArrayList<>();
      DAO dao = new DAO();
      dao.createConn();
      conn = dao.getConn();
      try{
         if(reStatus.getBUSCLASS().equals("전체등급")){
         rs = dao.select(conn, "SELECT * FROM SCHEDULE_INFO WHERE "
               + "DEPARTURE_TERMINAL = '"+reStatus.getDEPARTURETERMINAL()
               +"'AND ARRIVAL_TERMINAL = '"+reStatus.getARRIVALTERMINAL()+"' "
               + "ORDER BY DEPARTURE_TIME");
         }else{
            rs = dao.select(conn, "SELECT * FROM SCHEDULE_INFO WHERE "
                  + "DEPARTURE_TERMINAL = '"+reStatus.getDEPARTURETERMINAL()
                  +"'AND ARRIVAL_TERMINAL = '"+reStatus.getARRIVALTERMINAL()
                  +"'AND BUS_NO = '"+reStatus.getBUSCLASS()+"' "
                  + "ORDER BY DEPARTURE_TIME");
         }
         while(rs.next()!=false){
            if(rs.getString("DEPARTURE_TIME").compareTo(reStatus.getDEPARTURETIME()) >= 0){
               scheduleNo = rs.getString("SCHEDULE_NO");
               rs2 = dao.select(conn, "SELECT * FROM RESERVATION_STATUS_TABLE WHERE "
                     + "SCHEDULE_NO = '"+scheduleNo+"' AND DEPARTURE_DATE = '"+reStatus.getDEPARTUREDATA()+"'");   
               if(rs2.next()!=false){
               RSSList.add(new RESERVATIONSTATUS(reStatus.getDEPARTURETERMINAL(),
                                       reStatus.getARRIVALTERMINAL(), 
                                       reStatus.getDEPARTUREDATA(),
                                       rs.getString("DEPARTURE_TIME"),
                                       rs.getString("BUS_NO"),
                                       rs.getString("REQUIRED_TIME"),
                                       rs.getString("PRICE"),
                                       rs2.getString("SEAT_INFO"), 
                                       rs2.getString("REMAINING_SEATS_NUM")));
               }
            }
         }
         dao.cancel();
         return RSSList;
      }catch(Exception e){
         System.out.println("[*] returnStatusList error: \n" + e.getMessage());
      }
      dao.cancel();
      return null;
   }
   
   public String showReStatus(RESERVATIONSTATUS reStatus){
      String STATUS = null;
      try {
         
         STATUS = reStatus.getDEPARTURETIME() + " " + returnBusClass(reStatus.getBUSCLASS())+ " "
               + reStatus.getREQUIREDTIME() + " " + reStatus.getPRICE() + " "
               + reStatus.getREMAINSEAT() + " " + reStatus.getSEATINFO();
         if (STATUS != null) {
            return STATUS;
         }
      } catch (Exception e) {
         System.out.println("[*]   SHOWSCHEDULE error: \n" + e.getMessage());
      }
      return null;
   }
   
   public String returnBusClass(String a){
      if(a.equals("1"))
         return "일반";
      else if(a.equals("2"))
         return "우등";
      else
         return "프리미엄";
   }
   
public List<RESERVATIONSTATUS> returnStatusList2(RESERVATIONSTATUS reStatus){
      
      Connection conn = null;
      String scheduleNo = null;
      ResultSet rs = null;
      ResultSet rs2 = null;
      List<RESERVATIONSTATUS> RSSList = new ArrayList<>();
      DAO dao = new DAO();
      dao.createConn();
      conn = dao.getConn();
      try{
         rs = dao.select(conn, "SELECT * FROM SCHEDULE_INFO WHERE "
               + "DEPARTURE_TERMINAL = '"+reStatus.getDEPARTURETERMINAL()
               +"'AND ARRIVAL_TERMINAL = '"+reStatus.getARRIVALTERMINAL()+"' "
               + "ORDER BY DEPARTURE_TIME");
         while(rs.next()!=false){
               scheduleNo = rs.getString("SCHEDULE_NO");
               rs2 = dao.select(conn, "SELECT * FROM RESERVATION_STATUS_TABLE WHERE "
                     + "SCHEDULE_NO = '"+scheduleNo+"' AND DEPARTURE_DATE = '"+reStatus.getDEPARTUREDATA()+"'");   
               if(rs2.next()!=false){
               RSSList.add(new RESERVATIONSTATUS(reStatus.getDEPARTURETERMINAL(),
                                       reStatus.getARRIVALTERMINAL(), 
                                       reStatus.getDEPARTUREDATA(),
                                       rs.getString("DEPARTURE_TIME"),
                                       rs.getString("BUS_NO"),
                                       rs.getString("REQUIRED_TIME"),
                                       rs.getString("PRICE"),
                                       rs2.getString("SEAT_INFO"), 
                                       rs2.getString("REMAINING_SEATS_NUM")));
               }
            
         }
         dao.cancel();
         return RSSList;
      }catch(Exception e){
         System.out.println("[*] returnStatusList error: \n" + e.getMessage());
      }
      dao.cancel();
      return null;
   }
   
   public List<RESERVATIONINFO> returnReservationList(String USERID){
      Connection conn = null;
      String scheduleNo = null;
      ResultSet rs = null;
      ResultSet rs2 = null;
      List<RESERVATIONINFO> RSIList = new ArrayList<>();
      DAO dao = new DAO();
      dao.createConn();
      conn = dao.getConn();
      try{
         rs = dao.select(conn, "SELECT * FROM RESERVATION WHERE "
               + "MEMBER_ID = '"+USERID+"'");
         while(rs.next()!=false){
               scheduleNo = rs.getString("SCHEDULE_NO");
               rs2 = dao.select(conn, "SELECT * FROM SCHEDULE_INFO WHERE "
                     + "SCHEDULE_NO = '"+scheduleNo+"'");   
               if(rs2.next()!=false){
                  RSIList.add(new RESERVATIONINFO(
                        rs2.getString("DEPARTURE_TERMINAL"),
                        rs2.getString("ARRIVAL_TERMINAL"),
                        rs.getString("RESERVATION_DATE"),
                        rs2.getString("DEPARTURE_TIME"),
                        rs.getString("SEAT_NO")));
               }
            
         }
         dao.cancel();
         return RSIList;
      }catch(Exception e){
         System.out.println("[*] returnStatusList error: \n" + e.getMessage());
      }
      dao.cancel();
      return null;
   }

   public String showReservationInfo(RESERVATIONINFO reInfo){
      String STATUS = null;
      try {
         
         STATUS = reInfo.getDEPARTURETIME() + " " + reInfo.getARRIVAL()+ " "
               + reInfo.getRESERVATIONDATE() + " " + reInfo.getDEPARTURETIME() + " "
               + reInfo.getSEATNUM();
         if (STATUS != null) {
            return STATUS;
         }
      } catch (Exception e) {
         System.out.println("[*]   showReservationInfo error: \n" + e.getMessage());
      }
      return null;
   }
   
   public String returnCurPoint(USERDAO userDao){
      Connection conn = null;
      ResultSet rs = null;
      DAO dao = new DAO();
      dao.createConn();
      conn = dao.getConn();
      try{
         rs = dao.select(conn, "SELECT * FROM MEMBER WHERE M_ID = '"+userDao.getUSERID()+"'");
         if(rs.next()!=false){   
            String a = rs.getString("M_CURRENTPOINT");
            dao.cancel();
            return a;
         }
      }catch(Exception e){
         System.out.println("[*] changeUserSetting CHANGE error: \n" + e.getMessage());
      }
      dao.cancel();
      return null;
   }
   
   public boolean registrationReservation(String ID, String PW, String departure, String arrival,
                                 String departureDate, String departureTime, String seatInfo,
                                 String usePoint, String ticketingWay){
      Connection conn = null;
      ResultSet rs = null;
      DAO dao = new DAO();
      dao.createConn();
      conn = dao.getConn();
      String[] seatInfoArray = seatInfo.split("/");
      try{
         rs = dao.select(conn, "SELECT SCHEDULE_NO FROM SCHEDULE_INFO "
                     + "WHERE DEPARTURE_TERMINAL = '" + departure + "' AND "
                     + "ARRIVAL_TERMINAL = '" + arrival + "' AND DEPARTURE_TIME = '" + departureTime + "'");
         
         if(rs.next() != false) {
            String seatNo = "";
            String[] seatInfoIns = new String[2];
            for(int i=0; i<seatInfoArray.length; i++) {
               seatInfoIns = seatInfoArray[i].split("_");
               seatNo += seatInfoIns[0];
            }
            
            dao.insert(conn, "INSERT INTO RESERVATION "
                  + "VALUES(RESERVATION_NO.NEXTVAL, '" + ID +"', '" + departureDate + "', " 
                  + rs.getInt("SCHEDULE_NO") + ", '" + seatNo + "')");
            
            dao.insert(conn, "INSERT INTO PAYMENT "
                  + "VALUES(RESERVATION_NO.CURRVAL, '" + ticketingWay + "', '" 
                  + usePoint + "', '" + ID + "')");
         }
         dao.cancel();
         return true;
      }catch(Exception e){
         System.out.println("[*] returnStatusList error: \n" + e.getMessage());
      }
      dao.cancel();
      return false;
   }
   
   public boolean updatePoint(String ID, String usePoint) {
      Connection conn = null;
      ResultSet rs = null;
      DAO dao = new DAO();
      dao.createConn();
      conn = dao.getConn();
      try{
         rs = dao.select(conn, "SELECT * FROM MEMBER WHERE M_ID = '" + ID + "'");
         if(rs.next() != false) {
        	String currentPoint = rs.getString("M_CURRENTPOINT");
            String totalPoint = rs.getString("M_TOTALPOINT");
            if(!usePoint.equals("0")) {
               int intCurrentPoint = Integer.parseInt(currentPoint) - Integer.parseInt(usePoint) + 100;
               int intTotalPoint = Integer.parseInt(totalPoint) + 100;
               
               dao.updateBranch(conn, "MEMBER", "M_CURRENTPOINT", Integer.toString(intCurrentPoint), "M_ID = '" + ID +"'");
               dao.updateBranch(conn, "MEMBER", "M_TOTALPOINT", Integer.toString(intTotalPoint), "M_ID = '"+ ID +"'");
               
               return true;
            }
            else {
               int intCurrentPoint = Integer.parseInt(currentPoint) + 100;
               int intTotalPoint = Integer.parseInt(totalPoint) + 100;
               
               dao.updateBranch(conn, "MEMBER", "M_CURRENTPOINT", Integer.toString(intCurrentPoint), "M_ID = '" + ID +"'");
               dao.updateBranch(conn, "MEMBER", "M_TOTALPOINT", Integer.toString(intTotalPoint), "M_ID = '"+ ID +"'");
               return true;
            }
         }
         dao.cancel();
         return true;
      }catch(Exception e){
         System.out.println("[*] returnStatusList error: \n" + e.getMessage());
      }
      dao.cancel();
      return false;
   }
   
   public boolean updateSeat(String departure, String arrival, String departureDate, String departureTime, String busClass, String seatInfo) {
      Connection conn = null;
      ResultSet rs = null;
      ResultSet rs2 = null;
      DAO dao = new DAO();
      dao.createConn();
      conn = dao.getConn();
      String[] seatInfoArray = seatInfo.split("/");
      String newSeatInfo ="";
      int newRemainingSeatsNum;
      try{
         rs = dao.select(conn, "SELECT SCHEDULE_NO FROM SCHEDULE_INFO "
               + "WHERE DEPARTURE_TERMINAL = '" + departure + "'AND "
               + "ARRIVAL_TERMINAL = '" + arrival + "' AND DEPARTURE_TIME = '" + departureTime + "'");
         if(rs.next() != false) {
        	 rs2 = dao.select(conn, "SELECT * FROM RESERVATION_STATUS_TABLE "
                     + "WHERE SCHEDULE_NO = " + rs.getString("SCHEDULE_NO") + " "
                           + "AND DEPARTURE_DATE = '" + departureDate + "'");
        	 if(rs2.next() != false) {
        		 String[] seatInfoIns = new String[2];
                 String[] originSeatInfo = rs2.getString("SEAT_INFO").split("");
                 
                 for(int i=0; i<seatInfoArray.length; i++) {
                    seatInfoIns = seatInfoArray[i].split("_");
                    if(busClass.equals("일반")) {
                       for(int j=0; j<28; j++) {
                          if((j+1) == Integer.parseInt(seatInfoIns[0])) {
                             newSeatInfo += seatInfoIns[1];
                          }
                          else {
                             newSeatInfo += originSeatInfo[i];
                          }
                       }
                    }
                    else if(busClass.equals("우등")) {
                    	for(int j=0; j<21; j++) {
                    		if((j+1) == Integer.parseInt(seatInfoIns[0])) {
                    			newSeatInfo += seatInfoIns[1];
                    		}
                    		else {
                    			newSeatInfo += originSeatInfo[i];
                    		}
                    	}
                    }
                    else if(busClass.equals("프리미엄")) {
                    	for(int j=0; j<14; j++) {
                    		if((j+1) == Integer.parseInt(seatInfoIns[0])) {
                    			newSeatInfo += seatInfoIns[1];
                    		}
                    		else {
                    			newSeatInfo += originSeatInfo[i];
                    		}
                    	}
                    }
                 }
                 
                 dao.updateBranch(conn, "RESERVATION_STATUS_TABLE", "SEAT_INFO", newSeatInfo, 
                       "SCHEDULE_NO = " + rs.getString("SCHEDULE_NO") + " "
                       + "AND DEPARTURE_DATE = '" + departureDate + "'");
                 
                 newRemainingSeatsNum = Integer.parseInt(rs2.getString("REMAINING_SEATS_NUM")) - seatInfoArray.length;
                 dao.updateBranch(conn, "RESERVATION_STATUS_TABLE", "REMAINING_SEATS_NUM", Integer.toString(newRemainingSeatsNum), 
                       "SCHEDULE_NO = " + rs.getString("SCHEDULE_NO") + " "
                       + "AND DEPARTURE_DATE = '" + departureDate + "'");
              }
              dao.cancel();
              return true;
        	 }
      }catch(Exception e){
         System.out.println("[*] returnStatusList error: \n" + e.getMessage());
      }
      dao.cancel();
      return false;
   }
}