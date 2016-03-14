package datos;

import java.sql.*;

public class Conexion {

	private Connection cn = null;
	private static String url = "jdbc:sqlserver://localhost:1433;databaseName=PASNI_UCA;";//Persist Security Info=True;";
	private static String user = "sa";
	private static String password = "123";
	
	  
    public Conexion()
    {  
    	
    }
    
   
    public Connection getConnection() 
    {	
	   if (EstaConectado()==false) this.CrearConexion();
	   return cn;
    }
   
    public boolean EstaConectado()
    {
            boolean resp = false;
            try
            {
                    if ((cn==null) || ( cn.isClosed()))
                            resp = false;
                    else
                            resp = true;
            }
            catch(Exception e){}
           
            return resp;
    }
   
    public void CrearConexion()
    {
        	try 
        	{
               Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
               cn= DriverManager.getConnection(url, user, password);
               System.out.println("Se conectó a la BD PASNI-UCA");
            } 
            catch (ClassNotFoundException e) 
            {
               cn=null;
               System.out.println("Error no se puede cargar el driver:" + e.getMessage());
            } 
            catch (SQLException e) 
            {
               cn=null;
               System.out.println("Error al establecer la conexion:" + e.getMessage());
            }
    }
   
    public static void main(String args[])
    {
            new Conexion().getConnection();
    }
}
