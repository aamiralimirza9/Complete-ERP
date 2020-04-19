package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.Account;
import com.model.AccountOpen;
import com.model.AccountSubtype;
import com.model.CashVoucher;
import com.model.Journal;
import com.model.Ledger;
import com.model.OrderTable;
import com.model.TrailBalance;
import com.model.bank;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.model.roleuser;
import com.model.todolist;




public class DBManager {
	 	
	public static ArrayList<AccountOpen> getAccount(){
		ArrayList<AccountOpen> emplist=new ArrayList<AccountOpen>();
		AccountOpen l=null;
		 
		 Connection con = (Connection) DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				 String sql=" select * from accounttype";
				System.out.println(sql);
				st.executeQuery(sql);
				ResultSet rs=st.executeQuery(sql);
				while(rs.next()){
					
					 l=new AccountOpen();
					 l.setType(rs.getString("type"));
					emplist.add(l);
					
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return emplist; 
	 }
		
		
	
		
		
	


 public static int getsubtype( String data){
	 int subtype=0;
		ArrayList<AccountSubtype> emplist=new ArrayList<AccountSubtype>();
		AccountOpen l=null;
	
		 Connection con = (Connection) DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				 String sql=" select id from accounttype where type='"+data+"' ";
				System.out.println(sql);
				st.executeQuery(sql);
				ResultSet rs=st.executeQuery(sql);
				while(rs.next()){
					
					
					subtype=rs.getInt("id");
					
					
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		 		return subtype;			 
		 					}	 
	 

	public static ArrayList<AccountSubtype> getAccounttype(int getId){
		ArrayList<AccountSubtype> acsubtypelist=new ArrayList<AccountSubtype>();
		AccountSubtype acsubtype=null;
		 
		java.sql.Connection con=DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				 String sql=" select subtype from accountsubtype where type='"+getId+"'";
				System.out.println(sql);
				st.executeQuery(sql);
				ResultSet rs=st.executeQuery(sql);
				while(rs.next()){
					 acsubtype=new AccountSubtype();
					 System.out.println(rs.getString("subtype"));
					acsubtype.setName(rs.getString("subtype"));
					
					acsubtypelist.add(acsubtype);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return acsubtypelist; 
	 }
	
	public static void createAccount( int acNoInt, String acTitle,String acType, String acSubtype,int acAmountInt){
		Connection con = (Connection) DBConnection.getConnection();
		 try {
				Statement st=(Statement) con.createStatement();
				String sql="insert into generalledgerlist(account_name,ac_type,ac_subtype,ac_no)values('"+acTitle+"','"+acType+"','"+acSubtype+"','"+acNoInt+"')";
				System.out.println(sql);
				st.executeUpdate(sql);
		
				 String sql1="CREATE TABLE `enterprise resource planning`"
				 		+ "."+ acTitle+"(  id INT(255) NOT NULL AUTO_INCREMENT,"
				 		+ "ac_title VARCHAR(255),"
				 		+ "Debit INT(255),"
				 		+ "Credit INT(255),"
				 		+ "Balance INT(255),"
				 		+ "tr_date DATE,"
				 		+ "PRIMARY KEY (id));";
				
				 System.out.println(sql1);
				st.execute(sql1);
				 String sql2=" insert into "+acTitle+" (Balance)values('"+acAmountInt+"') ";
				 st.execute(sql2);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		
		
	}
	public static void addDbJournal(ArrayList<String> acList,ArrayList<String> acList2,String v,String d,int getMax){
		Connection con = (Connection) DBConnection.getConnection();
		 int sNo=0;
		 int balance=0;
		 int debit=0;
		 int credit=0;
		
		 int total=0;
			
		 try {
				Statement st=(Statement) con.createStatement();
				for (int counter = 0; counter < acList.size(); counter++) { 
					
					 System.out.println("the value is in DBManager"+acList.get(counter)); 
			         System.out.println("the value is in DBManager"+acList2.get(counter)); 
					 String sql=" insert into "+acList.get(counter)+" (Debit,ac_title,tr_date)values('"+acList2.get(counter)+"','"+v+"','"+d+"') ";
					 System.out.println(sql);
					 st.executeUpdate(sql);
			        
			      	 sNo=DBManager.getSno(acList.get(counter));
					 balance=DBManager.getBalance(acList.get(counter), sNo);
					 System.out.println("balance is"+balance);
					 credit=DBManager.getCredit(acList.get(counter));
					 debit=DBManager.getDebit(acList.get(counter));
					 total=balance+debit-credit;
					 System.out.println("total is "+total);
					 DBManager.updateAccount(acList.get(counter), total, sNo);
					 String sql2="insert into journalreciept(debit_name,debit_amount,journal_no)values('"+acList.get(counter)+"',"+acList2.get(counter)+","+getMax+")";
						System.out.println(sql2);
					st.executeUpdate(sql2);
					
					      }
		
		
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
		
		 public static void addCrJournal(ArrayList<String> acList3, ArrayList<String> acList4,String v,String d,int getMax ){
			 int sNo=0;
			 int balance=0;
			 int debit=0;
			 int credit=0;
			 int total=0;
			 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					for (int counter = 0; counter < acList3.size(); counter++) { 
						 String sql=" insert into "+acList3.get(counter)+" (ac_title,Credit,tr_date)values('"+v+"','"+acList4.get(counter)+"','"+d+"') ";
							System.out.println(sql);
							st.executeUpdate(sql);
				            System.out.println("the value is in DBManager"+acList3.get(counter)); 
				            System.out.println("the value is in DBManager"+acList4.get(counter));
					      	 sNo=DBManager.getSno(acList3.get(counter));
							 balance=DBManager.getBalance(acList3.get(counter), sNo);
							 System.out.println("balance is"+balance);
							 credit=DBManager.getCredit(acList3.get(counter));
							 debit=DBManager.getDebit(acList3.get(counter));
							 total=balance-debit+credit;
							 System.out.println("total is "+total);
							 DBManager.updateAccount(acList3.get(counter), total, sNo);
							 String sql11="insert into journalreciept(debit_name,credit_amount,journal_no)values('"+acList3.get(counter)+"',"+acList4.get(counter)+","+getMax+")";
								System.out.println(sql11);
								st.executeUpdate(sql11);
							
				          
				      }
			
			
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}		}
			 
		 
	 public static void addcash(String acdate,String acname, int acamount, String acmemo,String mode,String tdate){
			 String sql=null;
			
			 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
					if(mode.equals("reciept")){			
					
						sql="insert into cash(ac_title,Debit,tr_date)values('"+acname+"',"+acamount+",'"+tdate+"')";
							System.out.println(sql);
						st.executeUpdate(sql);
						
					}
				if(mode.equals("payment")){			 
					sql="insert into cash(ac_title,Credit,tr_date)values('"+acname+"',"+acamount+",'"+tdate+"')";
						System.out.println(sql);
					st.executeUpdate(sql);}
			         }
			
			
				catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 
			 
			 
		 }
	 public static int getSno(String account1){
		 Connection con = (Connection) DBConnection.getConnection();
	       int id=0;
	      try{    
	            Statement stm = (Statement) con.createStatement();
	            String query="SELECT MAX(id) FROM "+account1+" ";
	            ResultSet rs=stm.executeQuery(query);
	            while(rs.next()){
	                 id= rs.getInt("MAX(id)");
	            }}
	            
	         
	      catch(SQLException ex){
	          ex.printStackTrace();
	      }
	           
	            return id;
	           
	   
	   }
	 public static int getBalance(String ac_name1, int s_no1){
		 Connection con = (Connection) DBConnection.getConnection();
	        int balance=0;
	        int sno=s_no1-1;
	        try{    
	            Statement stm = (Statement) con.createStatement();
	            String query="Select Balance from "+ac_name1+"  WHERE id="+sno+"";
	            System.out.println(query);
	            ResultSet rs=stm.executeQuery(query);
	            if(rs.next()){
	                 balance= rs.getInt("Balance");
	                System.out.println(balance);
	                return balance;
	            }}
	            
	        
	      catch(SQLException ex){
	          ex.printStackTrace();
	      }
	           
	             return balance;
	     
	    
	    }
	 public static int getDebit( String account1){
		    int debit = 0;
		    Connection con = (Connection) DBConnection.getConnection();
		    try{    
		            Statement stm = (Statement) con.createStatement();
		            String query="Select Debit from "+account1+" WHERE id=(SELECT MAX(id) FROM "+account1+" )";
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		               debit= rs.getInt("Debit");
		            }}
		            
		         
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           
		            return debit;
		     
		     
		    }
		     
		     
		    
		    public static int getCredit( String account1){
		    	 Connection con = (Connection) DBConnection.getConnection();
		    	int credit = 0;
		    try{    
		            Statement stm = (Statement) con.createStatement();
		            String query="Select Credit from "+account1+" WHERE id=(SELECT MAX(id) FROM "+account1+" )";
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		               credit= rs.getInt("Credit");
		            }}
		            
		         
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           
		            return credit;
		     
		     
		    }
		
		
		    public static void updateAccount(String account1,int total1,int s_no1){
		    	 Connection con = (Connection) DBConnection.getConnection();
		        try{    
		                Statement stm = (Statement) con.createStatement();
		                String query="Update "+account1+"  Set Balance="+total1+"   WHERE id="+s_no1+"";
		                System.out.println(query);
		                int rs=stm.executeUpdate(query);
		                }
		                
		             
		          catch(SQLException ex){
		              ex.printStackTrace();
		          }
		               
		                
		         
		        }
		    public static void createTrailBalance( int acNoInt,String acTitle, String acType,int acAmount,int no){
		    	 Connection con = (Connection) DBConnection.getConnection();
		    	 String query=null;
		        try{    
		                Statement stm = (Statement) con.createStatement();
		            	if(acType.equals("Assests") || acType.equals("Expenses") || acType.equals("Capital withdraw")){
		    				

			                query="insert into trailbalance(ac_no,ac_name,Debit,gl_no)values("+acNoInt+",'"+acTitle+"',"+acAmount+","+no+") ";
			                System.out.println(query);
			                stm.executeUpdate(query);	
		    				
		    			}
		            	if(acType.equals("Liability") || acType.equals("Revenue") || acType.equals("Capital")){
		    				

			                 query="insert into trailbalance(ac_no,ac_name,Credit,gl_no)values("+acNoInt+",'"+acTitle+"',"+acAmount+","+no+") ";
			                System.out.println(query);
			                stm.executeUpdate(query);	
		    				
		    			}
		            	
		                }
		                
		             
		          catch(SQLException ex){
		              ex.printStackTrace();
		          }
		               
		                
		         
		        }
	      
			 public static int getTotalBalance(String ac_name1){
				 Connection con = (Connection) DBConnection.getConnection();
			        int balance=0;
			       
			        try{    
			            Statement stm = (Statement) con.createStatement();
			            String query="Select Balance from "+ac_name1+" where id=(select max(id) from "+ac_name1+") ";
			            System.out.println(query);
			            ResultSet rs=stm.executeQuery(query);
			            if(rs.next()){
			                 balance= rs.getInt("Balance");
			                System.out.println(balance);
			                return balance;
			            }}
			            
			        
			      catch(SQLException ex){
			          ex.printStackTrace();
			      }
			           
			             return balance;
			     
			    
			    }

			 			public static void updateTrail(ArrayList<String> acList,ArrayList<String> acList2){
			 				int sum=0;
			 				String type=null;
			 				String query=null;
			 				String name=null;
			 				Connection con = (Connection) DBConnection.getConnection();
			 				 try {
			 						Statement st=(Statement) con.createStatement();
			 						for (int counter = 0; counter < acList.size(); counter++) { 
			 							int no=DBManager.getnoGl(acList.get(counter));
			 							sum= DBManager.getTotalBalance(acList.get(counter));
			 							
			 							type=DBManager.getAccountType(acList.get(counter));
			 						       
			 							name=acList.get(counter).replaceAll("\\s","");
			 					
			 								System.out.println("type is"+type);
			 				            	if(type.equals("Assests") || type.equals("Expenses") || type.equals("Capital withdraw")){
			 				    				

			 					                query="update trailbalance set Debit="+sum+" where gl_no="+no+"";
			 					                System.out.println(query);
			 					                st.executeUpdate(query);	
			 				    				
			 				    			}
			 				            	if(type.equals("Liability") || type.equals("Revenue") || type.equals("Capital")){

			 					                query="update trailbalance set Credit="+sum+" where gl_no="+no+"";
			 					                System.out.println(query);
			 					                st.executeUpdate(query);	

			 				    				
			 				    			}

			 							
			 							
			 							
			 							
			 				      }
			 			
			 			
			 				} catch (SQLException e) {
			 					// TODO Auto-generated catch block
			 					e.printStackTrace();
			 				}
			 						}
			 						
			
			
			
		
		
	   		
			 public static String getAccountType(String acname){
				 
				 Connection con = (Connection) DBConnection.getConnection();
			        String type=null;
			    	String getname=null;
			        try{    
			        	getname=acname.replaceAll("\\s","");
			            Statement stm = (Statement) con.createStatement();
			            String query="SELECT ac_type FROM generalledgerlist WHERE account_name='"+getname+"' ";
			            System.out.println(query);
			            ResultSet rs=stm.executeQuery(query);
			            while(rs.next()){
			               type =rs.getString("ac_type");
			                System.out.println(type);
			             
			            }}
			            
			        
			      catch(SQLException ex){
			          ex.printStackTrace();
			      }
			           
			             return type;
			     
			    
		
				 
			 }
			public static ArrayList<Account> getAccountname(String n){
				ArrayList<Account> aclist=new ArrayList<Account>();
				 Connection con = (Connection) DBConnection.getConnection();
			       Account a=null;
			        try{    
			        	Statement stm = (Statement) con.createStatement();
					   String query="SELECT account_name FROM generalledgerlist WHERE ac_no='"+n+"' ";
			            System.out.println(query);
			            ResultSet rs=stm.executeQuery(query);
			            while(rs.next()){
			            	a=new Account();
			               a.setAcTitle(rs.getString("account_name"));
			                aclist.add(a);
			             
			            }}
			            
			        
			      catch(SQLException ex){
			          ex.printStackTrace();
			      }
			           return aclist;
			            
			     
		
				
			}
			public static ArrayList<Account> showRecoord(String nam){
				ArrayList<Account> aclist=new ArrayList<Account>();
				 Connection con = (Connection) DBConnection.getConnection();
			       Account a=null;
			        try{    
			        	Statement stm = (Statement) con.createStatement();
					   String query="SELECT * FROM generalledgerlist  ";
			            System.out.println(query);
			            ResultSet rs=stm.executeQuery(query);
			            while(rs.next()){
			            	a=new Account();
			               a.setAcTitle(rs.getString("account_name"));
			               a.setAcno(rs.getInt("ac_no"));
			               a.setAcType(rs.getString("ac_type"));
			               a.setAcSubtype(rs.getString("ac_subtype"));
			                aclist.add(a);
			             
			            }}
			            
			        
			      catch(SQLException ex){
			          ex.printStackTrace();
			      }
			           return aclist;
			            
			     
		
				
			}
			
			public static void editGl(String no,String name,String type,String subtype){
				
				 Connection con = (Connection) DBConnection.getConnection();
			        try{    
			                Statement stm = (Statement) con.createStatement();
			                String query="Update generalledgerlist  Set account_name='"+name+"',ac_type='"+type+"',ac_subtype='"+subtype+"' WHERE ac_no="+no+"";
			                System.out.println(query);
			                int rs=stm.executeUpdate(query);
			                }
			                
			             
			          catch(SQLException ex){
			              ex.printStackTrace();
			          }
			        
				
				
			}	
		
			public static void delGel(String no){
				
				 Connection con = (Connection) DBConnection.getConnection();
			        try{    
			                Statement stm = (Statement) con.createStatement();
			                String query1="delete from trailbalance where ac_no='"+no+"'";
			                System.out.println(query1);
			                stm.executeUpdate(query1);
			                String query="delete from generalledgerlist where ac_no='"+no+"'";
			                System.out.println(query);
			                stm.executeUpdate(query);
			                }
			                
			             
			          catch(SQLException ex){
			              ex.printStackTrace();
			          }
			        
				
				
			}
			
			public static void addDbCash(String acname,int acamount ){
				Connection con = (Connection) DBConnection.getConnection();
				 int sNo=0;
				 int balance=0;
				 int debit=0;
				 int credit=0;
				
				 int total=0;
					
				 try {
						Statement st=(Statement) con.createStatement();
		 
							 String sql=" insert into "+acname+" (Debit)values("+acamount+") ";
							 System.out.println(sql);
							 st.executeUpdate(sql);
					         System.out.println("the value is in DBManager"+acname); 
					         System.out.println("the value is in DBManager"+acamount); 
				
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
			
			public static void addcrCash(String acname,int acamount ){
				Connection con = (Connection) DBConnection.getConnection();
				 int sNo=0;
				 int balance=0;
				 int debit=0;
				 int credit=0;
				
				 int total=0;
					
				 try {
						Statement st=(Statement) con.createStatement();
		 
							 String sql=" insert into "+acname+" (Credit)values("+acamount+") ";
							 System.out.println(sql);
							 st.executeUpdate(sql);
					         System.out.println("the value is in DBManager"+acname); 
					         System.out.println("the value is in DBManager"+acamount); 
			
				
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
			
			
			
			
			public static void updateTrail(String acList,int acList2){
 				int sum=0;
 				String type=null;
 				String query=null;
 				String name=null;
 				Connection con = (Connection) DBConnection.getConnection();
 				 try {
 						Statement st=(Statement) con.createStatement();
 						sum= DBManager.getTotalBalance(acList);
 							
 							
 						       
 							
 					
 				
 								

 					                query="update trailbalance set Debit="+sum+" where ac_name='"+acList+"'";
 					                System.out.println(query);
 					                st.executeUpdate(query);	
 				    				
 				    			
 				            	


 				    				
 				    			

 							
 							
 							
 							
 				      
 			
 			
 				} catch (SQLException e) {
 					// TODO Auto-generated catch block
 					e.printStackTrace();
 				}
 						}
			public static void updateCrTrail(String acList,int acList2){
 				int sum=0;
 				String type=null;
 				String query=null;
 				String name=null;
 				Connection con = (Connection) DBConnection.getConnection();
 				 try {
 						Statement st=(Statement) con.createStatement();
 						sum= DBManager.getTotalBalance(acList);
 							
 							
 						       
 							
 					
 				
 								

 					               
 				    			
 				            	

 					                query="update trailbalance set Credit="+sum+" where ac_name='"+acList+"'";
 					                System.out.println(query);
 					                st.executeUpdate(query);	

 				    				
 				    			

 							
 							
 							
 							
 				      
 			
 			
 				} catch (SQLException e) {
 					// TODO Auto-generated catch block
 					e.printStackTrace();
 				}
 						}
			
			public static void updateDbTrail(String acList,int acList2){
 				int sum=0;
 				String type=null;
 				String query=null;
 				String name=null;
 				Connection con = (Connection) DBConnection.getConnection();
 				 try {
 						Statement st=(Statement) con.createStatement();
 						sum= DBManager.getTotalBalance(acList);
 							
 							
 						       
 							
 					
 				
 								

 					                query="update trailbalance set Debit="+sum+" where ac_name='"+acList+"'";
 					                System.out.println(query);
 					                st.executeUpdate(query);	
 				    				
 				    			
 				            	


 				    				
 				    			

 							
 							
 							
 							
 				      
 			
 			
 				} catch (SQLException e) {
 					// TODO Auto-generated catch block
 					e.printStackTrace();
 				}
 						}


 						


			public static String getAcname(String n){
				String name=null;
				Connection con = (Connection) DBConnection.getConnection();
			       Account a=null;
			        try{    
			        	Statement stm = (Statement) con.createStatement();
					   String query="SELECT account_name FROM generalledgerlist WHERE ac_no='"+n+"' ";
			            System.out.println(query);
			            ResultSet rs=stm.executeQuery(query);
			            while(rs.next()){
			            
			               name=rs.getString("account_name");
			               
			             
			            }}
			            
			        
			      catch(SQLException ex){
			          ex.printStackTrace();
			      }
			           return name;
			            
			     
		
				
			}
			public static ArrayList<Ledger> getLedger(String acname){
				ArrayList<Ledger> ledgerlist=new ArrayList<Ledger>();
				 Connection con = (Connection) DBConnection.getConnection();
			     Ledger l=null;
			        try{    
			        	Statement stm = (Statement) con.createStatement();
					   String query="SELECT * FROM "+acname+"  ";
			            System.out.println(query);
			            ResultSet rs=stm.executeQuery(query);
			            while(rs.next()){
			            	l=new Ledger();
			            	l.setId(rs.getInt("id"));
			            	System.out.println(rs.getInt("id"));
			            	l.setDebit(rs.getInt("Debit"));
			            	l.setCredit(rs.getInt("Credit"));
			            	l.setBalance(rs.getInt("Balance"));
			            	ledgerlist.add(l);
			            }}
			            
			        
			      catch(SQLException ex){
			          ex.printStackTrace();
			      }
			           return ledgerlist;
		
			
			



			}
			


			public static ArrayList<TrailBalance> getTrailBlanace(){
				ArrayList<TrailBalance> trail=new ArrayList<TrailBalance>();
				 Connection con = (Connection) DBConnection.getConnection();
				 TrailBalance t=null;
			        try{    
			        	Statement stm = (Statement) con.createStatement();
					   String query="SELECT * FROM trailbalance  ";
			            System.out.println(query);
			            ResultSet rs=stm.executeQuery(query);
			            while(rs.next()){
			            	t=new TrailBalance();
			            	t.setId(rs.getInt("id"));
			            	t.setAcname(rs.getString("ac_name"));
			            	t.setAcno(rs.getInt("ac_no"));
			            	t.setCredit(rs.getInt("Credit"));
			            	t.setDebit(rs.getInt("Debit"));
			            	trail.add(t);
			            }}
			            
			        
			      catch(SQLException ex){
			          ex.printStackTrace();
			      }
			           return trail;
		
			
			



			}
			

			 public static void addJournalVoucher(String d,String v, String t,String comment,String jvname){
					 String sql=null;
					
					 Connection con = (Connection) DBConnection.getConnection();
					 try {
							Statement st=(Statement) con.createStatement();
						
							
								sql="insert into journalvoucher(journal_date,transaction_no,total,comment,names)values('"+d+"','"+v+"','"+t+"','"+comment+"','"+jvname+"')";
									System.out.println(sql);
								st.executeUpdate(sql);
								
							}
					  
				      catch(SQLException ex){
				          ex.printStackTrace();
				      }
			


}

			 public static void addCashReciept( ArrayList<String> acList, ArrayList<String> acList2, ArrayList<String> acList3, ArrayList<String> acList4, int getMax){
				 

					 
				         Connection con = (Connection) DBConnection.getConnection();
						 try {
								Statement st=(Statement) con.createStatement();
									int list1=acList.size();
									int list2=acList2.size();
									int val=list2-list1;
									System.out.println(val);
									System.out.println(list1);
									System.out.println(list2);
									
								for (int counter = 0; counter < acList3.size(); counter++) { 
									
									 System.out.println("the value is in DBManager"+acList.get(counter)); 
							         System.out.println("the value is in DBManager"+acList2.get(counter));			
							         String sql="insert into journalreciept(debit_name,debit_amount,journal_no)values('"+acList.get(counter)+"',"+acList2.get(counter)+","+getMax+")";
										System.out.println(sql);
									st.executeUpdate(sql);
									
									  String sql11="insert into journalreciept(credit_name,credit_amount,journal_no)values('"+acList3.get(counter)+"',"+acList4.get(counter)+","+getMax+")";
										System.out.println(sql11);
										st.executeUpdate(sql11);
									  if(list2>list1){
										System.out.println("the value is in DBManager"+acList.get(counter)); 
								         System.out.println("the value is in DBManager"+acList2.get(counter));			
								         String sql1="insert into journalreciept(debit_name,debit_amount,credit_name,credit_amount,journal_no)values('"+acList.get(counter)+"',"+acList2.get(counter)+",'"+acList3.get(counter)+"',"+acList4.get(counter)+","+getMax+")";
											System.out.println(sql);
										st.executeUpdate(sql1);	
										
										
									}
								
								
								}
									
						 
						 
						 
						 }
						  
					      catch(SQLException ex){
					          ex.printStackTrace();
					      }
				 
			 }
			 
			 
			 public static int getMaxVoucher(){
				 Connection con = (Connection) DBConnection.getConnection();
				int val=0;
			        try{    
			        	Statement stm = (Statement) con.createStatement();
					   String query="SELECT Max(voucher_no) FROM journalvoucher  ";
			            System.out.println(query);
			            ResultSet rs=stm.executeQuery(query);
			            while(rs.next()){
			            	val=rs.getInt("Max(voucher_no)");
			            }}
			            
			        
			      catch(SQLException ex){
			          ex.printStackTrace();
			      }
			           return val;
		
			
			




				 
				 
			 }
			 
			 public static ArrayList<Account> getJournalno(){
					ArrayList<Account> ac=new ArrayList<Account>();
					 Connection con = (Connection) DBConnection.getConnection();
					 Account a=null;
				        try{    
				        	Statement stm = (Statement) con.createStatement();
				 		   String query="SELECT Max(voucher_no) FROM journalvoucher  ";
				            System.out.println(query);
				            ResultSet rs=stm.executeQuery(query);
				            while(rs.next()){
				            	a=new Account();
				            a.setId(rs.getInt("Max(voucher_no)"));
				            ac.add(a);
				            }}
				            
				        
				      catch(SQLException ex){
				          ex.printStackTrace();
				      }
				           return ac;
			
				
				



				}
				public static ArrayList<Journal> showJournalVoucher(){
					ArrayList<Journal> journal=new ArrayList<Journal>();
					 Connection con = (Connection) DBConnection.getConnection();
					 Journal j=null;
				        try{    
				        	Statement stm = (Statement) con.createStatement();
						   String query="SELECT v.journal_date,j.journal_no,j.debit_name,j.debit_amount,j.credit_name,j.credit_amount FROM journalreciept j,journalvoucher v  WHERE journal_no IN(SELECT v.voucher_no FROM journalvoucher ) ";
				            System.out.println(query);
				            ResultSet rs=stm.executeQuery(query);
				            while(rs.next()){
				            	j=new Journal();
				            	j.setJvdate(rs.getString("journal_date"));
				            	j.setJvno(rs.getInt("journal_no"));
				            	j.setDbamount(rs.getInt("debit_amount"));
				            	j.setCramount(rs.getInt("credit_amount"));
				            	j.setCredit(rs.getString("credit_name"));
				            	j.setDebit((rs.getString("debit_name")));
				            	journal.add(j);
				            }}
				            
				        
				      catch(SQLException ex){
				          ex.printStackTrace();
				      }
				           return journal;
			
				
				



				}
				
		public static void 	addcashVoucher(String acdate,String acname, int acamount, String acmemo,String mode,String dat,String cv,String paidname){
			 String sql=null;
				
			 Connection con = (Connection) DBConnection.getConnection();
			 try {
					Statement st=(Statement) con.createStatement();
						
					
						sql="insert into cashvoucher(account,amount,memo,cash_date,actype,voucher_no,names)values('"+acname+"',"+acamount+",'"+acmemo+"','"+dat+"','"+mode+"','"+cv+"','"+paidname+"')";
							System.out.println(sql);
						st.executeUpdate(sql);
						
					}
			
			
				catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 	
			
			
		}







         public static ArrayList<Account> getMaxCashVoucherno(){
        ArrayList<Account> cv=new ArrayList<Account>();
        Account a=null;
				 Connection con = (Connection) DBConnection.getConnection();
				int val=0;
			        try{    
			        	Statement stm = (Statement) con.createStatement();
					   String query="SELECT Max(cv_no) FROM cashvoucher  ";
			            System.out.println(query);
			            ResultSet rs=stm.executeQuery(query);
			            while(rs.next()){
			            	a=new Account();
			            	a.setId(rs.getInt("Max(cv_no)"));
			            	cv.add(a);
			            }}
			            
			        
			      catch(SQLException ex){
			          ex.printStackTrace();
			      }
			           return cv;
		
        	 
        	 
         }
				

			public static ArrayList<CashVoucher> showCashVoucher(){
				ArrayList<CashVoucher> cashvoucher=new ArrayList<CashVoucher>();
				 Connection con = (Connection) DBConnection.getConnection();
				 CashVoucher c=null;
			        try{    
			        	Statement stm = (Statement) con.createStatement();
					   String query="SELECT cv_no,cash_date,account,amount,actype,memo,voucher_no FROM cashvoucher ";
			            System.out.println(query);
			            ResultSet rs=stm.executeQuery(query);
			            while(rs.next()){
			            	c=new CashVoucher();
			            	c.setCvno(rs.getInt("cv_no"));
			            	c.setCvdate(rs.getString("cash_date"));
			            	c.setAccount(rs.getString("account"));
			            	c.setAmount(rs.getInt("amount"));
			            	c.setActype(rs.getString("actype"));
			            	c.setMemo(rs.getString("memo"));
			            	c.setVoucher(rs.getString("voucher_no"));
			            	cashvoucher.add(c);
			            }}
			            
			        
			      catch(SQLException ex){
			          ex.printStackTrace();
			      }
			           return cashvoucher;
		
			
			



			}	
			
			
			public static void createBankAccount( int acNoInt, String acTitle,String acType, String acSubtype,int acAmountInt,String name,String location,String code){
				Connection con = (Connection) DBConnection.getConnection();
				 try {
						Statement st=(Statement) con.createStatement();
						String sql="insert into generalledgerlist(account_name,ac_type,ac_subtype,ac_no)values('"+acTitle+"','"+acType+"','"+acSubtype+"','"+acNoInt+"')";
						System.out.println(sql);
						st.executeUpdate(sql);
						String sql3="INSERT INTO bankjournallist (branch_name,branch_no,branch_location,account_no)VALUES('"+name+"','"+code+"','"+location+"','"+acNoInt+"')";
						st.executeUpdate(sql3);
						 String sql1="CREATE TABLE `enterprise resource planning`"
						 		+ "."+ acTitle+"(  id INT(255) NOT NULL AUTO_INCREMENT,"
						 		+ "ac_title VARCHAR(255),"
						 		+ "Debit INT(255),"
						 		+ "Credit INT(255),"
						 		+ "Balance INT(255),"
						 		+  "Branch_no INT(255), "
						 
						 		+  "Branch_code VARCHAR(255),"
						 		+ "PRIMARY KEY (id));";
						
						 System.out.println(sql1);
						st.execute(sql1);
						 String sql2=" insert into "+acTitle+" (Balance)values('"+acAmountInt+"') ";
						 st.execute(sql2);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				
				
			}
			
			public static void addbank(String acdate,String acname, int acamount,String acmemo,String mode,String bankname,String acno,String bankactitle){
				
				Connection con = (Connection) DBConnection.getConnection();
				 try {
						Statement st=(Statement) con.createStatement();
						if(mode.equals("reciept")){			
						
							 String sql="insert into "+bankactitle+"(ac_title,Debit,Branch_no,Branch_code) values('"+acname+"',"+acamount+",'"+acno+"','"+bankactitle+"')";
								System.out.println(sql);
							st.executeUpdate(sql);
							
						}
					if(mode.equals("payment")){		

						 String sql="insert into "+bankactitle+"(ac_title,Credit,Branch_no,Branch_code) values('"+acname+"',"+acamount+",'"+acno+"','"+bankactitle+"')";
							System.out.println(sql);
						st.executeUpdate(sql);}
				         }
				
				
					catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				 
					
				
				
			}

		public static ArrayList<bank>getbankdetail(String key){
			
			ArrayList<bank> banklist=new ArrayList<bank>();
			 Connection con = (Connection) DBConnection.getConnection();
			 bank b=null;
		        try{    
		        	Statement stm = (Statement) con.createStatement();
				   String query="SELECT Branch_name,Branch_no,account_no,ac_title FROM  bankjournallist WHERE account_no="+key+" ";
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	b=new bank();
		            	b.setBranchname(rs.getString("branch_name"));
		            	b.setBranchlocation(rs.getString("ac_title"));
		            	banklist.add(b);
		            }}
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return banklist;
	
		
		}
			
			public static void addbankreciept(String acdate,String acname,int acamount,String acmemo,String mode,String bankname,String acno,String bankactitle){
				
				String sql=null;
				
				 Connection con = (Connection) DBConnection.getConnection();
				 try {
						Statement st=(Statement) con.createStatement();
						if(mode.equals("reciept")){	
						
							sql="INSERT INTO bankreciept(reciept_date,bank_acno,bank_name,bank_title,amount,comments)values('"+acdate+"',"+acno+",'"+bankname+"','"+bankactitle+"','"+acamount+"','"+acmemo+"')";
								System.out.println(sql);
							st.executeUpdate(sql);}
						if(mode.equals("payment")){	
							
							sql="INSERT INTO bankpayment(reciept_date,bank_acno,bank_name,bank_title,amount,comments)values('"+acdate+"',"+acno+",'"+bankname+"','"+bankactitle+"','"+acamount+"','"+acmemo+"')";
								System.out.println(sql);
							st.executeUpdate(sql);}
						
							
						}
				
				
					catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				 	

		
				
				
				
				
				
			}
	         public static ArrayList<Account> getMaxbankRecieptVoucherno(){
	             ArrayList<Account> cv=new ArrayList<Account>();
	             Account a=null;
	     				 Connection con = (Connection) DBConnection.getConnection();
	     				int val=0;
	     			        try{    
	     			        	Statement stm = (Statement) con.createStatement();
	     					   String query="SELECT Max(id) FROM bankReciept ";
	     			            System.out.println(query);
	     			            ResultSet rs=stm.executeQuery(query);
	     			            while(rs.next()){
	     			            	a=new Account();
	     			            	a.setId(rs.getInt("Max(id)"));
	     			            	cv.add(a);
	     			            }}
	     			            
	     			        
	     			      catch(SQLException ex){
	     			          ex.printStackTrace();
	     			      }
	     			           return cv;
	     		
	             	 
	             	 
	              }
			 
	         public static ArrayList<Account> getMaxbankPaymentVoucherno(){
	             ArrayList<Account> cv=new ArrayList<Account>();
	             Account a=null;
	     				 Connection con = (Connection) DBConnection.getConnection();
	     				int val=0;
	     			        try{    
	     			        	Statement stm = (Statement) con.createStatement();
	     					   String query="SELECT Max(id) FROM bankpayment ";
	     			            System.out.println(query);
	     			            ResultSet rs=stm.executeQuery(query);
	     			            while(rs.next()){
	     			            	a=new Account();
	     			            	a.setId(rs.getInt("Max(id)"));
	     			            	cv.add(a);
	     			            }}
	     			            
	     			        
	     			      catch(SQLException ex){
	     			          ex.printStackTrace();
	     			      }
	     			           return cv;
	     		
	             	 
	             	 
	              }
			 
			 public static int getPermissionid (String master){
				 
				 Connection con = (Connection) DBConnection.getConnection();
  				int val=0;
  			        try{    
  			        	Statement stm = (Statement) con.createStatement();
  					   String query="SELECT id FROM permission where permission_name='"+master+"' ";
  			            System.out.println(query);
  			            ResultSet rs=stm.executeQuery(query);
  			            while(rs.next()){
  			            	val=rs.getInt("id");
  			            }}
  			            
  			        
  			      catch(SQLException ex){
  			          ex.printStackTrace();
  			      }
  			           return val;
  		
          
				 
			 }
			public static void  addrole(int a,String permit){
				
				String sql=null;
				
				 Connection con = (Connection) DBConnection.getConnection();
				 try {
						Statement st=(Statement) con.createStatement();
							
						
							sql="insert into role(role_name,permission_id)values('"+permit+"',"+a+")";
								System.out.println(sql);
							st.executeUpdate(sql);
							
						}
				
				
					catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				 	
					
				
			}
			public static void  addrole1(int a,int b,String permit){
				
				String sql=null;
				String sql2=null;
				 Connection con = (Connection) DBConnection.getConnection();
				 try {
						Statement st=(Statement) con.createStatement();
							
						
							sql="insert into role(role_name,permission_id)values('"+permit+"',"+a+")";
								System.out.println(sql);
							st.executeUpdate(sql);
							sql2="insert into role(role_name,permission_id)values('"+permit+"',"+b+")";
							System.out.println(sql2);
						st.executeUpdate(sql2);

							
						}
				
				
					catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				 	
					
				
			}

		public static void  addrole2(int a,int b,int c,String permit){
	
	String sql=null;
	String sql2=null;
	String sql3=null;
	 Connection con = (Connection) DBConnection.getConnection();
	 try {
			Statement st=(Statement) con.createStatement();
				
			
				sql="insert into role(role_name,permission_id)values('"+permit+"',"+a+")";
					System.out.println(sql);
				st.executeUpdate(sql);
				sql2="insert into role(role_name,permission_id)values('"+permit+"',"+b+")";
				System.out.println(sql2);
			st.executeUpdate(sql2);
			sql3="insert into role(role_name,permission_id)values('"+permit+"',"+c+")";
			System.out.println(sql3);
		st.executeUpdate(sql3);
				
			}
	
	
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 	
		
	
}


public static void addUser(String fullName,String userName, String password,String email,String nic,String gender,String dateOfBirth,String phoneNumber,String roles,String dept){
	 Connection con;
	 con=(Connection) DBConnection.getConnection();
	 try {
			Statement st=(Statement) con.createStatement();
			 String sql= "insert into employee(name,uname,password,email,nic,gender,cell_no,role,dept)values('"+fullName+"','"+userName+"','"+password+"','"+email+"','"+nic+"','"+gender+"','"+phoneNumber+"','"+roles+"','"+dept+"')"  ;
			System.out.println(sql);
			st.executeUpdate(sql);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	

}

              public static ArrayList<roleuser> getrole(){
            	  
            	     ArrayList<roleuser> roles=new ArrayList<roleuser>();
            	     roleuser r=null;
    	     				 Connection con = (Connection) DBConnection.getConnection();
    	     				int val=0;
    	     			        try{    
    	     			        	Statement stm = (Statement) con.createStatement();
    	     					   String query="SELECT role_name FROM role GROUP BY role_name ";
    	     			            System.out.println(query);
    	     			            ResultSet rs=stm.executeQuery(query);
    	     			            while(rs.next()){
    	     			            	r=new roleuser();
    	     			            	r.setRolename(rs.getString("role_name"));
    	     			            	roles.add(r);
    	     			            }}
    	     			            
    	     			        
    	     			      catch(SQLException ex){
    	     			          ex.printStackTrace();
    	     			      }
    	     			           return roles;
    	     		
    	             	 
    	        
            	  
            	  
              }
              public static ArrayList<todolist> showtodolist(){
 	             ArrayList<todolist> to=new ArrayList<todolist>();
 	            todolist t=null;
 	     				 Connection con = (Connection) DBConnection.getConnection();
 	     			
 	     			        try{    
 	     			        	Statement stm = (Statement) con.createStatement();
 	     					   String query="SELECT *  FROM todolist  where active=1 ";
 	     			            System.out.println(query);
 	     			            ResultSet rs=stm.executeQuery(query);
 	     			            while(rs.next()){
 	     			            	t=new todolist();
 	     			            	t.setPr(rs.getInt("pr_id"));
 	     			            	System.out.println(rs.getString("vendor"));
 	     			            	t.setAmount(rs.getInt("amount"));
 	     			            	t.setVendor(rs.getString("vendor"));
 	     			          	t.setType(rs.getString("type"));
 	     			            	to.add(t);
 	     			            }}
 	     			            
 	     			        
 	     			      catch(SQLException ex){
 	     			          ex.printStackTrace();
 	     			      }
 	     			           return to;
 	     		
 	             	 
 	             	 
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
 			public static int getnoGl(String ac){
 				int nam=0;
 				String act=ac.replaceAll("\\s","");
 				 Connection con = (Connection) DBConnection.getConnection();
			        try{    
		        	Statement stm = (Statement) con.createStatement();
				   String query="SELECT gl_no from trailbalance where ac_name='"+act+"'";
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            nam=rs.getInt("gl_no");
		            return nam;
		            }}
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return  nam;
	
   	 
   	 
  
 				
 				
 			}
              public static int getAccountId(String a){
            	  int no=0;
   				
   				 Connection con = (Connection) DBConnection.getConnection();
  			        try{    
  		        	Statement stm = (Statement) con.createStatement();
  				   String query="SELECT id FROM generalledgerlist WHERE ac_no='"+a+"'";
  		            System.out.println(query);
  		            ResultSet rs=stm.executeQuery(query);
  		            while(rs.next()){
  		            no=rs.getInt("id");
  		            return no;
  		            }}
  		            
  		        
  		      catch(SQLException ex){
  		          ex.printStackTrace();
  		      }
  		           return  no;
	  
            	  
            	  
            	  
              }
              public static ArrayList<String> getaccountTypeList(String name){
            	  String nam=null;
            	  ArrayList<String> nameList=   new ArrayList<String>();; 
            		 Connection con = (Connection) DBConnection.getConnection();
   			        try{    
   		        	Statement stm = (Statement) con.createStatement();
   				   String query="SELECT account_name FROM generalledgerlist WHERE ac_type='"+name+"'";
   		            System.out.println(query);
   		            ResultSet rs=stm.executeQuery(query);
   		            while(rs.next()){
   		         	
   		            nam=rs.getString("account_name");
   		            nameList.add(nam);
   		            }}
   		            
   		        
   		      catch(SQLException ex){
   		          ex.printStackTrace();
   		      }
   		           
 	  
             	  
             	  
       return nameList;
            	  
              }
              
              
              public static int getAccountSum(String name){
            	  int sum=0;
            	  ArrayList<String> nameList=   new ArrayList<String>();; 
            		 Connection con = (Connection) DBConnection.getConnection();
   			        try{    
   		        	Statement stm = (Statement) con.createStatement();
   				   String query="SELECT sum(Balance) from "+name+"";
   		            System.out.println(query);
   		            ResultSet rs=stm.executeQuery(query);
   		            while(rs.next()){
   		         	
   		            sum=rs.getInt("sum(Balance)");
   		            
   		            }}
   		            
   		        
   		      catch(SQLException ex){
   		          ex.printStackTrace();
   		      } 
            	  
            	  return sum;
              }
              
              public static int getAccountMax(String name){
            	  int max=0;
            	  ArrayList<String> nameList=   new ArrayList<String>();; 
            		 Connection con = (Connection) DBConnection.getConnection();
   			        try{    
   		        	Statement stm = (Statement) con.createStatement();
   				   String query="SELECT Balance from "+name+" where id=(Select Max(id) from "+name+")";
   		            System.out.println(query);
   		            ResultSet rs=stm.executeQuery(query);
   		            while(rs.next()){
   		         	
   		            max=rs.getInt("Balance");
   		            
   		            }}
   		            
   		        
   		      catch(SQLException ex){
   		          ex.printStackTrace();
   		      } 
            	  
            	  return max;
              }
              
              public static ArrayList<String> getaccountsubTypeList(String name){
            	  String nam=null;
            	  ArrayList<String> nameList=   new ArrayList<String>();; 
            		 Connection con = (Connection) DBConnection.getConnection();
   			        try{    
   		        	Statement stm = (Statement) con.createStatement();
   				   String query="SELECT account_name FROM generalledgerlist WHERE ac_subtype='"+name+"'";
   		            System.out.println(query);
   		            ResultSet rs=stm.executeQuery(query);
   		            while(rs.next()){
   		         	
   		            nam=rs.getString("account_name");
   		            nameList.add(nam);
   		            }}
   		            
   		        
   		      catch(SQLException ex){
   		          ex.printStackTrace();
   		      }
   		           
 	  
             	  
             	  
       return nameList;
            	  
              }
      
              
              
              public static boolean accountCheck(String no){
            	  boolean val=false;
            	  Connection con = (Connection) DBConnection.getConnection();
 			        try{    
 		        	Statement stm = (Statement) con.createStatement();
 				   String query=" select ac_no from generalledgerlist where ac_no='"+no+"' or account_name='"+no+"'";
 		            System.out.println(query);
 		            ResultSet rs=stm.executeQuery(query);
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
              public static boolean accountTitle(String title){
            	  boolean val=false;
            	  Connection con = (Connection) DBConnection.getConnection();
 			        try{    
 		        	Statement stm = (Statement) con.createStatement();
 				   String query=" select account_name from generalledgerlist where account_name='"+title+"'";
 		            System.out.println(query);
 		            ResultSet rs=stm.executeQuery(query);
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
              
              public static boolean bankaccountTitle(String title){
            	  boolean val=false;
            	  Connection con = (Connection) DBConnection.getConnection();
 			        try{    
 		        	Statement stm = (Statement) con.createStatement();
 				   String query=" SELECT account_no FROM bankjournallist where account_no='"+title+"'";
 		            System.out.println(query);
 		            ResultSet rs=stm.executeQuery(query);
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
     				

              public static String getdept(String empuser){
             String roles=null;
     				 Connection con = (Connection) DBConnection.getConnection();
     				int val=0;
     			        try{    
     			        	Statement stm = (Statement) con.createStatement();
     					   String query="SELECT dept FROM employee WHERE uname='"+empuser+"'";
     			            System.out.println(query);
     			            ResultSet rs=stm.executeQuery(query);
     			            while(rs.next()){
     			            	
     			            	roles=(rs.getString("dept"));
     			            	
     			            }}
     			            
     			        
     			      catch(SQLException ex){
     			          ex.printStackTrace();
     			      }
     			           return roles;
     		
             	 
             	 
              }
              
              public static void addDate(String startdate,String enddate){
            		 Connection con;
            		 con=(Connection) DBConnection.getConnection();
            		 try {
            				Statement st=(Statement) con.createStatement();
            				 String sql= "insert into fiscalyear(startdate,enddate)values('"+startdate+"','"+enddate+"')"  ;
            				System.out.println(sql);
            				st.executeUpdate(sql);
            				
            				
            			} catch (SQLException e) {
            				// TODO Auto-generated catch block
            				e.printStackTrace();
            			}
            			
            		

            	}              
              
          	public static ArrayList<bank>showbankreciept(){
    			
    			ArrayList<bank> banklist=new ArrayList<bank>();
    			 Connection con = (Connection) DBConnection.getConnection();
    			 bank b=null;
    		        try{    
    		        	Statement stm = (Statement) con.createStatement();
    				   String query="SELECT * from bankreciept ORDER BY  id DESC";
    		            System.out.println(query);
    		            ResultSet rs=stm.executeQuery(query);
    		            while(rs.next()){
    		            	b=new bank();
    		          b.setAcno(rs.getInt("bank_acno"));
    		          b.setRecieptdate(rs.getString("reciept_date"));
    		          b.setBankname(rs.getString("bank_name"));
    		          b.setAmount(rs.getInt("amount"));
    		          b.setComment(rs.getString("comments"));
    		          b.setVoucher(rs.getString("voucher_no"));
    		            
    		            	banklist.add(b);
    		            }}
    		            
    		        
    		      catch(SQLException ex){
    		          ex.printStackTrace();
    		      }
    		           return banklist;
    	
    		
    		}  
          	public static ArrayList<bank>showbankpayment(){
    			
    			ArrayList<bank> banklist=new ArrayList<bank>();
    			 Connection con = (Connection) DBConnection.getConnection();
    			 bank b=null;
    		        try{    
    		        	Statement stm = (Statement) con.createStatement();
    				   String query="SELECT * from bankpayment ORDER BY  id DESC";
    		            System.out.println(query);
    		            ResultSet rs=stm.executeQuery(query);
    		            while(rs.next()){
    		            	b=new bank();
    		          b.setAcno(rs.getInt("bank_acno"));
    		          b.setRecieptdate(rs.getString("reciept_date"));
    		          b.setBankname(rs.getString("bank_name"));
    		          b.setAmount(rs.getInt("amount"));
    		          b.setComment(rs.getString("comments"));
    		          b.setVoucher(rs.getString("voucher_no"));
    		            
    		            	banklist.add(b);
    		            }}
    		            
    		        
    		      catch(SQLException ex){
    		          ex.printStackTrace();
    		      }
    		           return banklist;
    	
    		
    		}
            public static boolean checkuser(String username){
          	  boolean val=false;
          	  Connection con = (Connection) DBConnection.getConnection();
			        try{    
		        	Statement stm = (Statement) con.createStatement();
				   String query=" SELECT uname FROM employee where uname='"+username+"'";
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
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
              
            public static boolean checkRole(String rolename){
            	  boolean val=false;
            	  Connection con = (Connection) DBConnection.getConnection();
  			        try{    
  		        	Statement stm = (Statement) con.createStatement();
  				   String query=" SELECT role_name FROM role where role_name='"+rolename+"'";
  		            System.out.println(query);
  		            ResultSet rs=stm.executeQuery(query);
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
            public static ArrayList<OrderTable> getMaxPoNo(){
            	ArrayList<OrderTable> banklist=new ArrayList<OrderTable>();
   			 Connection con = (Connection) DBConnection.getConnection();
   			OrderTable o=null;
   		        try{    
   		        	Statement stm = (Statement) con.createStatement();
   	    			String sql="select Max(id) from mainproduction";
   		            System.out.println(sql);
   		            ResultSet rs=stm.executeQuery(sql);
   		            while(rs.next()){
   		            	o=new OrderTable();
   		            	o.setOrderId(rs.getInt("Max(id)"));
   		            	banklist.add(o);
   		            }}
   		            
   		        
   		      catch(SQLException ex){
   		          ex.printStackTrace();
   		      }
   		           return banklist;}
   	
          public static void  addTodolist(int total,String pr,String vendor){
        	  
        	  
       		 Connection con;
       		 con=(Connection) DBConnection.getConnection();
       		 try {
       				Statement st=(Statement) con.createStatement();
       				String sql="INSERT INTO todolist (vendor,amount,active,pr_id)VALUES('"+vendor+"',"+total+",1,"+pr+"')";
       						 System.out.println(sql);
       				st.executeUpdate(sql);
       				
       				
       			} catch (SQLException e) {
       				// TODO Auto-generated catch block
       				e.printStackTrace();
       			}
       			

        	  
        	  
        	  
        	  
        	  
          }
   	
          public static  String getvendor(String pr)
          {
         	  String val= null;
        	  Connection con = (Connection) DBConnection.getConnection();
			        try{    
		        	Statement stm = (Statement) con.createStatement();
				   String query=" SELECT v.vendor_name AS NAME FROM vendor v, prtable r WHERE  r.vendor_id=(SELECT vendor_id FROM prtable WHERE  pr_id="+pr+") AND v.vendor_id=r.vendor_id";
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            	while(rs.next()){
		            	val=rs.getString("name");
		            		
		            		
		            	
			        }}
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      } 
  
			        return val;
          
          }
        			
        			
        			
        			
        			
        			
        			
        			
    
            	
            	
      	
            
           public static void removeSalesTask(int odrid){
        	   
      		 Connection con;
      		 con=(Connection) DBConnection.getConnection();
      		 try {
      				Statement st=(Statement) con.createStatement();
      				String sql="update salestodolist set active=0 where order_id="+odrid+"";
      						 System.out.println(sql);
      				st.executeUpdate(sql);
      				
      				
      			} catch (SQLException e) {
      				// TODO Auto-generated catch block
      				e.printStackTrace();
      			}
      			
      		

        	   
        	   
        	   
        	   
           }    
            public static void updateTodo(String nam){
            	
           	 Connection con;
      		 con=(Connection) DBConnection.getConnection();
      		 try {
      				Statement st=(Statement) con.createStatement();
      				String sql="UPDATE todolist SET active=0 WHERE vendor='"+nam+"'";
      						 System.out.println(sql);
      				st.executeUpdate(sql);
      				
      				
      			} catch (SQLException e) {
      				// TODO Auto-generated catch block
      				e.printStackTrace();
      			}
      			    	
            	
            	
            	
            }
              }