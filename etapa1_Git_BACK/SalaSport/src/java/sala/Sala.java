package sala;

import java.io.Serializable;
import java.sql.*;
import java.util.*;

 

public class Sala implements Serializable {
    String error;
    Connection con;
    private String loginMail; 
    private int IDclient;
    private int twoFact;
    
    public void connect() throws Exception, SQLException, ClassNotFoundException{
      try{
          Class.forName("com.mysql.cj.jdbc.Driver");
          con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sali_sport", "root","1507");
          //Introdu contul de test pt sql
          loginMail="";
          IDclient=-1;
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
              // adauga un querry pt a verifica daca emailul nu exista si daca exista apare pe pagina JSP un
              //prompt ca EXISTA USER CU EMAILUL ALA DEJA
              stmt=con.createStatement(); 
              stmt.executeUpdate("insert into clienti(emailClienti, passClienti, twoFact, idPlanFit) values ("+ eMail +","+ passW +",-1,-1);");
             
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
    public ResultSet logInUser(String eMail,String passW) throws SQLException,Exception{
        ResultSet rs=null;
      if(con!=null){
          try{
              //folosim un prepared sql statement
              Statement stmt;
              stmt=con.createStatement();
              String querryString=("select idClienti,emailClienti,passClienti,twoFact from Clienti where emailClienti="+eMail+" and passClineti="+passW+";");
              rs=stmt.executeQuery(querryString);
              if(rs!=null){
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
                      IDclient=rs.getInt("idClienti");
                      
                      }
                  //login simplu fara twofact
                  
              }
          }
              
              // daca rs e null adica nu exista userul arata pe pagina ca nu exista cont asociat emailului sau unul din campuri e gresit
              // si sugereaza utilizatorului sa isi creeeze unul / sa corecteze
          }catch (SQLException sqle){
                  error="SQLException: userul nu exista sau parola si emailul sunt gresite";
                  throw new SQLException(error);}  
          catch (Exception e){
          error="A aparut o exceptie la user LogIn";
          throw new Exception(error);}
      
    }
        return rs;
      }    
    public void signOutUser(){
    loginMail=""; 
     IDclient=-1;
      twoFact=-1;
      //functie care cand e apelata in jsp ar trebui sa ne trimita si la pagina principala
    
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
    public void twoFactActivation(){
        // setare legata de cont daca acesta vrea sa activeze twofactor 
        // SE VA REALIZA MEREU DIN CONTUL UTILIZATORULUI
        // DE CE AM ZIS CA FAC TWO FACTOR DE CE
        
    }
    public void fitnessPlaner(int idFit) throws SQLException,Exception{
        // trebuie sa ne selecteze un idPlanFit bazat pe un chestionar al pagini web utilizatorului
        // daca e accesat de un utilizator fara abonament atunci dul sa cumpere unul zgarcitul...
    if(con!=null){
          try{Statement stmt;
              stmt=con.createStatement();
              String updateString="update Clienti set idPlanFit="+idFit+" where emailClineti="+ loginMail+ ";";
              
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
    
    public ResultSet codQR() throws SQLException,Exception{
        //genereaza un cod qr cu un google search pentru idul abonamentului/clientului si genreazalc a downloadable image
        //ar trebui sa ma uit sa vad daca as putea crea o versiune de mobil
        ResultSet rs=null;
        if(con!=null){
          try{  Statement stmt;
              stmt=con.createStatement();
              String querryString=("select a.idClienti b.idAbonamente from Clienti a,Abonamente b where a.emailClienti="+loginMail+";");
              rs=stmt.executeQuery(querryString);
              // functia asta ar trebuis a apara doar pe pagina unui client care are abonament altfel 
              // facem in felul urmator partea pagini care ar fi trebuit sa fie codul qr va fi un link la cupara abonament
              // Doamne zici ca sunt de la marketing
              
          }catch(SQLException sqle){
              error="SQLException: a aparut o eroare la citirea bazei de date";
              throw new SQLException(error);
          }catch(Exception e)
          {
              error="Exception:a aparut o exceptie";
                  throw new Exception(error);
          }
        }
        return rs;
    }
    public ResultSet checkClient(){
        ResultSet rs=null;
        // acest lucru se poate intampla doar daca userul e logat
        // interogeaza baza de date astfle incat sa ne returneze o valoare daca userul are sau nu abonament
        //logica d emai jos se petrece in jsp
        // daca nu are atunci o sa apeleze cumpara un abonament
        //altfel apeleaza refreshabonament
        return rs;
    }
    public void cuparaAbonamentUtilizatorNou(int idClient, int zile,int intrari,String antrenor) throws SQLException,Exception{
        if(con!=null){
          try{  Statement stmt;
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
    //cerceteaza payment options
    public void refreshAbonament(int zile,int intrari,String antrenor){
        //reimprospateaza abonamnetul utilizatorului
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
