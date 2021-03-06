package com.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBConnection;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.util.JRLoader;

/**
 * Servlet implementation class Orderinvoice
 */
@WebServlet("/Orderinvoice")
public class OrderinvoiceReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public OrderinvoiceReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("the val is "+request.getParameter("s"));

		if(request.getParameter("s")!=null){
			System.out.println("the val is "+request.getParameter("s"));
			
			Map<String, Object> param=null;
			param = new HashMap<String,Object>();
			param.put("qty", request.getParameter("s"));
			param.put("Title", "Invoice");
		
	    	try {
	    		System.out.println(request.getParameter("s"));
			String reportFileName = request.getParameter("s");
			String reportFormat ="pdf";
		
			Connection conn = null;
			try {
				 

				 conn =DBConnection.getConnection();

				 
			 if (conn != null)
			 {
				 System.out.println("Database Connected");
			 }
			 else
			 {
				 System.out.println(" connection Failed ");
			 }
				
				
				
				
		       System.out.println("Format " + reportFormat + "  -- " + reportFormat);

				   
				
	   			JasperReport jasperReport = getCompiledFile(reportFileName, request);

	    		if (reportFormat.equalsIgnoreCase("html") ) {

	    			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,param,conn);
	    			generateReportHtml(jasperPrint, request, response); // For HTML report

	    		}

	    		else if  (reportFormat.equalsIgnoreCase("pdf") )  {
	    			
	    			generateReportPDF(response, null, jasperReport, conn); // For PDF report
	    		
	    		    }

			   } catch (Exception sqlExp) {

				   System.out.println( "Exception::" + sqlExp.toString());

			   } 

		

				} catch (Exception e) {

		            e.printStackTrace();

				}

	}

	}
	private JasperReport getCompiledFile(String fileName, HttpServletRequest request) throws JRException {
		File reportFile = new File( request.getSession().getServletContext().getRealPath("/jasper/" + fileName + ".jasper"));
		// If compiled file is not found, then compile XML template
		if (!reportFile.exists()) {
		           JasperCompileManager.compileReportToFile(request.getSession().getServletContext().getRealPath("/jasper/" + fileName + ".jrxml"),request.getSession().getServletContext().getRealPath("/jasper/" + fileName + ".jasper"));
		    }
	    	JasperReport jasperReport = (JasperReport) JRLoader.loadObjectFromFile(reportFile.getPath());
		   return jasperReport;
		} 


		private void generateReportHtml( JasperPrint jasperPrint, HttpServletRequest req, HttpServletResponse resp) throws IOException, JRException {
			Map imagesMap = new HashMap();
			JRHtmlExporter exporter = new JRHtmlExporter();
			exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
			exporter.setParameter( JRExporterParameter.OUTPUT_WRITER, resp.getWriter());
			exporter.exportReport();
		}
		

		private void generateReportPDF (HttpServletResponse resp, Map parameters, JasperReport jasperReport, Connection conn)throws JRException, NamingException, SQLException, IOException {
			byte[] bytes = null;
			bytes = JasperRunManager.runReportToPdf(jasperReport,parameters,conn);
		
			resp.setContentType("application/pdf");
			resp.setContentLength(bytes.length);
		
			ServletOutputStream ouputStream = resp.getOutputStream();
			ouputStream.write(bytes, 0, bytes.length);
			ouputStream.flush();
			ouputStream.close();
			
		
	}

	}


