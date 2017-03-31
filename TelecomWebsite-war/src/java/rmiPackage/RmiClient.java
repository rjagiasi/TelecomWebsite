/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rmiPackage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rohan
 */
@WebServlet(name = "RmiClient", urlPatterns = {"/RmiClient"})
public class RmiClient extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private int maxFileSize = 50 * 1024;
    private int maxMemSize = 4 * 1024;
    private File file;
    private String filePath;
    private String start = "984";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int number = (int) Math.ceil((Math.random() * 10000000));

        String query_string
                = "INSERT INTO users (Name, DOB, Address, Aadhar_no, Email, "
                + "Password, PhoneNo, NetworkCircle, Pre_Post)"
                + " VALUES ("
                + "'" + request.getParameter("name") + "',"
                + "'" + request.getParameter("dob") + "',"
                + "'" + request.getParameter("address") + "',"
                + "'" + request.getParameter("aadhar") + "',"
                + "'" + request.getParameter("email") + "',"
                + "'" + request.getParameter("password") + "',"
                + "'" + (start + Integer.toString(number)) + "',"
                + "'" + request.getParameter("network_circle") + "',"
                + "'" + request.getParameter("Connection_type") + "')";

        String host = "localhost";
        try (PrintWriter out = response.getWriter()) {
            Boolean response_rmi = false;
            try {
                Registry registry = LocateRegistry.getRegistry(host);
                RmiInterface stub = (RmiInterface) registry.lookup("telecom_obj");

                response_rmi = stub.store_form(query_string);

                System.out.println("response: " + response_rmi);
            } catch (Exception e) {
                System.err.println("Client exception: " + e.toString());
                e.printStackTrace();
                System.exit(1);
            }

            if (response_rmi) {
                request.setAttribute("number", start + number);
                RequestDispatcher dispatcher = request.getRequestDispatcher("show_info.jsp");
                dispatcher.forward(request, response);
            } else {
                out.print("Some Error Occurred");
            }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
