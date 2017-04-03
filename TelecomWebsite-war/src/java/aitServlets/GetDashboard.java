/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aitServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import loginBeanPackage.DatabaseConn;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 *
 * @author rohan
 */
@WebServlet(name = "GetDashboard", urlPatterns = {"/GetDashboard"})
public class GetDashboard extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParserConfigurationException, ClassNotFoundException, SQLException, TransformerConfigurationException, TransformerException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

            // root elements
            Document doc = docBuilder.newDocument();
            Element dashboard = doc.createElement("dashboard");
            doc.appendChild(dashboard);

            Cookie[] cookies = request.getCookies();
            String user_id = null, pre_post = null;
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user_id")) {
                    user_id = cookie.getValue();
                }
                if (cookie.getName().equals("pre_post")) {
                    pre_post = cookie.getValue();
                }

            }

            DatabaseConn dbconn = new DatabaseConn();
            ArrayList<ArrayList<String>> table = null;

            table = dbconn.query("Select PhoneNo from users where UserId = " + user_id);
            Element phone_no = doc.createElement("Phone_No");
            phone_no.appendChild(doc.createTextNode(table.get(0).get(0)));
            dashboard.appendChild(phone_no);

            if (pre_post.equals("0")) {
                //prepaid number

                table = dbconn.query("Select * from prepaid_user where UserId = " + user_id);

                Element balance = doc.createElement("Balance");
                balance.appendChild(doc.createTextNode(table.get(0).get(1)));
                dashboard.appendChild(balance);

                Element data_balance = doc.createElement("Data_Balance");
                data_balance.appendChild(doc.createTextNode(table.get(0).get(2)));
                dashboard.appendChild(data_balance);

                Element data_balance_expiry = doc.createElement("Data_Balance_Expiry");
                data_balance_expiry.appendChild(doc.createTextNode(table.get(0).get(3)));
                dashboard.appendChild(data_balance_expiry);

                Element active_packs = doc.createElement("Active_Packs");
                table = dbconn.query("Select packs.*, user_packs.Valid_till from user_packs, packs where user_packs.UserId = " + user_id + " and packs.PackId = user_packs.PackId");

                ArrayList<String> element_headers = new ArrayList<>();

                element_headers.add("Pack_Id");
                element_headers.add("Usage_Type");
                element_headers.add("Validity");
                element_headers.add("Price");
                element_headers.add("Description");
                element_headers.add("Valid_till");

                for (Iterator<ArrayList<String>> iterator = table.iterator(); iterator.hasNext();) {

                    Element pack_element = doc.createElement("Pack");

                    ArrayList<String> next = iterator.next();
                    for (int i = 0; i < next.size(); i++) {
                        Element ele = doc.createElement(element_headers.get(i));
                        ele.appendChild(doc.createTextNode(next.get(i)));
                        pack_element.appendChild(ele);
                    }

                    active_packs.appendChild(pack_element);
                }

                dashboard.appendChild(active_packs);
            }

            DOMSource domSource = new DOMSource(doc);
            StringWriter writer = new StringWriter();
            StreamResult result = new StreamResult(writer);
            TransformerFactory tf = TransformerFactory.newInstance();
            Transformer transformer = tf.newTransformer();
//            transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
            transformer.transform(domSource, result);
            response.setContentType("application/xml");
            out.println(writer.toString());

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(GetDashboard.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GetDashboard.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GetDashboard.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransformerConfigurationException ex) {
            Logger.getLogger(GetDashboard.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransformerException ex) {
            Logger.getLogger(GetDashboard.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(GetDashboard.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GetDashboard.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GetDashboard.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransformerConfigurationException ex) {
            Logger.getLogger(GetDashboard.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransformerException ex) {
            Logger.getLogger(GetDashboard.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
