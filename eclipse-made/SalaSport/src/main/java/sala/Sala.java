package sala;

import java.io.Serializable;
import java.sql.*;
import java.util.*;

 

public class Sala implements Serializable {
    String error;
    Connection con;
    private String loginMail=""; 
    private int IDclient=-1;
    
    public void connect() throws Exception, SQLException, ClassNotFoundException{
      try{
    	  Class.forName("com.mysql.cj.jdbc.Driver");
    	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Sali_Sport?useSSL=false", "root", "1507");
          //Introdu contul de test pt sql
          
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
              // adauga un querry pt a verifica daca emailul nu exista si daca exista apare pe pagina JSP un
              //prompt ca EXISTA USER CU EMAILUL ALA DEJA
              stmt=con.createStatement(); 
              stmt.executeUpdate("insert into Clienti (emailClienti, passClienti, twoFact, idPlanFit) values ('"+ eMail +"','"+ passW +"','"+ -1 + "',-1);");
             
            }
            catch (SQLException sqle){
                error="exceptieSQL: REALIZARE NEREUSITA, ceva nu merge!!!";
                        throw new SQLException(error);
            }
        }
        else {
            error="Exceptie: conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    }
    public String getClientMail() {
    	return loginMail;
    }
    public int getClientID() {
    	return IDclient;
    }
    public void setClientMail(String eMail) {
    	loginMail=eMail;
    }
    public void setClientID(int ids) {
    	IDclient=ids;
    }
    public ResultSet logInUser(String eMail,String passW) throws SQLException,Exception{
        ResultSet rs=null;
      if(con!=null){
          try{
        	  
              String queryString = ("SELECT * FROM Sali_Sport.Clienti where emailClienti='"+ eMail + "' and passClienti='" + passW + "';");
              Statement stmt=con.createStatement();
              rs=stmt.executeQuery(queryString);
              System.err.println(queryString);
              // daca rs e null adica nu exista userul arata pe pagina ca nu exista cont asociat emailului sau unul din campuri e gresit
              // si sugereaza utilizatorului sa isi creeeze unul / sa corecteze
              // abandoman orice este legat de google 
          } catch (SQLException sqle){
                  error="SQLException: userul nu exista sau parola si emailul sunt gresite";
                  sqle.printStackTrace();
                  throw new SQLException(error);}  
          catch (Exception e){
          error="A aparut o exceptie la user LogIn";
          throw new Exception(error);}
          
      }
      return rs; 
    }
    public ResultSet checkUser(String eMail) throws SQLException,Exception{
        ResultSet rs=null;
      if(con!=null){
          try{
        	  
              String queryString = ("SELECT COUNT(*) AS exista FROM Sali_Sport.Clienti where emailClienti='"+ eMail + "';");
              Statement stmt=con.createStatement();
              rs=stmt.executeQuery(queryString);
              System.err.println(queryString);
              // daca rs e null adica nu exista userul arata pe pagina ca nu exista cont asociat emailului sau unul din campuri e gresit
              // si sugereaza utilizatorului sa isi creeeze unul / sa corecteze
              // abandoman orice este legat de google 
          } catch (SQLException sqle){
                  error="SQLException: userul exista deja";
                  sqle.printStackTrace();
                  throw new SQLException(error);}  
          catch (Exception e){
          error="A aparut o exceptie la user Sign in";
          throw new Exception(error);}
          
      }
      return rs; 
    }
    public ResultSet checkAbonament(int idClient) throws SQLException,Exception{
        ResultSet rs=null;
      if(con!=null){
          try{
        	  
              String queryString = ("SELECT COUNT(*) AS exista FROM Sali_Sport.Abonamente where idClient='"+ idClient + "';");
              Statement stmt=con.createStatement();
              rs=stmt.executeQuery(queryString);
              System.err.println(queryString);
              // daca rs e null adica nu exista userul arata pe pagina ca nu exista cont asociat emailului sau unul din campuri e gresit
              // si sugereaza utilizatorului sa isi creeeze unul / sa corecteze
              // abandoman orice este legat de google 
          } catch (SQLException sqle){
                  error="SQLException: userul exista deja";
                  sqle.printStackTrace();
                  throw new SQLException(error);}  
          catch (Exception e){
          error="A aparut o exceptie la user Sign in";
          throw new Exception(error);}
          
      }
      return rs; 
    }
    public ResultSet checkUser(String eMail,String passW) throws SQLException,Exception{
        ResultSet rs=null;
      if(con!=null){
          try{
        	  
              String queryString = ("SELECT COUNT(*) AS exista FROM Sali_Sport.Clienti where emailClienti='"+ eMail + "' and passClienti='" + passW + "';");
              Statement stmt=con.createStatement();
              rs=stmt.executeQuery(queryString);
              System.err.println(queryString);
              // daca rs e null adica nu exista userul arata pe pagina ca nu exista cont asociat emailului sau unul din campuri e gresit
              // si sugereaza utilizatorului sa isi creeeze unul / sa corecteze
              // abandoman orice este legat de google 
          } catch (SQLException sqle){
                  error="SQLException: userul exista deja";
                  sqle.printStackTrace();
                  throw new SQLException(error);}  
          catch (Exception e){
          error="A aparut o exceptie la user Sign in";
          throw new Exception(error);}
          
      }
      return rs; 
    }    
    public void signOutUser(){
    loginMail=""; 
     IDclient=-1;
      //functie care cand e apelata in jsp ar trebui sa ne trimita si la pagina principala
    
    }
    public void newPass(String eMail,String passW)throws Exception,SQLException {
        if(con!=null){
          try{
        	  Statement stmt;
                stmt=con.createStatement();
              String updateString="update Clienti set passClienti='"+passW+"' where emailClienti='"+ eMail+ "';";
              
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
    
    public void newUserPass(String passW)throws Exception,SQLException{
        // daca utilizatorul este Logat pe platforma
        if(con!=null){
          try{
        newPass(loginMail,passW);
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
    public void fitnessPlaner(int idFit) throws SQLException,Exception{
        // trebuie sa ne selecteze un idPlanFit bazat pe un chestionar al pagini web utilizatorului
        // daca e accesat de un utilizator fara abonament atunci dul sa cumpere unul zgarcitul...
    if(con!=null){
          try{java.sql.Statement  stmt;
              stmt=con.createStatement();
              String updateString="update Clienti set idPlanFit="+idFit+" where emailClienti="+ loginMail+ ";";
              
              stmt.executeUpdate(updateString);
    }catch(SQLException sqle)
    {
        error="SQLException: Nu s-a putut introduce in baza de date";
        throw new SQLException(error);
    }catch(Exception e){
        error="Exceptie: A aparut o exceptie";
        throw new Exception(error);
    }
    }
    }
    public void cuparaAbonamentUtilizatorNou(int idClient, int zile,int intrari,String antrenor) throws SQLException,Exception{
        if(con!=null){
          try{  Statement  stmt;
              stmt=con.createStatement();
              java.sql.Date ziuaCurenta=new java.sql.Date(new java.util.Date().getTime());
             Calendar c=Calendar.getInstance();
             c.setTime(ziuaCurenta);
             c.add(Calendar.DATE,zile);
             java.sql.Date ziuaNoua = new java.sql.Date(c.getTimeInMillis());
             //tot carnatul de mai sus ar trebui sa ne dea data expirarii abonamentului utilizatorului dupa x zile
             //sper ca merge
             stmt.executeUpdate("insert into Abonamente (idClient,expDate,intrare,Antrenor) values('"+ idClient +"','"+ ziuaNoua +"','"+ intrari +"','" + antrenor +"');");
       
              
          }catch (SQLException sqel){
              error="SQLException:Probabil nu s-a putut reazlia iserarea";
             throw new SQLException(error);
          }
          catch(Exception e)
          {
              error="Exception:a aparut o exceptie";
                  throw new Exception(error);
          }
                  
        }
       
    }
    
    public void cuparaAbonamentUtilizatorVechi(int idClient, int zile,int intrari,String antrenor) throws SQLException,Exception{
        if(con!=null){
          try{  Statement  stmt;
              stmt=con.createStatement();
              java.sql.Date ziuaCurenta=new java.sql.Date(new java.util.Date().getTime());
             Calendar c=Calendar.getInstance();
             c.setTime(ziuaCurenta);
             c.add(Calendar.DATE,zile);
             java.sql.Date ziuaNoua = new java.sql.Date(c.getTimeInMillis());
             //tot carnatul de mai sus ar trebui sa ne dea data expirarii abonamentului utilizatorului dupa x zile
             //sper ca merge
             stmt.executeUpdate("update Abonamente set expDate = '"+ ziuaNoua +"', intrare = '"+ intrari +"', Antrenor='" + antrenor +"' WHERE idCLient= '"+ idClient +"';");
       
              
          }catch (SQLException sqel){
              error="SQLException:Probabil nu s-a putut reazlia iserarea";
             throw new SQLException(error);
          }
          catch(Exception e)
          {
              error="Exception:a aparut o exceptie";
                  throw new Exception(error);
          }
                  
        }
       
    }
    public ResultSet veziAbonamentUtilizator(int idClient) throws SQLException,Exception{
        ResultSet rs=null;
    	if(con!=null){
          try{  Statement  stmt;
          stmt=con.createStatement();
             rs=stmt.executeQuery("select * from Abonamente WHERE idClient= '"+ idClient +"';");
              
          }catch (SQLException sqel){
              error="SQLException:Probabil nu s-a putut reazlia iserarea";
             throw new SQLException(error);
          }
          catch(Exception e)
          {
              error="Exception:a aparut o exceptie";
                  throw new Exception(error);
          }
                  
        }
       return rs;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}