package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.concurrent.locks.StampedLock;

import com.model.GoodsIssues;
import com.model.InventoryGoodsRecipts;
import com.model.Inventorydata;
import com.model.MpTodolist;
import com.model.OrderTable;
import com.model.ShowAccountTodolist;
import com.model.ShowPartialInventoryData;
import com.model.Vendor;
import com.model.billOfMaterial;
import com.model.binModel;
import com.model.inventorymodal;
import com.model.inventorytodolistdata;
import com.model.mainProduction;
import com.model.materialData;
import com.model.materialType;
import com.model.partialInventory;
import com.model.partialIssues;
import com.model.prdata;
import com.model.productionOrder;
import com.model.purchasingReqshowdata;
import com.model.purchasingRequsition;
import com.model.roleuser;
import com.model.showGoodsIssue;
import com.model.showProduction;
import com.model.todomodel;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.servlet.showInventorydata;
import com.servlet.showPartialInventory;
import com.sun.org.apache.xpath.internal.operations.Or;

import freemarker.cache.MruCacheStorage;

public class MPDBManager {
	static Connection con=null;
	public  static void insertion(String mtname, String mtdesc){
		int on=1;
		con=(Connection) DBConnection.getConnection();
		try {
			Statement st=(Statement) con.createStatement();
			 String sql="insert into materialtype(mt_name,mt_description,active)values('"+mtname+"','"+mtdesc+"',"+on+")";
			System.out.println(sql);
			st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	public static void MTinsertion(String MtName , int MtWeight,int MtPrice,String mMDESC,int mmtypeId){
		int on=1;
		con=(Connection) DBConnection.getConnection();
		try{
			Statement st=(Statement) con.createStatement();
			String sql="insert into material(m_name,m_weight,m_price,m_description,mt_no,active) values('"+MtName+"',"+MtWeight+","+MtPrice+",'"+mMDESC+"',"+mmtypeId+","+on+") ";
		    System.out.println(sql);
		    st.executeUpdate(sql);
		    
		
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public static  ArrayList<materialData> MtShow(){
		
		ArrayList<materialData> emplist=new ArrayList<materialData>();
		materialData MD=null;
		con=(Connection) DBConnection.getConnection();
		try{
			Statement st=(Statement) con.createStatement();
			 String sql=" select * from material ";
			System.out.println(sql);
			st.executeQuery(sql);
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
				MD=new materialData();
				MD.setMt_name(rs.getString("m_name"));
				MD.setMt_weight(rs.getInt("m_weight"));
				MD.setMt_price(rs.getInt("m_price"));
				MD.setMt_movivgPrice(rs.getInt("m_moving_price"));
				MD.setMt_desc(rs.getString("m_description"));
				MD.setMt_typeNo(rs.getInt("mt_no"));
				emplist.add(MD);
				
				
				
			}
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return emplist;
		
	}  
	
	public static ArrayList<materialType> show(){
		ArrayList<materialType> emplist=new ArrayList<materialType>();
		 materialType l=null;
		 
		 con=(Connection) DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				 String sql=" select * from materialtype ";
				System.out.println(sql);
				st.executeQuery(sql);
				ResultSet rs=st.executeQuery(sql);
				while(rs.next()){
					
					 l=new materialType();
					// l.setMt_no(rs.i);
					 l.setMt_name(rs.getString("mt_name"));
				
					emplist.add(l);
					
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return emplist; 
	 }
	//selecting id in the combo box to retriveing the data into combo box
	public static int Idseleting(String mmcombo){
		con=(Connection) DBConnection.getConnection();
		int mt=0;
		try{
			Statement st=(Statement) con.createStatement();
			String sql="select mt_no from materialtype where mt_name='"+mmcombo+"'";
			System.out.println(sql);
			
			
		ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
				
				
				mt=rs.getInt("mt_no");
				
			} 
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mt;
	}
	//  ********** VENDEOR FORM DATA FLOW HERE 
	public static void VendorInsert(String VName,String VTitle,String VcompanyAdd,int VcContact,int VcMobile,int VcNtn,String Bankname,int BankAccount){
		int on=1;
		con=(Connection) DBConnection.getConnection();
		try{
			Statement st=(Statement) con.createStatement();
			String sql="insert into vendor(vendor_name,company_title,company_address,contact_number,mobile_number,ntn_number,bank_name,bank_account,active) values('"+VName+"','"+VTitle+"','"+VcompanyAdd+"',"+VcContact+","+VcMobile+","+VcNtn+",'"+Bankname+"',"+BankAccount+","+on+") ";
	        System.out.println(sql);
	        st.executeUpdate(sql);
		}
	        catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	//****************************BATHC DATA INSERTION HERE STARTS BELOW :P**************************************
	public static void BatchInsert(String batch,int binId){
		con=(Connection) DBConnection.getConnection();
		try{
			Statement st=(Statement) con.createStatement();
			String sql="insert into batch(b_name,bin_id)value('"+batch+"',"+binId+") ";
			System.out.println(sql);
			st.executeUpdate(sql);
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// ************************* HERE IS BIN  INSERTION FORM***************************************
	public static void BinInsertion(String BinName,String BinDesc){
		con=(Connection) DBConnection.getConnection();
		try{
			Statement st=(Statement) con.createStatement();
			String sql="insert into bin(bin_name,bin_description) value('"+BinName+"','"+BinDesc+"')";
			System.out.print(sql);
			st.executeUpdate(sql);
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
}
	//************* ARRAYLIST TO SHOWING DATA 
	public static ArrayList<binModel> binshow(){
		
		
		ArrayList<binModel> empity=new ArrayList<binModel>();
		binModel binm=null;
		con=(Connection) DBConnection.getConnection();
		try{
			Statement st=(Statement)con.createStatement();
			String sql="select * from bin";
			System.out.print(sql);
			st.executeQuery(sql);
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
				binm=new binModel();
				binm.setBinName(rs.getString("bin_name"));
				empity.add(binm);
			}
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return empity;
		
	}   
	   //********************* SELECTING THE BIN ID ***********************
	public static int BinId(String binName){
		con=(Connection) DBConnection.getConnection();
		int binId=0;
		try{
			Statement st=(Statement)con.createStatement();
			String sql="select bin_id from bin where bin_name='"+binName+"'";
		     System.out.print(sql);
		     ResultSet rs=st.executeQuery(sql);
		     while(rs.next()){
		    	 binId=rs.getInt("bin_id");
		    	 
		     }
		}
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return binId;
		
	}
	// ************************ INSERTING DATA FOR THE PR TABLE FOR RELATION WITH PURCHSING REQUESITATION ************
	public static void PrIdInsert(int vendorId,int proOrderId,int productId,String deliveydate,String currentdate ){
		con=(Connection) DBConnection.getConnection();
		try{
			Statement st=(Statement)con.createStatement();
			String sql="insert into prtable (vendor_id,order_id,po_no,delivery_date,Curent_date)value("+vendorId+","+proOrderId+","+productId+",'"+deliveydate+"','"+currentdate+"')";
		    System.out.println(sql);
			st.executeUpdate(sql);
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//******************* CREATING ARRAY LIST FOR RETERIVING DATA IN THE TEXT FORMATES FOR productionOrderType Table
	  public static ArrayList<prdata> ptTextShow(int vid){
		  ArrayList< prdata> empty=new ArrayList<prdata>();
              prdata pr=null;
		  try{

		  
		  con=(Connection)DBConnection.getConnection();
		  
			  Statement st=(Statement)con.createStatement();
			  String sql="SELECT order_id FROM ordertable WHERE order_id="+vid+" ";
			  System.out.print(sql);
			  st.executeQuery(sql);
			  ResultSet rs=st.executeQuery(sql);
			  while(rs.next()){
				  pr=new prdata();
				pr.setOrderID(rs.getInt("order_id"));
				empty.add(pr);
			  }
		  
		  }
		  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  
		  return empty;
		
		  
	  
}
	/*
	  // FOR TESTING Only 
	  public static int TestIn(String test){
		  
		  con=(Connection) DBConnection.gettConnection();
		  int i=0;
		  try{
			  Statement st=( Statement)con.createStatement();
			  String sql="select   from vendor where  vendor_name='"+test+"'";
			  System.out.println(sql);
			  ResultSet rs=st.executeQuery(sql);
			  while(rs.next()){
				  i=rs.getInt("vendor_id");
				  
			  }
		  }
		  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  
		return i;
		  
	  }
	  */
	  
	  // FOr Product ID
	  public static ArrayList<prdata> ShowProductId(int Pid){
		  ArrayList< prdata> empty=new ArrayList<prdata>();
          prdata pr=null;
	con=(Connection)DBConnection.getConnection();
	try{
		Statement st=(Statement)con.createStatement();
		String sql="select po_start_date from productionorder where po_no="+Pid+"";
		System.out.print(sql);
		ResultSet rs=st.executeQuery(sql);
		while(rs.next()){
			pr=new prdata();
		pr.setName(rs.getString("po_start_date"));
		empty.add(pr);
		}
	}
	catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
	return empty;
	
}
	  //************* CREATING ARRAY LIST FOR RETERIVIMG THE DATA IN THE VENDOR TEXT FEILD FROM VENDOR TABLE***********
	  
	  
	  
	  public static ArrayList<prdata> PrVendorText(int VandorId){
		  
		  ArrayList<prdata> empty=new ArrayList<prdata>();
		  prdata pr=null;
		  con=(Connection)DBConnection.getConnection();
		  try{
			  Statement st=(Statement) con.createStatement();
			  String sql="select vendor_name from vendor where vendor_id="+VandorId+"";
			  System.out.println(sql);
			  st.executeQuery(sql);
			  ResultSet rs=st.executeQuery(sql);
			  while(rs.next()){
				  pr=new prdata();
				  pr.setName(rs.getString("vendor_name"));
				  empty.add(pr);
				  
			  }
			  
		  }
		  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return empty;
		  
	  }  
	   // ********************* comparing the name and reteriving the data in servlet ******************************
             public static int PrVendorId(String pv){
            	  con=(Connection)DBConnection.getConnection();
            	 int id=0;
            	 ResultSet rs=null;
            
		
		  
		  try{
			  Statement st=(Statement) con.createStatement();
			  String sql="select vendor_id  from vendor where  vendor_name='"+pv+"'";
			  System.out.println(sql);
			   rs=st.executeQuery(sql);
			  while(rs.next()){

				  id=rs.getInt("vendor_id");
				 
				  
			  
			
			  }
		  }
		  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  
		return id;
		  
	  }  
             
             public static int PrOrderId(String poder) {
            	 con=(Connection)DBConnection.getConnection();
            	 int Id=0;
            	 ResultSet rs=null;
                 
     		  
     		 
     		  try{
     			  Statement st=(Statement) con.createStatement();
     			  String sql="select pro_oder_no  from productionordertype where  pot_type='"+poder+"'";
     			  System.out.println(sql);
     			 //st.executeQuery(sql);
     			   rs=st.executeQuery(sql);
     			  while(rs.next()){

     				Id=rs.getInt("pro_oder_no");
     				  System.out.println(Id);
     				 
     				  
     			  
     			
     			  }
     		  }
     		  catch (SQLException e) {
     				// TODO Auto-generated catch block
     				e.printStackTrace();
     			}
     		 
     		return Id;
     		  
     	  }
             //************************ Product Id*****************************
             
             
             public static int ProductId(String proName){
            	 con=(Connection)DBConnection.getConnection();
            	 ResultSet rs=null;
            	 int id=0;
             
     		 
     		  try{
     			  Statement st=(Statement) con.createStatement();
     			  String sql="select po_no  from productionorder where  po_start_date='"+proName+"'";
     			  System.out.println(sql);
     			 //st.executeQuery(sql);
     			   rs=st.executeQuery(sql);
     			  while(rs.next()){

     				  id=rs.getInt("po_no");
     				
     				  
     			  }
     			 
     		  }
     		  catch (SQLException e) {
     				// TODO Auto-generated catch block
     				e.printStackTrace();
     			}
     		 
     		return id;
     		  
     	  }
             
             
            //*************** SENDING DATA TO OTHER PAGE ********************************
       public static ArrayList<prdata> showIds(){
            	ArrayList<prdata> empty=new ArrayList<prdata>();
            	prdata pr=null;
            	con=(Connection)DBConnection.getConnection();
      		  try{
      			  Statement st=(Statement) con.createStatement();
      			  String sql="SELECT vendor_id,order_id,po_no,pr_id FROM prtable WHERE pr_id=(SELECT MAX(pr_id) FROM prtable)";
      			  System.out.println(sql);
      			  st.executeQuery(sql);
      			  ResultSet rs=st.executeQuery(sql);
      			  while(rs.next()){
      				  pr=new prdata();
      				  pr.setVendorId(rs.getInt("vendor_id"));
      				  pr.setProOrderId(rs.getInt("order_id"));
      				  pr.setProductId(rs.getInt("po_no"));
      				  pr.setPrId(rs.getInt("pr_id"));
      				  empty.add(pr);
      				  
      				  
      			  }
      			  
      		  }
      		catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
            	
      		  System.out.println(empty);
				return empty;
				
				
            	
            }
            
           
                         //********** PURCHASING REQUESITIONS FORM DATA **************INSERTING HERE
       public static void  PurchasingRequesition(int MtNo ,int prQuantity  , int Prstatus, int PrId ){
    	   con=(Connection) DBConnection.getConnection();
    	   try{
    		   Statement st=(Statement)con.createStatement();
    		   String sql="insert into purchasingrequsition (m_no,pr_quantity,pr_status,pr_id) value("+MtNo+","+prQuantity+","+Prstatus+","+PrId+")";
    	       System.out.println(sql);
    	       st.executeUpdate(sql);
    	       
    	   
    	   }
    	   catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
       }
      public static ArrayList<purchasingRequsition> AddArray(ArrayList<Integer>  Mlist,ArrayList<String> Mprice,ArrayList<String> prQuantity,ArrayList<String> prStatus,int prid){
    	  
    	  ArrayList<purchasingRequsition> empty=new ArrayList<purchasingRequsition>();
    	  String sql=null;
    	  con=(Connection) DBConnection.getConnection();
    	  try{
    		 
    		  Statement st=(Statement)con.createStatement();
    		  for (int counter=0; counter<Mlist.size(); counter++){
    			   sql="insert into purchasingrequsition(m_no,material_price,pr_quantity,total_sum,pr_id) values('"+Mlist.get(counter)+"','"+Mprice.get(counter)+"','"+prQuantity.get(counter)+"','"+prStatus.get(counter)+"',"+prid+")";
    			  System.out.println(sql);
    			  System.out.println("the value is in DBManager"+Mlist.get(counter)); 
			      System.out.println("the value is in DBManager"+Mprice.get(counter));
			      System.out.println("the value is in DBManager"+prQuantity.get(counter));
			      System.out.println("the value is in DBManager"+prStatus.get(counter));
    		 st.executeUpdate(sql);
    		  
    		  }
    		  
    	  }
    	  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	  
		return empty;
    	  
      }
     /* public static void PrIDINSERT(int prId){
    	  con=(Connection) DBConnection.gettConnection();
    	  try{
    		  Statement st=(Statement)con.createStatement();
    		  String sql="insert into purchasingrequsition (pr_id) values("+prId+") ";
    		  System.out.println(sql);
    		  st.executeUpdate(sql);
    	  }
    	  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
      }    */
      // TEXT SHOWING FOR THE PARTIAL INVENTORY DATA TABLE 
      // HERE IS FOR ORDER TABLE 
      public static ArrayList<InventoryGoodsRecipts> showOrderId(int OrderId){
		  ArrayList<InventoryGoodsRecipts> empty=new ArrayList<InventoryGoodsRecipts>();
              InventoryGoodsRecipts pr=null;
		  try{

		  
		  con=(Connection)DBConnection.getConnection();
		  
			  Statement st=(Statement)con.createStatement();
			  String sql="select order_id  from ordertable where order_id="+OrderId+" ";
			  System.out.println(sql);
			  st.executeQuery(sql);
			  ResultSet rs=st.executeQuery(sql);
			  while(rs.next()){
				  pr=new InventoryGoodsRecipts();
				 System.out.println(rs.getInt("order_id"));
				 pr.setOrderId(rs.getInt("order_id"));
				//  pr.setName(rs.getString("order_type"));
				empty.add(pr);
			  }
		  
		  }
		  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  
		  return empty;
		
		  
	  
}
      // FOR THE PRODUCTION TABLE
      public static ArrayList<InventoryGoodsRecipts> showProductionId(int ProductionId){
		  ArrayList<InventoryGoodsRecipts> empty=new ArrayList<InventoryGoodsRecipts>();
              InventoryGoodsRecipts pr=null;
		  try{

		  
		  con=(Connection)DBConnection.getConnection();
		  
			  Statement st=(Statement)con.createStatement();
			  String sql="select po_mrp_area from productionorder where po_no="+ProductionId+" ";
			  System.out.println(sql);
			  st.executeQuery(sql);
			  ResultSet rs=st.executeQuery(sql);
			  while(rs.next()){
				  pr=new InventoryGoodsRecipts();
				//  System.out.println(rs.getString("b_name"));
				  pr.setName(rs.getString("po_mrp_area"));
				empty.add(pr);
			  }
		  
		  }
		  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  
		  return empty;
		
		  
	  
}  // FOR BIN ID 
      public static ArrayList<InventoryGoodsRecipts> showPrId(int PrID){
 		  ArrayList< InventoryGoodsRecipts> empty=new ArrayList<InventoryGoodsRecipts>();
               InventoryGoodsRecipts pr=null;
 		  try{

 		  
 		  con=(Connection)DBConnection.getConnection();
 		  
 			  Statement st=(Statement)con.createStatement();
 			  String sql="select partial_name from prtable where pr_id="+PrID+" ";
 			  System.out.println(sql);
 			  st.executeQuery(sql);
 			  ResultSet rs=st.executeQuery(sql);
 			  while(rs.next()){
 				  pr=new InventoryGoodsRecipts();
 			//	 System.out.println(rs.getString("bin_name"));
 				  pr.setName(rs.getString("partial_name"));
 				empty.add(pr);
 			  }
 		  
 		  }
 		  catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
 		  
 		  return empty;
 		
 		  
 	  
 } 
    //  Comparing name to reteriving the ids FOr Partial Tables
      public static int SeclectorOrderId(String OrderType){
    	  con=(Connection)DBConnection.getConnection();
    	 int id=0;
    	 ResultSet rs=null;
    

  
  try{
	  Statement st=(Statement) con.createStatement();
	  String sql="select order_id  from ordertable where  order_type='"+OrderType+"'";
	  System.out.println(sql);
	   rs=st.executeQuery(sql);
	  while(rs.next()){

		  id=rs.getInt("order_id");
		 
		  
	  
	
	  }
  }
  catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  
return id;
  
}  
      public static int SelectorProductionId(String Pname){
    	  con=(Connection)DBConnection.getConnection();
    	 int id=0;
    	 ResultSet rs=null;
    

  
  try{
	  Statement st=(Statement) con.createStatement();
	  String sql="select po_no  from productionorder where  po_mrp_area='"+Pname+"'";
	  System.out.println(sql);
	   rs=st.executeQuery(sql);
	  while(rs.next()){

		  id=rs.getInt("po_no");
		 
		  
	  
	
	  }
  }
  catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  
return id;
  
}  
      public static int SelectorPrId(String PrName){
    	  con=(Connection)DBConnection.getConnection();
    	 int id=0;
    	 ResultSet rs=null;
    

  
  try{
	  Statement st=(Statement) con.createStatement();
	  String sql="select pr_id from prtable where  partial_name='"+PrName+"'";
	  System.out.println(sql);
	   rs=st.executeQuery(sql);
	  while(rs.next()){

		  id=rs.getInt("pr_id");
		 
		  
	  
	
	  }
  }
  catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  
return id;
  
}  
      
      public static void PartialInventoryInsert(int  MtId,int MtQuantity,int bindId,int BatchId){
    	  
    	  con=(Connection)DBConnection.getConnection();
    	  try{
    		  Statement st=(Statement)con.createStatement();
    		  String sql="Insert into partialinventory (m_no,material_quantity,bin_id,b_id)values("+MtId+","+MtQuantity+","+bindId+","+BatchId+")";
    		  System.out.println(sql);
    		  st.executeUpdate(sql);
    		  
    	  }
    	  catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    	  
    	  
      }
     
      
      
      //***************************************GOOODS RECIPETS IDS INSERTING HERE *********************************\\
     
      
      
      public static void InventoryGoodRecipetInsert(int orderId ,int ProductionId,int PrId,String deliveydate ){
  		con=(Connection) DBConnection.getConnection();
  		try{
  			Statement st=(Statement)con.createStatement();
  			String sql="insert into goodsrecipt (order_id,po_no,pr_id,gr_delevery_date)value("+orderId+","+ProductionId+","+PrId+",'"+deliveydate+"')";
  		    System.out.println(sql);
  			st.executeUpdate(sql);
  		}
  		catch (SQLException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  	    }
      
      
      
      
      //*************************************** SENDING DATA TO OTHER PAGE AS BELOW THERE ******************************
      
      
      
        public static ArrayList<InventoryGoodsRecipts> ShowGoodReciptIDs(){
      	ArrayList<InventoryGoodsRecipts> empty=new ArrayList<InventoryGoodsRecipts>();
      InventoryGoodsRecipts pr=null;
      	con=(Connection)DBConnection.getConnection();
		  try{
			  Statement st=(Statement) con.createStatement();
			  String sql="SELECT gr_no,order_id,po_no,pr_id FROM goodsrecipt WHERE gr_no=(SELECT MAX(gr_no) FROM goodsrecipt)";
			  System.out.println(sql);
			  st.executeQuery(sql);
			  ResultSet rs=st.executeQuery(sql);
			  while(rs.next()){
				  pr=new InventoryGoodsRecipts();
				  
				  System.out.println(rs.getInt("gr_no"));
				  System.out.println(rs.getInt("order_id"));
				  System.out.println(rs.getInt("po_no"));
				  System.out.println(rs.getInt("pr_id"));
				
				  pr.setGrNo(rs.getInt("gr_no"));
				  pr.setOrderId(rs.getInt("order_id"));
				  pr.setProductionOrder(rs.getInt("po_no"));
				  pr.setPrId(rs.getInt("pr_id"));
				  empty.add(pr);
				  
				  
			  }
			  
		  }
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      	
		  System.out.println(empty);
			return empty;
			
			
      	
      }
        
        //*********************************************Show data into Modal*****************************
        
        
        public static ArrayList<purchasingRequsition> ModalShow(int prId){
  		  ArrayList<purchasingRequsition> empty=new ArrayList<purchasingRequsition>();
          purchasingRequsition pr=null;
  	con=(Connection)DBConnection.getConnection();
  	try{
  		Statement st=(Statement)con.createStatement();
  		String sql="select pr_id,m_no ,pr_quantity,material_price from purchasingrequsition where pr_id="+prId+"";
  		System.out.print(sql);
  		ResultSet rs=st.executeQuery(sql);
  		while(rs.next()){
  			pr=new purchasingRequsition();
  			
  			System.out.println(rs.getInt("m_no"));
  			
  			System.out.println("data show"+rs.getInt("pr_quantity"));
  		pr.setPrId(rs.getInt("pr_id"));
  		pr.setMaterialNo(rs.getInt("m_no"));
  		pr.setPrQuantity(rs.getInt("pr_quantity"));
  		pr.setMprice(rs.getInt("material_price"));
  		empty.add(pr);
  		}
  	}
  	catch (SQLException e) {
  		// TODO Auto-generated catch block
  		e.printStackTrace();
  	}
  	
  	
  	
  	return empty;
  	
  }
        
        public static ArrayList<partialInventory> ModalArray(ArrayList<String>  Mlist,ArrayList<String> Mprice,ArrayList<String> prQuantity,ArrayList<String> prBinId,ArrayList<String> prBatchId,int GrId){
      	  
      	  ArrayList<partialInventory> empty=new ArrayList<partialInventory>();
      	  String sql=null;
      	  con=(Connection) DBConnection.getConnection();
      	  try{
      		 
      		  Statement st=(Statement)con.createStatement();
      		  for (int counter=0; counter<Mlist.size(); counter++){
      			   sql="insert into partialinventory(m_no,material_price,material_quantity,bin_id,b_id,gr_no) values('"+Mlist.get(counter)+"','"+Mprice.get(counter)+"','"+prQuantity.get(counter)+"','"+prBinId.get(counter)+"','"+prBatchId.get(counter)+"',"+GrId+")";
      			  System.out.println(sql);
      			  System.out.println("the value is in DBManager"+Mlist.get(counter)); 
  			      System.out.println("the value is in DBManager"+Mprice.get(counter));
  			      System.out.println("the value is in DBManager"+prQuantity.get(counter));
  			    System.out.println("the value is in DBManager"+prBinId.get(counter));
  			  System.out.println("the value is in DBManager"+prBatchId.get(counter));
  			   
      		 st.executeUpdate(sql);
      		  
      		  }
      		  
      	  }
      	  catch (SQLException e) {
  				// TODO Auto-generated catch block
  				e.printStackTrace();
  			}
      	  
  		return empty;
      	  
        }
         /////////////********************* INSERTION FOR THE PARTIAL GOODS ISSUESS **********************\\\\\\\\\\
           
            
        public static void partailIssuess(int  prId,int OrdeId,int invid){
    		con=(Connection) DBConnection.getConnection();
    		try{
    			Statement st=(Statement) con.createStatement();
    			String sql="insert into partialissues(pr_id,order_id,pInv_id) value("+prId+","+OrdeId+","+invid+")";
    			System.out.print(sql);
    			st.executeUpdate(sql);
    			
    		}
    		catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    	
    }  
        //******* RETERIVING THE IDS FOR THE GOODS ISSUES TABLE IN THE PARTIAL ISSUES FORM *******\\\\\\\\\\\\\
        
        
        
        public static ArrayList<partialIssues> ShowPurchasingRId(int PrId){
  		  ArrayList<partialIssues> empty=new ArrayList<partialIssues>();
            partialIssues pr=null;
  	con=(Connection)DBConnection.getConnection();
  	try{
  		Statement st=(Statement)con.createStatement();
  		String sql="select dummy_data_name from purchasingrequsition where id="+PrId+"";
  		System.out.print(sql);
  		ResultSet rs=st.executeQuery(sql);
  		while(rs.next()){
  			pr=new partialIssues();
  			pr.setName(rs.getString("dummy_data_name"));
  		
  		empty.add(pr);
  		}
  	}
  	catch (SQLException e) {
  		// TODO Auto-generated catch block
  		e.printStackTrace();
  	}
  	
  	
  	
  	return empty;
  	
  } 
                      //////////************* NOW FOR ORDER TABLE ***************\\\\\\\\\\\\\\
      
        
        
        public static ArrayList<partialIssues> ShowOrderId(int OrderId){
    		  ArrayList<partialIssues> empty=new ArrayList<partialIssues>();
              partialIssues pr=null;
    	con=(Connection)DBConnection.getConnection();
    	try{
    		Statement st=(Statement)con.createStatement();
    		String sql="select order_type from ordertable where order_id="+OrderId+"";
    		System.out.print(sql);
    		ResultSet rs=st.executeQuery(sql);
    		while(rs.next()){
    			pr=new partialIssues();
    			pr.setName(rs.getString("order_type"));
    		
    		empty.add(pr);
    		}
    	}
    	catch (SQLException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	
    	
    	
    	return empty;
    	
      }    
                  //////////////// RETERIVING DATA FOR THE PARTIAL INVENTORY IDS\\\\\\\\\\\\\\\\\\\

        
        public static ArrayList<partialIssues> ShowInventoryID(int InvID){
  		  ArrayList<partialIssues> empty=new ArrayList<partialIssues>();
            partialIssues pr=null;
  	con=(Connection)DBConnection.getConnection();
  	try{
  		Statement st=(Statement)con.createStatement();
  		String sql="select dummy_name from partialinventory where pInv_id="+InvID+"";
  		System.out.print(sql);
  		ResultSet rs=st.executeQuery(sql);
  		while(rs.next()){
  			pr=new partialIssues();
  			pr.setName(rs.getString("dummy_name"));
  		
  		empty.add(pr);
  		}
  	}
  	catch (SQLException e) {
  		// TODO Auto-generated catch block
  		e.printStackTrace();
  	}
  	
  	
  	
  	return empty;
  	
    }            
        
        
         /////////////////////////////////////Showing IDS HERE\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        
        
        public static int SelectorPurchasingRId(String prDummydata ){
      	  con=(Connection)DBConnection.getConnection();
      	 int id=0;
      	 ResultSet rs=null;
      

    
    try{
  	  Statement st=(Statement) con.createStatement();
  	  String sql="select id from purchasingrequsition where dummy_data_name='"+prDummydata+"'";
  	  System.out.println(sql);
  	   rs=st.executeQuery(sql);
  	  while(rs.next()){

  		  id=rs.getInt("id");
  		 
  		  
  	  
  	
  	  }
    }
    catch (SQLException e) {
  		// TODO Auto-generated catch block
  		e.printStackTrace();
  	}
    
  return id;
    
  }  
        
                           ////////////////  showing Order Ids  \\\\\\\\\\\\\\\\\\
        
        
        public static int SelectorOrderId(String OrderDummy ){
      	  con=(Connection)DBConnection.getConnection();
      	 int id=0;
      	 ResultSet rs=null;
      

    
    try{
  	  Statement st=(Statement) con.createStatement();
  	  String sql="select order_id  from ordertable  where order_type='"+OrderDummy +"'";
  	  System.out.println(sql);
  	   rs=st.executeQuery(sql);
  	  while(rs.next()){
          
  		 
  		  id=rs.getInt("order_id");
  		 
  		  
  	  
  	
  	  }
    }
    catch (SQLException e) {
  		// TODO Auto-generated catch block
    	e.printStackTrace();
  	}
    
  return id;
    
  }  
        
        ////// NOw Showing the Partial InVEntory Ids From the Name
        
        
        public static int SelectorInventoryId(String InvDummy ){
        	  con=(Connection)DBConnection.getConnection();
        	 int id=0;
        	 ResultSet rs=null;
        

      
      try{
    	  Statement st=(Statement) con.createStatement();
    	  String sql="select pInv_id  from partialinventory  where dummy_name='"+InvDummy+"'";
    	  System.out.println(sql);
    	   rs=st.executeQuery(sql);
    	  while(rs.next()){
            
    		  
    		  id=rs.getInt("pInv_id");
    		 
    		  
    	  
    	
    	  }
      }
      catch (SQLException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
      
    return id;
      
    }  
                           // SHOWING OUT THE DATA TO THE SECOND PAGE \\
        
        
        
        public static ArrayList<partialIssues> showPartialIssueIds(){
        	ArrayList<partialIssues> empty=new ArrayList<partialIssues>();
        	partialIssues pr=null;
        	con=(Connection)DBConnection.getConnection();
  		  try{
  			  Statement st=(Statement) con.createStatement();
  			  String sql="SELECT p_issues_id,pr_id,order_id,pInv_id FROM partialissues WHERE p_issues_id=(SELECT MAX(p_issues_id) FROM partialissues)";
  			  System.out.println(sql);
  			  st.executeQuery(sql);
  			  ResultSet rs=st.executeQuery(sql);
  			  while(rs.next()){
  				  pr=new partialIssues();
  				  System.out.println("        Inventory Ids here           "+rs.getInt("pInv_id"));
  				  pr.setPissuesId(rs.getInt("p_issues_id"));
  				  pr.setPurchasingRId(rs.getInt("pr_id"));
  				  pr.setOrderId(rs.getInt("order_id"));
  				  pr.setPIventoryId(rs.getInt("pInv_id"));
  				  empty.add(pr);
  				  
  				  
  			  }
  			  
  		  }
  		catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
  		  System.out.println(empty);
			return empty;
			
			
        	
        }   
        
        ////////// SHOWING THE DATA IN THE MODAL FOR THE PARTIAL INVENTORY TABLE 
        
        
        
        public static ArrayList<partialInventory> ModalShowforGoodsIssues(int InVid){
    		  ArrayList<partialInventory> empty=new ArrayList<partialInventory>();
            partialInventory pr=null;
    	con=(Connection)DBConnection.getConnection();
    	try{
    		Statement st=(Statement)con.createStatement();
    		String sql="select gr_no,m_no ,material_quantity,material_price from partialinventory where gr_no="+InVid+"";
    		System.out.print(sql);
    		ResultSet rs=st.executeQuery(sql);
    		while(rs.next()){
    			pr=new partialInventory();
    			
    			System.out.println(rs.getInt("m_no"));
    			
    			System.out.println("data show"+rs.getInt("material_quantity"));
    		pr.setPInvId(rs.getInt("gr_no"));
    		pr.setMaterialId(rs.getInt("m_no"));
    		pr.setMaterialQuantity(rs.getInt("material_quantity"));
    		pr.setMprice(rs.getInt("material_price"));
    		empty.add(pr);
    		}
    	}
    	catch (SQLException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
        
        return empty;
        
}
        
                                //// DATA STORING FOR THE GOODS ISSUES TABLE IN THE MODAL \\\\

        
        
        public static ArrayList<GoodsIssues> GIModalArray(ArrayList<String>  Mlist,ArrayList<String> Mprice,ArrayList<String> prQuantity,ArrayList<String> GiLocation,int PGId){
        	  
        	  ArrayList<GoodsIssues> empty=new ArrayList<GoodsIssues>();
        	  String sql=null;
        	  con=(Connection) DBConnection.getConnection();
        	  try{
        		 
        		  Statement st=(Statement)con.createStatement();
        		  for (int counter=0; counter<Mlist.size(); counter++){
        			   sql="insert into goodsissue(m_no,m_price,m_quantity,gi_storage_loction,p_issues_id) values('"+Mlist.get(counter)+"','"+Mprice.get(counter)+"','"+prQuantity.get(counter)+"','"+GiLocation.get(counter)+"',"+PGId+")";
        			  System.out.println(sql);
        			  System.out.println("the value is in DBManager"+Mlist.get(counter)); 
    			      System.out.println("the value is in DBManager"+Mprice.get(counter));
    			      System.out.println("the value is in DBManager"+prQuantity.get(counter));
    		//	    System.out.println("the value is in DBManager"+prBinId.get(counter));
    		//	  System.out.println("the value is in DBManager"+prBatchId.get(counter));
    			   
        		 st.executeUpdate(sql);
        		  
        		  }
        		  
        	  }
        	  catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
        	  
    		return empty;
        	  
          }
        
        public static int SelectQuantity(String  MtNumber){
      	  con=(Connection)DBConnection.getConnection();
      	 int id=0;
      	 ResultSet rs=null;
      
      	 int val=Integer.parseInt(MtNumber);
    
    try{
  	  Statement st=(Statement) con.createStatement();
  	  String sql="select material_quantity  from partialinventory where  m_no="+val+"";
  	  System.out.println(sql);
  	   rs=st.executeQuery(sql);
  	  while(rs.next()){

  		  id=rs.getInt("material_quantity");
  		 
  		  
  	  
  	
  	  }
    }
    catch (SQLException e) {
  		// TODO Auto-generated catch block
  		e.printStackTrace();
  	}
    
  return id;
    
  }  
        
        
        
        public static void updateQuantity(String mtNo ,int Mtquantity){
        	
        	 con=(Connection)DBConnection.getConnection();
        	 
        	 int MtId=Integer.parseInt(mtNo);
        	
        	 
        	 try{
        	Statement st=(Statement)con.createStatement();
        	
        	String Updatequery="update partialinventory set material_quantity="+Mtquantity+" where m_no="+mtNo+"";
        	st.executeUpdate(Updatequery);
        	System.out.println(Updatequery);
        	 }
        	 catch (SQLException e) {
        	  		// TODO Auto-generated catch block
        	  		e.printStackTrace();
        	  	}
        	 
        	 
        	 
        }  
        
        
           //  SHOW THE IDS NAME BY USING THE IDS FOR ORDER TABLE \\
                         //  FOR THE CUSTOMER TABLE \\
        
      
        public static ArrayList<mainProduction> billMaterialId(int BmId){
  		  ArrayList<mainProduction> empty=new ArrayList<mainProduction>();
                mainProduction pr=null;
  		  try{

  		  
  		  con=(Connection)DBConnection.getConnection();
  		  
  			  Statement st=(Statement)con.createStatement();
  			  String sql="select bm_name from billofmaterial where bm_id="+BmId+" ";
  			  System.out.print(sql);
  			  st.executeQuery(sql);
  			  ResultSet rs=st.executeQuery(sql);
  			  while(rs.next()){
  				  pr=new mainProduction();
  				  pr.setName(rs.getString("bm_name"));
  				empty.add(pr);
  			  }
  		  
  		  }
  		  catch (SQLException e) {
  				// TODO Auto-generated catch block
  				e.printStackTrace();
  			}
  		  
  		  return empty;
  		
  		  }
  		  /*
  	  
  }
        public static ArrayList<OrderTable> ProductIdText(int PidText){
    		  ArrayList< OrderTable> empty=new ArrayList<OrderTable>();
                  OrderTable pr=null;
    		  try{

    		  
    		  con=(Connection)DBConnection.gettConnection();
    		  
    			  Statement st=(Statement)con.createStatement();
    			  String sql="select product_name from product where product_id="+PidText+" ";
    			  System.out.print(sql);
    			  st.executeQuery(sql);
    			  ResultSet rs=st.executeQuery(sql);
    			  while(rs.next()){
    				  pr=new OrderTable();
    				  pr.setName(rs.getString("product_name"));
    				empty.add(pr);
    			  }
    		  
    		  }
    		  catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    		  
    		  return empty;
    		
    		  
    	  
    } 
        
        // FOR ORDER TABLE GIVING STRING VALUES TO TAKE NAME 
        
        
        public static int customerID(String Orname){
      	  con=(Connection)DBConnection.gettConnection();
      	 int id=0;
      	 ResultSet rs=null;
      
	
	  
	  try{
		  Statement st=(Statement) con.createStatement();
		  String sql="select customer_id  from customer where  customer_name='"+Orname+"'";
		  System.out.println(sql);
		   rs=st.executeQuery(sql);
		  while(rs.next()){

			  id=rs.getInt("customer_id");
			 
			  
		  
		
		  }
	  }
	  catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  
	return id;
	  
}  
*/  
        
        //FOR BILL MATERIAL ID RETERIVIND
        
        public static int billMaterialID(String prMaterialno){
        	
      	  con=(Connection)DBConnection.getConnection();
      	 int id=0;
      	 ResultSet rs=null;
      
	
	  
	  try{
		  Statement st=(Statement) con.createStatement();
		  String sql="select bm_id  from billofmaterial where  bm_name='"+prMaterialno+"'";
		  System.out.println(sql);
		   rs=st.executeQuery(sql);
		  while(rs.next()){

			  id=rs.getInt("bm_id");
			 
			  
		  
		
		  }
	  }
	  catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  
	return id;
	  
}  


       // INSERTING DAATA IN ORDER TABLE
        public static void InsertINtoMainProduction(int productionOId,int OrderId ){
    		con=(Connection) DBConnection.getConnection();
    		try{
    			Statement st=(Statement)con.createStatement();
    			String sql="insert into mainproduction(po_no,order_id)value("+productionOId+","+OrderId+")";
    		    System.out.println(sql);
    			st.executeUpdate(sql);
    		}
    		catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    	}
        
        public static ArrayList<mainProduction> showOrderIds(){
        	ArrayList<mainProduction> empty=new ArrayList<mainProduction>();
        	mainProduction pr=null;
        	con=(Connection)DBConnection.getConnection();
  		  try{
  			  Statement st=(Statement) con.createStatement();
  			  String sql="SELECT id,po_no,order_id FROM mainproduction WHERE id=(SELECT MAX(id) FROM mainproduction)";
  			  System.out.println(sql);
  			  st.executeQuery(sql);
  			  ResultSet rs=st.executeQuery(sql);
  			  while(rs.next()){
  				  pr=new mainProduction();
  				  System.out.println(rs.getInt("order_id"));
  				  System.out.println(rs.getInt("po_no"));
  				  System.out.println(rs.getInt("id"));
  				
  				  pr.setMpdId(rs.getInt("id"));
  				  pr.setProductionOId(rs.getInt("po_no"));
  				  pr.setOrderId(rs.getInt("order_id"));
  				 
  				  empty.add(pr);
  				  
  				  
  			  }
  			  
  		  }
  		catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return empty;
        
        
        }
        public static void AddProductionOrder(ArrayList<Integer>  Mlist,ArrayList<String> prQuantity,int prid){
      	  
      	 
      	  String sql=null;
      	  con=(Connection) DBConnection.getConnection();
      	  try{
      		 System.out.println(Mlist.size()+"the val is in 1");
      		 
      		  Statement st=(Statement)con.createStatement();
      		  for (int counter=1; counter<Mlist.size(); counter++){
      			   sql="insert into productionorder(bm_id,po_quantity,id) values('"+Mlist.get(counter)+"','"+prQuantity.get(counter)+"',"+prid+")";
      			  System.out.println(sql);
      			  System.out.println("the value is in DBManager"+Mlist.get(counter)); 
  			      
  			      System.out.println("the value is in DBManager"+prQuantity.get(counter));
  			    
      		 st.executeUpdate(sql);
      		  
      		  }
      		  
      	  }
      	  catch (SQLException e) {
  				// TODO Auto-generated catch block
  				e.printStackTrace();
  			}
      	  
  		
      	  
        }
        
        public static ArrayList<mainProduction> proName(int BmId){
  		  ArrayList<mainProduction> empty=new ArrayList<mainProduction>();
                mainProduction pr=null;
  		  try{

  		  
  		  con=(Connection)DBConnection.getConnection();
  		  
  			  Statement st=(Statement)con.createStatement();
  			  String sql="select product_name from product where product_id="+BmId+" ";
  			  System.out.print(sql);
  			  st.executeQuery(sql);
  			  ResultSet rs=st.executeQuery(sql);
  			  while(rs.next()){
  				  pr=new mainProduction();
  				  pr.setName(rs.getString("product_name"));
  				empty.add(pr);
  			  }
  		  
  		  }
  		  catch (SQLException e) {
  				// TODO Auto-generated catch block
  				e.printStackTrace();
  			}
  		  
  		  return empty;
  		
  		  }
        
        

        public static void AddProductionInventory(ArrayList<String>  Mlist,ArrayList<String> prQuantity,int id,int oId){
        	  
         	 
        	  String sql=null;
        	  con=(Connection) DBConnection.getConnection();
        	  try{
        		 System.out.println(Mlist.size()+"the val is in 1");
        		 
        		  Statement st=(Statement)con.createStatement();
        		  for (int counter=1; counter<Mlist.size(); counter++){
        			   sql="insert into productionInventory(Product_name,product_qty,pi_id,order_no) values('"+Mlist.get(counter)+"','"+prQuantity.get(counter)+"',"+id+","+oId+")";
        			  System.out.println(sql);
        			  System.out.println("the value is in DBManager"+Mlist.get(counter)); 
    			      
    			      System.out.println("the value is in DBManager"+prQuantity.get(counter));
    			    
        		 st.executeUpdate(sql);
        		  
        		  }
        		  
        	  }
        	  catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
        	  
    		
        	  
          } 
       
        
                               // SHOW PURCHASING RECORS FOR THE TABLE AS  \\
     	public static ArrayList<purchasingReqshowdata> showRecoord(){
			ArrayList<purchasingReqshowdata> aclist=new ArrayList<purchasingReqshowdata>();
			 Connection con = (Connection) DBConnection.getConnection();
			 purchasingReqshowdata a=null;
		        try{    
		        	Statement stm = (Statement) con.createStatement();
				   String query="SELECT  p.pr_id,m.order_id,m.po_no,ma.m_name, p.pr_quantity,p.material_price,v.vendor_name FROM prtable m,purchasingrequsition p, material ma,vendor v  WHERE m.pr_id=p.pr_id AND ma.m_no=p.m_no AND v.vendor_id=m.vendor_id order by pr_id desc "  ;
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	
		               a=new purchasingReqshowdata();
		               a.setProductionOId(rs.getInt("p.pr_id"));
		               a.setProductionId(rs.getInt("m.po_no"));
		               a.setMaterialName(rs.getString("ma.m_name"));
		               a.setPrQuantity(rs.getInt("p.pr_quantity"));
		               a.setMaterialPrice(rs.getInt("p.material_price"));
		               a.setVendorName(rs.getString("v.vendor_name"));
		               a.setOrderId(rs.getInt("order_id"));
		               
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     
	
			
		}
        
                     /// FOR THE Partial Inventory
     	  
     	public static ArrayList<ShowPartialInventoryData> showInventoryRecord(){
			ArrayList<ShowPartialInventoryData> aclist=new ArrayList<ShowPartialInventoryData>();
			 Connection con = (Connection) DBConnection.getConnection();
			 ShowPartialInventoryData a=null;
		        try{    
		           Statement stm = (Statement) con.createStatement();
				   String query="SELECT g.gr_no,g.order_id,g.po_no,g.gr_quantity,g.gr_stock,g.pr_id,p.material_quantity,p.material_price,m.m_name,b.b_name,bi.bin_name"+
                  "     FROM goodsrecipt g,partialinventory p,material m,batch b, BIN bi  "+
                  " WHERE p.gr_no=g.gr_no AND m.m_no=p.m_no AND  b.b_id=p.b_id AND bi.bin_id=p.bin_id order by gr_no desc ";
				   		
				   		
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	System.out.println(rs.getString("bi.bin_name"));
		              a=new ShowPartialInventoryData();
		              a.setOrderID(rs.getInt("g.order_id"));
		              a.setPoId(rs.getInt("g.po_no"));
		              a.setGrQuantity(rs.getInt("g.gr_quantity"));
		              a.setGrStock(rs.getInt("g.gr_stock"));
		              a.setPrId(rs.getInt("g.pr_id"));
		              a.setMaterialQuantity(rs.getInt("p.material_quantity"));
		              a.setMaterialPrice(rs.getInt("p.material_price"));
		              a.setMaterialName(rs.getString("m.m_name"));
		              a.setBatchName(rs.getString("b.b_name"));
		              a.setBinNmae(rs.getString("bi.bin_name"));
		              a.setGr_no(rs.getInt("g.gr_no"));
		              
		              
		               
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     
	
			
		}
     	
     	// show data for good issues here 
     	public static ArrayList<showGoodsIssue> showGoodData(){
			ArrayList<showGoodsIssue> aclist=new ArrayList<showGoodsIssue>();
			 Connection con = (Connection) DBConnection.getConnection();
			 showGoodsIssue a=null;
		        try{    
		           Statement stm = (Statement) con.createStatement();
				   String query="SELECT p.p_issues_id,p.pr_id ,p.ORDER_ID,p.pInv_id,i.m_quantity,i.gi_date,i.b_id,i.bin_id,i.m_price,m.m_name FROM partialissues p, goodsissue i,material m WHERE p.p_issues_id=i.p_issues_id AND i.m_no=m.m_no order by p_issues_id desc ";
				   		
				   		
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	
		             a=new showGoodsIssue();
		             a.setpIssuesId(rs.getInt("p.p_issues_id"));
		             a.setPurchasingId(rs.getInt("p.pr_id"));
		             a.setOrderId(rs.getInt("p.ORDER_ID"));
		             a.setpInvId(rs.getInt("p.pInv_id"));
		             a.setmQuantity(rs.getInt("i.m_quantity"));
		             a.setGiDate(rs.getString("i.gi_date"));
		             a.setBatchId(rs.getInt("i.b_id"));
		             a.setBinId(rs.getInt("i.bin_id"));
		             a.setMprice(rs.getInt("i.m_price"));
		             a.setMName(rs.getString("m.m_name"));
		              
		               
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     
	
			
		}
        
     	public  static void InsertIntoTOdolist(int poNoId,int order){
    		con=(Connection) DBConnection.getConnection();
    		int active=1;
    		try {
    			Statement st=(Statement) con.createStatement();
    			 String sql="insert into Mptodolistt(po_no,order_id,active)values("+poNoId+","+order+","+active+")";
    			System.out.println(sql);
    			st.executeUpdate(sql);
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		
    		
    	}
     	
    	public static ArrayList<MpTodolist> InsertTodoList(){
			ArrayList<MpTodolist> aclist=new ArrayList<MpTodolist>();
			int i=1;
			 Connection con = (Connection) DBConnection.getConnection();
			 MpTodolist a=null;
		        try{    
		           Statement stm = (Statement) con.createStatement();
				   String query="select mdid,po_no,order_id FROM mptodolistt where active="+i+" ";
				   		
				   		
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	
		             a=new MpTodolist();
		             a.setMptdId(rs.getInt("mdid"));
		             a.setOrderId(rs.getInt("order_id"));
		             a.setPonOId(rs.getInt("po_no"));
		              
		               
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     
	
			
		}
    	
    	
    	public static ArrayList<todomodel> ShowTodoList(int poNoId){
			ArrayList<todomodel> aclist=new ArrayList<todomodel>();
		
			 Connection con = (Connection) DBConnection.getConnection();
			 todomodel a=null;
		        try{    
		           Statement stm = (Statement) con.createStatement();
				   String query="SELECT po_no,bm_id,po_quantity, order_id FROM productionorder WHERE id="+poNoId+" ";
				   		
				   		
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	
		             a=new todomodel();
		             System.out.println(rs.getInt("bm_id"));
		             System.out.println(rs.getInt("po_quantity"));
		             
		             System.out.println(rs.getInt("order_id"));
		            a.setPoNo(rs.getInt("po_no"));
		            a.setMtNo(rs.getInt("bm_id"));
		            a.setMtQuantity(rs.getInt("po_quantity"));
		            a.setOrderNo(rs.getInt("order_id"));
		             
		              
		               
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     
	
			
		}
    	
    	public static ArrayList<materialData> MaterialCurd(){
			ArrayList<materialData> aclist=new ArrayList<materialData>();
			 Connection con = (Connection) DBConnection.getConnection();
			 int on=1;
			 materialData a=null;
		        try{    
		           Statement stm = (Statement) con.createStatement();
				   String query="Select *  from material where active="+on+"";
				   		
				   		
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	
		             a=new materialData();
		             a.setMt_No(rs.getInt("m_no"));
		             a.setMt_name(rs.getString("m_name"));
		             a.setMt_weight(rs.getInt("m_weight"));
		             a.setMt_price(rs.getInt("m_price"));
		         //    a.setMt_movivgPrice(rs.getInt("m_moving_price"));
		             a.setMt_desc(rs.getString("m_description"));
		             a.setMt_typeNo(rs.getInt("mt_no"));
		             
		              
		               
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     
	
			
		}
    	
    	  
        public static void updateMaterialData(int mo ,String mname ,int mweight, int mprice, String mdesc,int mtno ){
        	
        	 con=(Connection)DBConnection.getConnection();
        	 
        	 
        	
        	 
        	 try{
        	Statement st=(Statement)con.createStatement();
        	
        	String Updatequery="update material set m_name='"+mname+"', m_weight="+mweight+",m_price="+mprice+"  ,m_description='"+mdesc+"',mt_no="+mtno+" where m_no="+mo+"";
        	st.executeUpdate(Updatequery);
        	System.out.println(Updatequery);
        	 }
        	 catch (SQLException e) {
        	  		// TODO Auto-generated catch block
        	  		e.printStackTrace();
        	  	}
        	 
        	 
        	 
        }  
        ////// DELETING THE IDS HERE 
        
        public static void DeleteMaterialData(int mo){
        	
       	 con=(Connection)DBConnection.getConnection();
       	 
       	 int off=0;
       	
       	 
       	 try{
       	Statement st=(Statement)con.createStatement();
       	
       	String Updatequery="update material set active="+off+"  where m_no="+mo+"";
       	st.executeUpdate(Updatequery);
       	System.out.println(Updatequery);
       	 }
       	 catch (SQLException e) {
       	  		// TODO Auto-generated catch block
       	  		e.printStackTrace();
       	  	}
       	 
       	 
       	 
       }  
        public static ArrayList<materialType> MaterialTypeCurd(){
			ArrayList<materialType> aclist=new ArrayList<materialType>();
			 Connection con = (Connection) DBConnection.getConnection();
			 int on=1;
			 materialType a=null;
		        try{    
		           Statement stm = (Statement) con.createStatement();
				   String query="Select *  from materialtype where active="+on+"";
				   		
				   		
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	
		            	System.out.println(rs.getInt("mt_no"));
		            
		             a=new materialType();
		             a.setMt_no(rs.getInt("mt_no"));
		             a.setMt_name(rs.getString("mt_name"));
		             a.setMt_description(rs.getString("mt_description"));
		              
		               
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     
	
			

        }
        
        //UPDATING MATERIAL TYPE
        public static void updateMaterialType(int mo ,String mname ,String mweight){
        	
       	 con=(Connection)DBConnection.getConnection();
       	 
       	 
       	
       	 
       	 try{
       	Statement st=(Statement)con.createStatement();
       	
       	String Updatequery="update materialtype set mt_name='"+mname+"', mt_description='"+mweight+"' where mt_no="+mo+"";
       	st.executeUpdate(Updatequery);
       	System.out.println(Updatequery);
       	 }
       	 catch (SQLException e) {
       	  		// TODO Auto-generated catch block
       	  		e.printStackTrace();
       	  	}
       	 
       	 
       	 
       }
        
        public static void DeleteMaterialType(int mo){
        	
          	 con=(Connection)DBConnection.getConnection();
          	 
          	 int off=0;
          	
          	 
          	 try{
          	Statement st=(Statement)con.createStatement();
          	
          	String Updatequery="update materialtype set active="+off+"  where mt_no="+mo+"";
          	st.executeUpdate(Updatequery);
          	System.out.println(Updatequery);
          	 }
          	 catch (SQLException e) {
          	  		// TODO Auto-generated catch block
          	  		e.printStackTrace();
          	  	}
          	 
          	 
          	 
          } 
        
        
        public static ArrayList<Vendor> VendorCurd(){
			ArrayList<Vendor> aclist=new ArrayList<Vendor>();
			 Connection con = (Connection) DBConnection.getConnection();
			 int on=1;
			Vendor a=null;
		        try{    
		           Statement stm = (Statement) con.createStatement();
				   String query="Select *  from vendor where active="+on+"";
				   		
				   		
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	
		             a=new Vendor();
		           a.setVId(rs.getInt("vendor_id"));
		           a.setVName(rs.getString("vendor_name"));
		           a.setCompanyTile(rs.getString("company_title"));
		           a.setCompanyAddress(rs.getString("company_address"));
		           a.setVcontact(rs.getInt("contact_number"));
		           a.setVmobile(rs.getInt("mobile_number"));
		           a.setVNtn(rs.getInt("ntn_number"));
		           a.setBankName(rs.getString("bank_name"));
		           a.setBankAccount(rs.getInt("bank_account"));
		             
		              
		               
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     
	
			
		}
        // Vendor UpDating
        
        public static void updateVendor(int vid ,String vname ,String companytitle,String address,int cno,int mno,int ntn,String bname,int baccount  ){
        	
          	 con=(Connection)DBConnection.getConnection();
          	 
          	 
          	
          	 
          	 try{
          	Statement st=(Statement)con.createStatement();
          	
          	String Updatequery="update vendor set vendor_name='"+vname+"', company_title='"+companytitle+"',company_address='"+address+"', contact_number="+cno+",mobile_number="+mno+",ntn_number="+ntn+" ,bank_name='"+bname+"',bank_account="+baccount+" where vendor_id="+vid+"  ";
          	st.executeUpdate(Updatequery);
          	System.out.println(Updatequery);
          	 }
          	 catch (SQLException e) {
          	  		// TODO Auto-generated catch block
          	  		e.printStackTrace();
          	  	}
          	 
          	 
          	 
          }
        
        public static void DeleteVendor(int mo){
        	
         	 con=(Connection)DBConnection.getConnection();
         	 
         	 int off=0;
         	
         	 
         	 try{
         	Statement st=(Statement)con.createStatement();
         	
         	String Updatequery="update vendor set active="+off+"  where vendor_id="+mo+"";
         	st.executeUpdate(Updatequery);
         	System.out.println(Updatequery);
         	 }
         	 catch (SQLException e) {
         	  		// TODO Auto-generated catch block
         	  		e.printStackTrace();
         	  	}
         	 
         	 
         	 
         } 
        public static ArrayList<roleuser> getaccountPermission(String role){
      	  String nam=null;
      	  ArrayList<roleuser> permit=new ArrayList<roleuser>();
      	  roleuser r=null;
      	  
      		 Connection con = (Connection) DBConnection.getConnection();
			        try{    
		        	Statement stm = (Statement) con.createStatement();
				   String query="SELECT p.permission_name FROM permission p, role r  WHERE  r.permission_id=p.id AND  r.role_name='"+role+"'";
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	r=new roleuser();
		            r.setRolename(rs.getString("permission_name"));
		            permit.add(r);
		            }}
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           
 
       	  
       	  
 return permit;
      	  
        }
        
        

        public static String getEmployeeRole( String empuser){
       String roles=null;
				 Connection con = (Connection) DBConnection.getConnection();
				int val=0;
			        try{    
			        	Statement stm = (Statement) con.createStatement();
					   String query="SELECT role FROM employee WHERE uname='"+empuser+"'";
			            System.out.println(query);
			            ResultSet rs=stm.executeQuery(query);
			            while(rs.next()){
			            	
			            	roles=(rs.getString("role"));
			            	
			            }}
			            
			        
			      catch(SQLException ex){
			          ex.printStackTrace();
			      }
			           return roles;
		
       	 
       	 
        }
				

    	
        public static boolean  getlogin(String id,String password){
      	  boolean	user=false;
    				 Connection con = (Connection) DBConnection.getConnection();
         			        try{    
    			        	Statement stm = (Statement) con.createStatement();
    					   String query="SELECT uname,password FROM employee  where uname='"+id+"' AND password='"+password+"'";
    			            System.out.println(query);
    			            ResultSet rs=stm.executeQuery(query);
    			            while(rs.next()){
    			            rs.getString("uname");
    			            rs.getString("password");
    			            user=true;
    			            }}
    			            
    			        
    			      catch(SQLException ex){
    			          ex.printStackTrace();
    			      }
    			           return  user;
    		
            	 
            	 
             }
        
        
        // Showing material Ids here 
        public static ArrayList<materialData> ShowingMaterialId(int mId){
    		  ArrayList<materialData> empty=new ArrayList<materialData>();
                  materialData pr=null;
    		  try{

    		  
    		  con=(Connection)DBConnection.getConnection();
    		  
    			  Statement st=(Statement)con.createStatement();
    			  String sql="select m_name,m_price from material where m_no="+mId+" ";
    			  System.out.print(sql);
    			  st.executeQuery(sql);
    			  ResultSet rs=st.executeQuery(sql);
    			  while(rs.next()){
    				  pr=new materialData();
    				  pr.setMt_name(rs.getString("m_name"));
    				  pr.setMt_price(rs.getInt("m_price"));
    				
    				empty.add(pr);
    			  }
    		  
    		  }
    		  catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    		  
    		  return empty;
    		
    		  }
        
        // storing the material data name value by making comparing name and reteriving id int method to insert the data 
        
        
        public static int materialId(String MaterialName){
        	
      	  con=(Connection)DBConnection.getConnection();
      	 int id=0;
      	 ResultSet rs=null;
      
	
	  
	  try{
		  Statement st=(Statement) con.createStatement();
		  String sql="select m_no  from material where  m_name='"+MaterialName+"'";
		  System.out.println(sql);
		   rs=st.executeQuery(sql);
		  while(rs.next()){

			  id=rs.getInt("m_no");
			 
			  
		  
		
		  }
	  }
	  catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  
	return id;
	  
}     
        /////////// VALIDATIONS FOR THE PURCHASING REQUISITION DATA HERE \\\\\\\\\\\\\\
        
        

        public static boolean purchasingIdvalidation(int mId){
              	  boolean val=false;
              	  Connection con = (Connection) DBConnection.getConnection();
   			        try{    
   		        	Statement stm = (Statement) con.createStatement();
   				   String sql="select m_name,m_price from material where m_no="+mId+" ";
   		            System.out.println(sql);
   		            ResultSet rs=stm.executeQuery(sql);
   		            	if(rs.next()){
   		            		val=true;
   		            		
   		            		
   		            	}
   		            	else{
   		            		
   		            		val=false;
   		            	}
   			        }
   		            
   		        
   		      catch(SQLException ex){
   		          ex.printStackTrace();
   		      } 
        
                
              	  
              	  
  				return val;
              	  
              	  
              	  
                
        }
        
        
                                        //CHEAKING FOR THE VENDOR IDS \\
        
        
        
        public static boolean VendorIdVal(int VandorId){
        	  boolean val=false;
        	  Connection con = (Connection) DBConnection.getConnection();
			        try{    
		        	Statement stm = (Statement) con.createStatement();
				   String sql="select vendor_name from vendor where vendor_id="+VandorId+"";
		            System.out.println(sql);
		            ResultSet rs=stm.executeQuery(sql);
		            	if(rs.next()){
		            		val=true;
		            		
		            		
		            	}
		            	else{
		            		
		            		val=false;
		            	}
			        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      } 
  
          
        	  
        	  
			return val;
        	  
        	  
        	  
          }
        
                       ///  VALIDATING OUT THE   ORDER ID \\\
        
        
        
        public static boolean OrderId(int OrderId){
      	  boolean val=false;
      	  Connection con = (Connection) DBConnection.getConnection();
			        try{    
		        	Statement stm = (Statement) con.createStatement();
				   String sql="select order_id from ordertable where order_id="+OrderId+"";
		            System.out.println(sql);
		            ResultSet rs=stm.executeQuery(sql);
		            	if(rs.next()){
		            		val=true;
		            		
		            		
		            	}
		            	else{
		            		
		            		val=false;
		            	}
			        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      } 

        
      	  
      	  
			return val;
      	  
      	  
      	  
        }
        
        public static boolean ProductionId(int pOId){
        	  boolean val=false;
        	  Connection con = (Connection) DBConnection.getConnection();
  			        try{    
  		        	Statement stm = (Statement) con.createStatement();
  				   String sql="select po_no from productionorder where po_no="+pOId+" ";
  		            System.out.println(sql);
  		            ResultSet rs=stm.executeQuery(sql);
  		            	if(rs.next()){
  		            		val=true;
  		            		
  		            		
  		            	}
  		            	else{
  		            		
  		            		val=false;
  		            	}
  			        }
  		            
  		        
  		      catch(SQLException ex){
  		          ex.printStackTrace();
  		      } 

          
        	  
        	  
  			return val;
        	  
        	  
        	  
          }
        
        
        /// NOW FOR THE PURCHASING REQUISITION ID CHEAKING HERE \\\\
        
        
        public static boolean PruchasingReqID(int prID ){
      	  boolean val=false;
      	  Connection con = (Connection) DBConnection.getConnection();
			        try{    
		        	Statement stm = (Statement) con.createStatement();
				   String sql="select pr_id  from prtable where pr_id="+prID+" ";
		            System.out.println(sql);
		            ResultSet rs=stm.executeQuery(sql);
		            	if(rs.next()){
		            		val=true;
		            		
		            		
		            	}
		            	else{
		            		
		            		val=false;
		            	}
			        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      } 

        
      	  
      	  
			return val;
      	  
      	  
      	  
        }
                      
        
        
        
                           /////// FOR Purchasing Requisition ID VAlidations\\\\\\\\\\
        
        
        public static boolean purchasingreqmainId(int prID ){
        	  boolean val=false;
        	  Connection con = (Connection) DBConnection.getConnection();
  			        try{    
  		        	Statement stm = (Statement) con.createStatement();
  				   String sql="select id from purchasingrequsition where pr_id="+prID+"";
  		            System.out.println(sql);
  		            ResultSet rs=stm.executeQuery(sql);
  		            	if(rs.next()){
  		            		val=true;
  		            		
  		            		
  		            	}
  		            	else{
  		            		
  		            		val=false;
  		            	}
  			        }
  		            
  		        
  		      catch(SQLException ex){
  		          ex.printStackTrace();
  		      } 

          
        	  
        	  
  			return val;
        	  
        	  
        	  
          }
        
        //                Partial Inventory ID VALIDATIONS 
        
        
        
 
        public static boolean PartialInventoryID(int pInV ){
      	  boolean val=false;
      	  Connection con = (Connection) DBConnection.getConnection();
			        try{    
		        	Statement stm = (Statement) con.createStatement();
				   String sql="select pInv_id from partialinventory where pInv_id="+pInV+"";
		            System.out.println(sql);
		            ResultSet rs=stm.executeQuery(sql);
		            	if(rs.next()){
		            		val=true;
		            		
		            		
		            	}
		            	else{
		            		
		            		val=false;
		            	}
			        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      } 

        
      	  
      	  
			return val;
      	  
        }

        
        
        
        public static boolean PurchsdingReqId1(int pInV ){
      	  boolean val=false;
      	  Connection con = (Connection) DBConnection.getConnection();
			        try{    
		        	Statement stm = (Statement) con.createStatement();
				   String sql="select id from purchasingrequsition where id="+pInV+"";
		            System.out.println(sql);
		            ResultSet rs=stm.executeQuery(sql);
		            	if(rs.next()){
		            		val=true;
		            		
		            		
		            	}
		            	else{
		            		
		            		val=false;
		            	}
			        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
					return val; 

        
      	  
        
        } 
        
        
        public static void AddProductionInventoryMain(int mpId, int orderId,int lot, String podate){
     	   
     		 Connection con;
     		 con=(Connection) DBConnection.getConnection();
     		 try {
     				Statement st=(Statement) con.createStatement();
     				String sql="insert into mainproductinventory(po_no,order_id,lot_id,po_date)values("+mpId+","+orderId+","+mpId+",'"+podate+"')";
     						 System.out.println(sql);
     				st.executeUpdate(sql);
     				
     				
     			} catch (SQLException e) {
     				// TODO Auto-generated catch block
     				e.printStackTrace();
     			}
     		
        	
        }
        public static int getmaxPi( ){
        	  int val=0;
        	  Connection con = (Connection) DBConnection.getConnection();
  			        try{    
  		        	Statement stm = (Statement) con.createStatement();
  				   String sql="select Max(id) from mainproductinventory";
  		            System.out.println(sql);
  		            ResultSet rs=stm.executeQuery(sql);
  		            	if(rs.next()){
  		            		val=rs.getInt("Max(id)");
  		            		
  		            		
  		            	}
  		            	
  			        }
  		            
  		        
  		      catch(SQLException ex){
  		          ex.printStackTrace();
  		      }
  					return val; 

        
}
        
        
        
        
        public static int SelectingVendor(int  PrId){
      	  con=(Connection)DBConnection.getConnection();
      	 int id=0;
      	 ResultSet rs=null;
      

    
    try{
  	  Statement st=(Statement) con.createStatement();
  	  String sql="SELECT vendor_id FROM prtable WHERE pr_id="+PrId+"";
  	  System.out.println(sql);
  	   rs=st.executeQuery(sql);
  	  while(rs.next()){

  		  id=rs.getInt("vendor_id");
  		 
  		  
  	  
  	
  	  }
    }
    catch (SQLException e) {
  		// TODO Auto-generated catch block
  		e.printStackTrace();
  	}
    
  return id;
    
  }  
        /*
        
        public static ArrayList<prdata> PrVendorName(int VandorId){
  		  
  		  ArrayList<prdata> empty=new ArrayList<prdata>();
  		  prdata pr=null;
  		  con=(Connection)DBConnection.getConnection();
  		  try{
  			  Statement st=(Statement) con.createStatement();
  			  String sql="select vendor_name from vendor where vendor_id="+VandorId+"";
  			  System.out.println(sql);
  			  st.executeQuery(sql);
  			  ResultSet rs=st.executeQuery(sql);
  			  while(rs.next()){
  				  pr=new prdata();
  				  pr.setName(rs.getString("vendor_name"));
  				  empty.add(pr);
  				  
  			  }
  			  
  		  }
  		  catch (SQLException e) {
  				// TODO Auto-generated catch block
  				e.printStackTrace();
  			}
  		return empty;
  		  
  	  
        



}    
*/
        // Inser Into Account ToDo List 
        
        
        public static void AccountTodolist(String VendorName , String amount,int prid){
    		int on=1;
    		con=(Connection) DBConnection.getConnection();
    		try{
    			Statement st=(Statement) con.createStatement();
    			String sql="insert into todolist(vendor,amount,pr_id,active) values('"+VendorName+"','"+amount+"',"+prid+","+on+") ";
    		    System.out.println(sql);
    		    st.executeUpdate(sql);
    		    
    		
    		}catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		
    	}
        
        public static String  SelectingVendorName(int  Vid){
        	  con=(Connection)DBConnection.getConnection();
        	 String  name="";
        	 ResultSet rs=null;
        

      
      try{
    	  Statement st=(Statement) con.createStatement();
    	  String sql="select vendor_name from vendor where vendor_id="+Vid+"";
    	  System.out.println(sql);
    	   rs=st.executeQuery(sql);
    	  while(rs.next()){

    	name=rs.getString("vendor_name");
    		 
    		  
    	  
    	
    	  }
      }
      catch (SQLException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
      
    return name;
      
    }  
        
        
        
        public static ArrayList<ShowAccountTodolist> showAccountTodoList(){
			ArrayList<ShowAccountTodolist> aclist=new ArrayList<ShowAccountTodolist>();
			 Connection con = (Connection) DBConnection.getConnection();
		
             ShowAccountTodolist a=null;
		        try{    
		           Statement stm = (Statement) con.createStatement();
				   String query="SELECT p.pr_id,p.vendor_id,m.m_name,v.vendor_name,g.gr_no,s.m_no,s.material_quantity,s.material_price,s.pInv_id"
				   		+ " FROM goodsrecipt g ,partialinventory s ,prtable p,vendor v, material m "
				   		+ " WHERE g.gr_no=(SELECT MAX(s.gr_no) FROM goodsrecipt WHERE g.gr_no=(SELECT MAX(gr_no) FROM partialinventory))"
				   		+ " AND  g.pr_id=(SELECT MAX(g.pr_id) FROM goodsrecipt WHERE g.pr_id=(SELECT MAX(p.pr_id) FROM goodsrecipt))"
				   		+ " AND p.vendor_id=v.vendor_id AND s.m_no=m.m_no";
				   		
				   		
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            a=new ShowAccountTodolist();	
		            	a.setPrId(rs.getInt("p.pr_id"));
		            	a.setVendorId(rs.getInt("p.vendor_id"));
		            	a.setVname(rs.getString("v.vendor_name"));
		            	a.setGoodReciptId(rs.getInt("g.gr_no"));
		            	a.setMaterialId(rs.getInt("s.m_no"));
		            	a.setMaterialQuantity(rs.getInt("s.material_quantity"));
		            	a.setMtPrice(rs.getInt("s.material_price"));
		            	a.setpInVId(rs.getInt("s.pInv_id"));
		            	a.setMname(rs.getString("m.m_name"));
		            	
		            	
		            
		           
		               
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     
	
			

        }
        
        public static ArrayList<Inventorydata> ShowInVentoryData(String  mName){
			ArrayList<Inventorydata> aclist=new ArrayList<Inventorydata>();
		
			 Connection con = (Connection) DBConnection.getConnection();
			Inventorydata a=null;
		        try{    
		           Statement stm = (Statement) con.createStatement();
				   String query="SELECT   p.m_no,SUM(p.pr_quantity),p.material_price,m.m_name FROM   purchasingrequsition p ,material m WHERE  p.m_no=m.m_no AND m.m_name='"+mName+"' GROUP BY m_no";
				   		
				   		
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	
		             a=new Inventorydata();
		             System.out.println(rs.getString("m.m_name"));
		             a.setmId(rs.getInt("p.m_no"));
		             a.setmQuantity(rs.getInt("SUM(p.pr_quantity)"));
		             a.setmPrice(rs.getInt("p.material_price"));
		             a.setMname(rs.getString("m.m_name"));
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     
	
			
		}
        
        
        
        
        public static ArrayList<showProduction> ShowProductionsData(){
			ArrayList<showProduction> aclist=new ArrayList<showProduction>();
		
			 Connection con = (Connection) DBConnection.getConnection();
			showProduction a=null;
		        try{    
		           Statement stm = (Statement) con.createStatement();
				   String query="SELECT p.po_no,pr.pr_id,gi.p_issues_id,gr.gr_no"
				   		+ " FROM productionorder p ,ordertable o, partialissues gi ,prtable pr,goodsrecipt gr"
				   		+ " WHERE p.order_id=o.order_id AND pr.order_id=o.order_id  AND gi.order_id=o.order_id AND gr.order_id=o.order_id";
				   		
				   		
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		           
		            	
		            	System.out.println(rs.getInt("p.po_no"));
		             a=new showProduction();
		             a.setPoId(rs.getInt("p.po_no"));
		             a.setPrId(rs.getInt("pr.pr_id"));
		             a.setPIssuesId(rs.getInt("gr.gr_no"));
		             a.setGoodIssue(rs.getInt("gi.p_issues_id"));
		           
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     }
        
        
        public static void ActiveOff(int mo){
        	
          	 con=(Connection)DBConnection.getConnection();
          	 
          	 int off=0;
          	
          	 
          	 try{
          	Statement st=(Statement)con.createStatement();
          	
          	String Updatequery="update mptodolistt set active="+off+"  where po_no="+mo+"";
          	st.executeUpdate(Updatequery);
          	System.out.println(Updatequery);
          	 }
          	 catch (SQLException e) {
          	  		// TODO Auto-generated catch block
          	  		e.printStackTrace();
          	  	}
          	 
          	 
          	 
          }  
        public static ArrayList<inventorytodolistdata> InventoryToDolist(){
			ArrayList<inventorytodolistdata> aclist=new ArrayList<inventorytodolistdata>();
			int i=1;
			 Connection con = (Connection) DBConnection.getConnection();
		inventorytodolistdata a=null;
		        try{    
		           Statement stm = (Statement) con.createStatement();
				   String query="select intd_id,vendor_name,pr_id FROM inventorytodolist where active="+i+" ";
				   		
				   		
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	
		             a=new inventorytodolistdata();
		             a.setInvtodoId(rs.getInt("intd_id"));
		             a.setVendorName(rs.getString("vendor_name"));
		             a.setPrId(rs.getInt("pr_id"));
		           
		               
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     
	
			
		}
        public static int PrIDReteriving(){
      	  con=(Connection)DBConnection.getConnection();
      	 int id=0;
      	 ResultSet rs=null;
      

    
    try{
  	  Statement st=(Statement) con.createStatement();
  	  String sql="SELECT pr_id FROM prtable WHERE pr_id=(SELECT MAX(pr_id)FROM prtable)";
  	  System.out.println(sql);
  	   rs=st.executeQuery(sql);
  	  while(rs.next()){

  		  id=rs.getInt("pr_id");
  		 
  		  
  	  
  	
  	  }
    }
    catch (SQLException e) {
  		// TODO Auto-generated catch block
  		e.printStackTrace();
  	}
    
  return id;
    
  }
        public static void InsertIntoInventoryTodlist(String vendorName,int prId ){
    		int on=1;
    		con=(Connection) DBConnection.getConnection();
    		try{
    			Statement st=(Statement) con.createStatement();
    			String sql="insert into inventorytodolist(vendor_name,pr_id,active) values('"+vendorName+"',"+prId+","+on+") ";
    		    System.out.println(sql);
    		    st.executeUpdate(sql);
    		    
    		
    		}catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		
    	}
        
        public static ArrayList<inventorymodal> TodolistInventoryShow(int prId){
			ArrayList<inventorymodal> aclist=new ArrayList<inventorymodal>();
			
			 Connection con = (Connection) DBConnection.getConnection();
	         inventorymodal a=null;
		        try{    
		           Statement stm = (Statement) con.createStatement();
				   String query="SELECT p.m_no , p.pr_quantity,p.material_price,m.m_name"+ 
                  " FROM purchasingrequsition p ,material m"+
                  " WHERE pr_id="+prId+" AND p.m_no=m.m_no";
				   		
				   		
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	
		             a=new inventorymodal();
		            a.setMno(rs.getInt("p.m_no"));
		            a.setMtQuantity(rs.getInt("p.pr_quantity"));
		            a.setPrice(rs.getInt("p.material_price"));
		            a.setName(rs.getString("m.m_name"));
		               
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     
	
			
		} 
        
        
        public static void ActiveOffforInventory(int mo){
        	
         	 con=(Connection)DBConnection.getConnection();
         	 
         	 int off=0;
         	
         	 
         	 try{
         	Statement st=(Statement)con.createStatement();
         	
         	String Updatequery="update inventorytodolist set active="+off+"  where pr_id="+mo+"";
         	st.executeUpdate(Updatequery);
         	System.out.println(Updatequery);
         	 }
         	 catch (SQLException e) {
         	  		// TODO Auto-generated catch block
         	  		e.printStackTrace();
         	  	}
         	 
         	 
         	 
         } 
        


    
}