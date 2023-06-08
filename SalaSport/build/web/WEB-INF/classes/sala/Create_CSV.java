package sala;

import java.io.File;
import java.io.PrintWriter;

public class Create_CSV {
public static void main(String[] args) {
     try {
   PrintWriter pw= new PrintWriter(new File("C:\\Users\\Mihai_i7\\Desktop\\SalaSport\\src\\java\\sala\\test.csv"));
   StringBuilder sb=new StringBuilder();
   sb.append("Workout name");
   sb.append(",");
   sb.append("Workout Date");
   sb.append(",");
   sb.append("Workout Time");
   sb.append(",");
   sb.append("Workout Duration (mins)");
   sb.append(",");
   sb.append("Workout Type");
   sb.append(",");
   sb.append("Workout Description");
   sb.append("\r\n");;
//   sb.append(workoutName);
//   sb.append(",");
//   sb.append(workoutDate);
//   sb.append(",");
//   sb.append(workoutTime);
//   sb.append(",");
//   sb.append(workoutDuration);
//   sb.append(",");
//   sb.append(workoutType);
//   sb.append(",");
//   sb.append(workoutDescription);
   sb.append("\r\n");
   pw.write(sb.toString());
   pw.close();
   System.out.println("finished");
   } catch (Exception e) {
      // TODO: handle exception
   }
}
}
