package sala;

import java.io.Serializable;
import java.sql.*;

 

public class Sala implements Serializable {
    String error;
    Connection con;
    private String loginMail; 
    private String loginPass;
    private int twoFact;
    
    public void connect() throws Exception, SQLException, ClassNotFoundException{
      try{
          Class.forName("com.mysql.cj.jdbc.Driver");
          con=DriverManager.getConnection("jdbcmysql://localhost:3306/DB?useSSL=false","userlogare","parolalogare");//Introdu contul de test pt sql
          loginMail="";
          loginPass="";
          twoFact=-1;
          
      }  catch (ClassNotFoundException cnfe){
          error="ClassNotFoundException:nu s-a gasit driverul bazei de date";
          throw new ClassNotFoundException(error);
      } catch (SQLException cnfe){
         error="SQLException: nu se poate conecta la baza de date";
         throw new SQLException(error);
      }catch(Exception e){
          error="Exception: a aparut o eroare";
          throw new Exception(error);
      }
    }
    public void disconnect() throws SQLException{
        try{
            if(con!=null){
                con.close();
            }
        }catch (SQLException sqle)
        {
            error="SQLException: nu se poate inchide conexiunea la baza de date";
            throw new SQLException(error);
        }
    }
    public void signInUser(String eMail,String passW) throws SQLException,Exception{
        if(con!=null){
            try{
              Statement stmt;
              stmt=con.createStatement(); 
              stmt.executeUpdate("insert into Clineti(emailClienti,passClienti) values ("+ eMail+","+passW+");");
             
            }
            catch (SQLException sqle){
                error="exceptieSQL: REALIZARE NEREUSITA, EXISTA DUPLICATE !!!";
                        throw new SQLException(error);
            }
        }
        else {
            error="Exceptie: conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    }
    public void logInUser(String eMail,String passW) throws SQLException,Exception{
        ResultSet rs=null;
      if(con!=null){
          try{
              //folosim un prepared sql statement
              Statement stmt;
              stmt=con.createStatement();
              String querryString=("select idClineti,emailClienti,passClienti,twoFact from Clienti where emailClienti="+eMail+" and passClineti="+passW+";");
              rs=stmt.executeQuery(querryString);
              twoFact=rs.getInt("twoFact");
              // gaseste un mod de a verifica daca un user e in baza de date
              //baga in twoFact valoarea acestuia
              //fa twoFact int
              if( twoFact!=-1) //verifica daca e enabled sau nu
              {
                 // logInUserTwoFact();
                 //prin google authentificator incearca sa faci astfel incat 
                 // sa poata sa iti dea un cod si sa verifi daca acel cod e sau nu bun
                 // MAI BINE FACEM CA USERUL SA SE LOGEZE FIE CU TWOFACT +PAROLA FIE DOAR CU TWOFACT
              }
              else{
                  if(rs.getString("emailClineti")==eMail)
                      if(rs.getString("passClienti")==passW){
                      loginMail=eMail;
                      loginPass=passW;
                      }
                  //login simplu fara twofact
                  
              }
          } catch (SQLException sqle){
                  error="SQLException: userul nu exista sau parola si emailul sunt gresite";
                  throw new SQLException(error);
      }  catch (Exception e){
          error="A aparut o exceptie la user LogIn";
          throw new Exception(error);
      }
      
    }
    }
    public void newPass(String eMail,String passW)throws Exception,SQLException {
        // functie din Jbean pentru schimbarea parolei
        // fa ca sa verifice in JSP sau servlet sa poata afisa daca 
        // campul pt parola 1 e la fel sau nu fata de campul parola2
        if(con!=null){
          try{
              Statement stmt;
                stmt=con.createStatement();
              String updateString="update Clineti set passClineti="+passW+" where emailClineti="+ eMail+ ";";
              
              stmt.executeUpdate(updateString);
              
              
              
          } catch (SQLException sqle){
            error="SQLException: A aparut o eroare la setarea noi parole";
            throw new SQLException(error);
        }catch (Exception e){
                  error="A aparut o Exceptie";
          throw new Exception(error);}
        }
    }
    
    public void forgotUserPass(String eMail,String passW) throws SQLException,Exception{
        // daca utilizatorul nu este logat pe platforma
        //si selecteaza sa ii fie resetata parola
        ResultSet rs=null;
      if(con!=null){
          try{
              //folosim un prepared sql statement
              Statement stmt;
              stmt=con.createStatement();
              String querryString=("select idClineti,emailClienti,passClienti,twoFact from Clienti where emailClienti="+eMail+";");
              rs=stmt.executeQuery(querryString); // asta e aici pt a ne da un SQLException in caz ca nu exista eMailul
              newPass(eMail,passW);
              
              
    }catch (SQLException sqle){
        error="Email gresit sau nu exista utilizatorul";
        throw new SQLException(error);
    }catch(Exception e){
        error="A aparut o Exceptie";
        throw new Exception(error);
    }
      }
    }
    
    public void newUserPass()throws Exception,SQLException{
        // daca utilizatorul este Logat pe platforma
        if(con!=null){
          try{
        newPass(loginMail,loginPass);
          }
        catch (SQLException sqle){
            error="SQL Exception: Nu s-a putut schimba parola";
            throw new SQLException(error);
        }catch(Exception e){
            error="A aparut o exceptie";
            throw new Exception(error);
        }
        }
    }
    public void twoFactActivation(){
        // setare legata de cont daca acesta vrea sa activeze twofactor 
        // SE VA REALIZA MEREU DIN CONTUL UTILIZATORULUI
        
    }
    public void fitnessPlaner(int idFit) throws SQLException,Exception{
        // trebuie sa ne selecteze un idPlanFit bazat pe un chestionar al pagini web utilizatorului
    if(con!=null){
          try{
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
