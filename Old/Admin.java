/*
    ?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    System.out.println("Connection--> "+con);
    DatabaseMetaData rsmd=con.getMetaData();
    System.out.println("database name="+rsmd.getDatabaseProductName());
    System.out.println("Table name size="+rsmd.getMaxTableNameLength()); 

*/

import java.sql.*;
import java.lang.*;
import java.util.*;
import java.io.*;

public class Admin
{
    public static void main(String args[]) throws Exception
    {
        Connection con = null;
        Statement stmt = null;
        Scanner in = new Scanner(System.in);
        int ch;
        Boolean AdminLoginResult = false;

        
        try
        {
            //Class.forName("com.mysql.jdbc.Driver"); This is not requirded, As this is preloaded in new versions of Mysql Driver
            //Variables assigned with credetials for connection to Database ("ONLINE_QUIZ")
            String url = "jdbc:mysql://127.0.0.1/online_quiz?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		    String user = "root";
		    String pass = "";
            //Trying to make connection with database
            con = DriverManager.getConnection(url,user,pass);
            stmt = con.createStatement();
			
			System.out.println();
			System.out.println();
			System.out.println("Welcome To Online Quiz's Admin Portal");
			System.out.println("-------------------------------------");
			System.out.println();
			
            Admin ad = new Admin();
            AdminLoginResult = ad.login(stmt);
			
			

            for(;;)
            {
                if( AdminLoginResult == true ) 
                {
                    break;  
                }
                else
                {
                    AdminLoginResult = ad.login(stmt);
                }
            }

            if(AdminLoginResult)
            {
                for(;;)
                {
                    System.out.println();
                    System.out.println();
                    System.out.println("Enter Your Choice");
                    System.out.println("1 : Insert Question into Database \t 2 : View all the Questions in the Database");
                    System.out.println("3 : Create a new Admin User Account \t 4 : Exit");
                    //System.out.println("5 : Exit");
                    System.out.println();
                     System.out.print("Choice : ");ch = in.nextInt();
                    System.out.println();
                    System.out.println("-------------------------------------------------------------------------------");
                    switch (ch) 
                    {
                        case 1 : 
                                ad.Insert(stmt); 
                        break;

                        case 2 :
                                ad.view(stmt);
                        break;

                        case 3 :
                                ad.AdminCreate(stmt);
                        break;

                        case 4 :
                                System.out.println();
                                System.out.println("Good Bye!!");
                                System.exit(0);
                        break;
                        default:
                                System.out.println();
                                System.out.println("Wrong Input!");
                                System.out.println("Please Try Again");
                                System.out.println();
                        break;
                    }

                }
            }   
        }
        catch (SQLException ex)
        {
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }

    }

