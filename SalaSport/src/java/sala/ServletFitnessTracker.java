/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package sala;

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Mihai_i7
 */
public class ServletFitnessTracker extends HttpServlet {
   
    /** 
    * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Fitness Tracker</title>");
        out.println("<meta charset=\"UTF-8\">");
        out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
        out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">");
        out.println("</head>");
        out.println("<body>");
        out.println("<header>");
        out.println("<h1>Fitness Tracker</h1>");
        out.println("<nav>");
        out.println("<ul>");
        out.println("<li><a href=\"#\">Home</a></li>");
        out.println("<li><a href=\"#\">Workouts</a></li>");
        out.println("<li><a href=\"#\">Nutrition</a></li>");
        out.println("<li><a href=\"#\">Progress</a></li>");
        out.println("</ul>");
        out.println("</nav>");
        out.println("</header>");
        out.println("<main>");
        out.println("<section class=\"hero\">");
        out.println("<h2>Get Fit</h2>");
        out.println("<p>Track your fitness journey with our fitness tracker. Create custom workouts, monitor your nutrition, and track your progress.</p>");
        out.println("<a href=\"#\" class=\"cta\">Get Started</a>");
        out.println("</section>");
        out.println("<section class=\"workouts\">");
        out.println("<h2>Workouts</h2>");
        out.println("<p>Create custom workouts and track your progress.</p>");
        out.println("<a href=\"#\" class=\"cta\">View Workouts</a>");
        out.println("</section>");
        out.println("<section class=\"nutrition\">");
        out.println("<h2>Nutrition</h2>");
        out.println("<p>Monitor your nutrition with our food diary.</p>");
        out.println("<a href=\"#\" class=\"cta\">View Food Diary</a>");
        out.println("</section>");
        out.println("<section class=\"progress\">");
        out.println("<h2>Progress</h2>");
        out.println("<p>Track your progress with our fitness log.</p>");
        out.println("<a href=\"#\" class=\"cta\">View Fitness Log</a>");
        out.println("</section>");
        out.println("</main>");
        out.println("<footer>");
        out.println("<p>&copy; 2023 Fitness Tracker. All rights reserved.</p>");
        out.println("</footer>");
      // Transformarea obiectului orar in atribut al sesiunii curente pentru
      // salvarea starii lui
      HttpSession ses = request.getSession();
//      Orar orar = (Orar) ses.getAttribute("orar");
//      if (orar == null) { // Daca nu exista orarul salvat ca atribut al sesiunii
//         orar = new Orar();
//         ses.setAttribute("orar", orar);
//      }
//      // Obtinerea parametrilor introdusi de utilizator in formular
//      int zi = Integer.parseInt(request.getParameter("zi"));
//      // Daca serviciu cerut e obtinere orar
//      if (request.getParameter("serviciu").equals("getOrar")) {
//         out.println("<b>Orarul cerut:</b> <br>" + orar.getOrar(zi));
//      }
//      // Daca serviciu cerut e modificare orar
//      else if (request.getParameter("serviciu").equals("setOrar")) {
//         String modificare = request.getParameter("modificare");
//         orar.setOrar(zi, modificare);
//         out.println("<b>Modificarea ceruta:</b> <br>" + orar.getOrar(zi));
//      }
      out.println("</body>");
      out.println("</html>");
        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
    * Handles the HTTP <code>GET</code> method.
    * @param request servlet request
    * @param response servlet response
    */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
    * Handles the HTTP <code>POST</code> method.
    * @param request servlet request
    * @param response servlet response
    */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
    * Returns a short description of the servlet.
    */
}
