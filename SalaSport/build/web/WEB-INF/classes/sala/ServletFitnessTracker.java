package sala;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletFitnessTracker extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String workoutName = request.getParameter("workout-name");
        String workoutDate = request.getParameter("workout-date");
        String workoutTime = request.getParameter("workout-time");
        String workoutDuration = request.getParameter("workout-duration");
        String workoutType = request.getParameter("workout-type");
        String workoutDescription = request.getParameter("workout-description");

        String csvFilePath = "C:\\Users\\Mihai_i7\\Desktop\\SalaSport\\src\\java\\sala\\test.csv";
        List<String[]> workoutData = new ArrayList<String[]>();

        try {
            PrintWriter pw = new PrintWriter(new FileWriter(csvFilePath, true)); 
            StringBuilder sb = new StringBuilder();
            sb.append(workoutName);
            sb.append(",");
            sb.append(workoutDate);
            sb.append(",");
            sb.append(workoutTime);
            sb.append(",");
            sb.append(workoutDuration);
            sb.append(",");
            sb.append(workoutType);
            sb.append(",");
            sb.append(workoutDescription);
            sb.append("\r\n");
            pw.write(sb.toString());
            pw.flush();
            System.out.println("Data added to CSV file successfully.");
        } catch (IOException e) {
            // Handle exception appropriately
            e.printStackTrace();
        }
         try 
		{
            BufferedReader br = new BufferedReader(new FileReader(csvFilePath)); 
            String line;
            while ((line = br.readLine()) != null) 
			{
                String[] data = line.split(",");
                workoutData.add(data);
            }
        } catch (IOException e) 
		{
            // Handle exception appropriately
            e.printStackTrace();
        }
        
        request.setAttribute("workoutData", workoutData);
        // Redirect to the same page to allow continuous form submissions
        response.sendRedirect(request.getContextPath() + "/PaginaWorkouts.jsp");
    }
}