    public Boolean login(Statement stmt) throws IOException, InterruptedException
    {
        Boolean val = false;
        ResultSet rst = null;
        String username = null;
        Scanner in = new Scanner(System.in);
        try 
        {
            rst = stmt.executeQuery("select * from Admins");
            //Asking The user to enter the Username for login
            System.out.println();
            System.out.println("Enter the Admin Username");
            username=in.nextLine();
            //Checking whether the Entered Username Exists in Admins Database
            while(rst.next())
		    {
                if(username.equals(rst.getString(1)))
                {
                    //If Database has the username entered by the user then the Boolean "val" will be set to "True"
                    username = rst.getString(1);
                    val = true;
                    System.out.println();
                    System.out.println("Enter the Password for username : "+username);
                    String password=in.nextLine();
                    if(password.equals(rst.getString(2)))
                    {
						new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
                        System.out.println();
						System.out.print("-------------------------------");
						for(int i = 0; i < username.length(); i++)
						{
							System.out.print("-");
						}
						System.out.println();
                        System.out.println("Succefully Logged into Admin : "+username); 
                        System.out.print("-------------------------------");
						for(int i = 0; i < username.length(); i++)
						{
							System.out.print("-");
						}
                        System.out.println();
                        return true;
                    }
                    else
                    {
                        System.out.println("Wrong Password");  
                        System.out.println("Retry");
                        return false;
                    }
                   // break;  
                }
              
            }
            if(val == false)
            {
                return false;
            }

        }
        catch (SQLException ex)
        {
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        return false;
    }

    public void Insert(Statement stmt)
    {
        String ques;
        Scanner sc = new Scanner(System.in);
        ResultSet rstt = null;
        int n,i=0,choice,j;
        int count=0;
        String question;
        System.out.println();
        System.out.println("Enter The Question");
        question = sc.nextLine();

        try
        {
            //Code related to Answers Table
            //{
                rstt = stmt.executeQuery("SELECT COUNT(Q_ID) FROM questions");
                while(rstt.next())
                {
                    count = Integer.parseInt(rstt.getString(1));
                }
                count = count + 1;

                System.out.println();
                System.out.println("Enter The number of Options for the Question");
                n = sc.nextInt();
                String[]option = new String[n];
                System.out.println();
                System.out.println("Enter the Options for the Question");

                while(i < n)
                {
                    j = i + 1;
                    System.out.println();
                    System.out.print("Option "+j+" : ");
                    option[i]=sc.next();
                    i++;
                }
                for(i=0;i<n;i++)
                {
                    stmt.executeUpdate("INSERT INTO ANSWERS (answers,q_id)"+" VALUES ('"+option[i]+"',"+count+")");
                }
            //}

            //Code for inserting Qestions into Questions Table
            //{
            rstt = stmt.executeQuery("SELECT * FROM ANSWERS WHERE Q_ID="+count+"");
            i=1;
            while(rstt.next())
            {
                System.out.println(rstt.getString(1)+" : "+rstt.getString(2));
            }
            System.out.println();
            System.out.println("Enter the correct Answer for the Question : ' "+question+" ' from the above mentioned choices");
            choice = sc.nextInt();
            stmt.executeUpdate("INSERT INTO QUESTIONS (QUESTION,ANS_ID)"+" VALUES ('"+question+"',"+choice+")");
            System.out.println();
            System.out.println("Question inserted successfully!!");
            System.out.println("--------------------------------");
            System.out.println();
            //}
        }
        catch (SQLException ex)
        {
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
    }

    public void view(Statement stmt)
    {
        ResultSet rst = null;
        try
        {
            rst = stmt.executeQuery("SELECT * FROM QUESTIONS");
            System.out.println();
            while (rst.next())
            {
                System.out.println(rst.getString(1)+" : "+rst.getString(2));
            }
            System.out.println();
            System.out.println("--------------------------------------------------------------------------------------");
            System.out.println();
        }
        catch (SQLException ex)
        {
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
    }

    public void AdminCreate(Statement stmt)
    {
        ResultSet rs = null;
        String username,password;
        Scanner sc = new Scanner(System.in);
        Boolean val = true;
        System.out.println();
        System.out.println("NOTE : BEFORE YOU CAN CREATE A NEW ADMINISTRATOR HE/SHE MUST BE REGITERED WITH ONLINE QUIZ PORTAL");
        try
        {
            System.out.println();
            System.out.println("Enter the USERNAME_ID");
            username = sc.nextLine();
            rs = stmt.executeQuery("SELECT USER_ID FROM  USERS");
            while(rs.next())
            {
                if(username.equals(rs.getString(1)))
                {
                    System.out.println();
                    System.out.println("Enter the PASSWORD");
                    password = sc.nextLine();
                    stmt.executeUpdate("INSERT INTO ADMINS VALUES ('"+username+"','"+password+"')");
                    System.out.println(username+" is succefully added");
                    System.out.println();
                    val = false;
                }
            }
            if(val)
            {
                System.out.println("Entered User Name Does not exist in our database");
               // return 0;
            }
        }
        catch (SQLException ex)
        {
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
    }

}