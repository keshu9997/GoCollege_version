﻿using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;

namespace GoCollege_DL
{


    public class AdminDL
    {
        //Fetch For Existing Mobile Admin
        public DataView FetchFor_AdminExistingMobile(SqlConnection con, SqlTransaction trans, long adminID,long adminMobile)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblAdmin where AdminID not in (@AdminID) and AdminStatus in('R','A') and AdminMobile=@AdminMobile";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@AdminID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = adminID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminMobile", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = adminMobile;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;
        }
        
        //Fetch For Existing Email Admin
        public DataView FetchFor_AdminExistingEmail(SqlConnection con, SqlTransaction trans, long adminID, string adminEmail)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblAdmin where AdminID not in (@AdminID) and AdminStatus in('R','A') and AdminMobile=@AdminEmail";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@AdminID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = adminID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminEmail", SqlDbType.VarChar,250);
                param.Direction = ParameterDirection.Input;
                param.Value = adminEmail ;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;
        }


        public int UpdateAdminProfile(SqlConnection con, SqlTransaction trans, long adminID, long adminMobile, string adminEmail, string adminName)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
              
            int result=0;

            try
            {
                qry = "Update tblAdmin set AdminName=@AdminName,AdminMobile=@AdminMobile,AdminEmail=@AdminEmail where AdminID=@AdminID";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@AdminID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = adminID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminName", SqlDbType.VarChar, 150);
                param.Direction = ParameterDirection.Input;
                param.Value = adminName;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminEmail", SqlDbType.VarChar, 250);
                param.Direction = ParameterDirection.Input;
                param.Value = adminEmail;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminMobile", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = adminMobile;
                cmd.Parameters.Add(param);

                result = cmd.ExecuteNonQuery();

                //MyDataAdapter = new SqlDataAdapter(cmd);
                //MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return result;
        }
        


        //Check for Login Details
        public DataView FetchFor_AdminEditProfile(SqlConnection con, SqlTransaction trans, long adminID)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblAdmin where AdminID=@AdminID and AdminStatus in('R','A')";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@AdminID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = adminID;
                cmd.Parameters.Add(param);
   
                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;
        }



        //Check for Login Details
        public DataView FetchAdminDetails(SqlConnection con, SqlTransaction trans, String adminUN, String adminPWD)
        { 
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblAdmin where AdminUserName=@UserName and AdminPassword=@Password and AdminStatus in('R','A')";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@UserName", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminUN;
                cmd.Parameters.Add(param);

                // parameter for Password column
                param = new SqlParameter("@Password", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminPWD;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {
                
            }

            return MyDataSet.Tables[0].DefaultView;        
        }

        //Check For Student Login
        //Check for Login Details
        public DataView FetchStudentDetails(SqlConnection con, SqlTransaction trans, String adminUN, String adminPWD)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblStudent where StudentUSN=@UserName and StudentPassword=@Password and StudentStatus in('R','A')";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@UserName", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminUN;
                cmd.Parameters.Add(param);

                // parameter for Password column
                param = new SqlParameter("@Password", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminPWD;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;
        }



        //Code Added By Mayur

        public DataView AdminFetchForEditDetails(SqlConnection con, SqlTransaction trans, long adminID, String adminUserName, String adminFullName, String adminEmailID, long adminMobileNo, String adminNewPassword)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";

            try
            {
                qry = "Select AdminStatus from tblAdmin where AdminUserName=@UserName and AdminID=@AdminID";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@UserName", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminUserName;
                cmd.Parameters.Add(param);

                // parameter for Password column
                param = new SqlParameter("@AdminID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminID;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;
        }

        public int AdminUpdateFirstLoginAdminDetails(SqlConnection con, SqlTransaction trans, long adminID, String adminUserName, String adminFullName, String adminEmailID, long adminMobileNo, String adminNewPassword)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            int isUpdated = 0;

            try
            {
                qry = "UPDATE tblAdmin SET AdminName=@AdminName, AdminEmail = @AdminEmail, AdminMobile = @AdminMobile, AdminStatus=@AdminStatus where AdminID = @AdminID and AdminUserName = @AdminUserName and AdminStatus = 'R'";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@AdminName", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminUserName;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminEmail", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminEmailID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminMobile", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminMobileNo;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminStatus", SqlDbType.Char,1);
                param.Direction = ParameterDirection.Input;
                param.Value = 'A';
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminUserName", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminUserName;
                cmd.Parameters.Add(param);

                //MyDataAdapter = new SqlDataAdapter(cmd);
                isUpdated = cmd.ExecuteNonQuery();
            }

            catch (SqlException SqlEx)
            {

            }

            return isUpdated;
        }

        public int AdminUpdateAdminDetails(SqlConnection con, SqlTransaction trans, long adminID, String adminUserName, String adminFullName, String adminEmailID, long adminMobileNo, String adminNewPassword)
        {
            int isUpdated = 0;
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";

            try
            {
                qry = "UPDATE tblAdmin SET AdminName=@AdminName, AdminEmail = @AdminEmail, AdminMobile = @AdminMobile where AdminID = @AdminID and AdminUserName = @AdminUserName";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@AdminName", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminUserName;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminEmail", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminEmailID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminMobile", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminMobileNo;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@AdminUserName", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = adminUserName;
                cmd.Parameters.Add(param);

                isUpdated = cmd.ExecuteNonQuery();
            }

            catch (SqlException SqlEx)
            {

            }

            return isUpdated;
        }

        //end






        //Check for Existing Email and Mobile Number from Admin Table

        public DataView ChkForExisting(SqlConnection con, SqlTransaction trans)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblCollege";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
             
                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;   
 
        }

        //Update Admin Details
        public int EditAdmin(SqlConnection con, SqlTransaction trans, string adminUN, string adminName, string adminEmail, Int64 adminMobile, string adminPWD)
        {

            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {

                qry = " Update tblAdmin set AdminName=@adminName,AdminEmail=@adminEmail,AdminMobile=@adminMobile,AdminPassword=@Password,AdminStatus=@adminStatus where AdminUserName=@UserName and AdminStatus='R'";
                    

                //qry = "Select * from tblAdmin where AdminUserName=@UserName and AdminPassword=@Password and AdminStatus in('R','A')"
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@UserName", SqlDbType.VarChar, 100);
                param.Direction = ParameterDirection.Input;
                param.Value = adminUN;
                cmd.Parameters.Add(param);

                // parameter for Admin Name column
                param = new SqlParameter("@adminName", SqlDbType.VarChar, 150);
                param.Direction = ParameterDirection.Input;
                param.Value = adminName;
                cmd.Parameters.Add(param);

                // parameter for Admin Email column
                param = new SqlParameter("@adminEmail", SqlDbType.VarChar, 250);
                param.Direction = ParameterDirection.Input;
                param.Value = adminEmail;
                cmd.Parameters.Add(param);


                // parameter for Admin Mobile column
                param = new SqlParameter("@adminMobile", SqlDbType.BigInt,10 );
                param.Direction = ParameterDirection.Input;
                param.Value = adminMobile;
                cmd.Parameters.Add(param);


                // parameter for Admin Status column
                param = new SqlParameter("@adminStatus", SqlDbType.Char,1);
                param.Direction = ParameterDirection.Input;
                param.Value = 'A';
                cmd.Parameters.Add(param);


                // parameter for Password column
                param = new SqlParameter("@Password", SqlDbType.VarChar, 250);
                param.Direction = ParameterDirection.Input;
                param.Value = adminPWD;
                cmd.Parameters.Add(param);


                int retValue = 0;

                retValue = cmd.ExecuteNonQuery();
                return retValue;
            }

            catch (SqlException SqlEx)
            {

            }
            return 0;  

        }
       

        //Get College Details
        public DataView FetchCollegeDetails(SqlConnection con, SqlTransaction trans,Int64 adminID, string adminUN)
        {

            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblCollege where CollegeID in(select CollegeID from tblAdmin where AdminID=@AdminID and AdminUserName=@UserName)";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@AdminID", SqlDbType.BigInt,10);
                param.Direction = ParameterDirection.Input;
                param.Value = adminID;
                cmd.Parameters.Add(param);


                // parameter for UserName column
                param = new SqlParameter("@UserName", SqlDbType.VarChar, 100);
                param.Direction = ParameterDirection.Input;
                param.Value = adminUN;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;   
 
 
        }



        //Check for Existing Email.Mobile Number and Phone Number from Clg Table //Edit College Details
        public DataView FetchForExistingClgDetails_EditCollege(SqlConnection con, SqlTransaction trans , long collegeID)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblCollege where CollegeID not in(@CollegeID)";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;

                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@CollegeID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = collegeID;
                cmd.Parameters.Add(param);



                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;

        }

        //Update College Details for First Time
        public int UpdateCollegeDetails_EditUpdate(SqlConnection con, SqlTransaction trans, long clgID, string clgName, string clgEmail, Int64 clgPhone, Int64 clgMobile, string clgAddress)
        {

            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {

                qry = " Update tblCollege set CollegeName=@CollegeName,CollegeEmail=@CollegeEmail,CollegePhone=@CollegePhone,CollegeMobile=@CollegeMobile,CollegeAddress=@CollegeAddress,CollegeStatus=@CollegeStatus where CollegeID=@CollegeID";


                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for College Code
                param = new SqlParameter("@CollegeID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = clgID;
                cmd.Parameters.Add(param);

                // parameter for College Name column
                param = new SqlParameter("@CollegeName", SqlDbType.VarChar, 250);
                param.Direction = ParameterDirection.Input;
                param.Value = clgName;
                cmd.Parameters.Add(param);

                // parameter for COllege Email column
                param = new SqlParameter("@CollegeEmail", SqlDbType.VarChar, 250);
                param.Direction = ParameterDirection.Input;
                param.Value = clgEmail;
                cmd.Parameters.Add(param);

                // parameter for College Phone column
                param = new SqlParameter("@CollegePhone", SqlDbType.BigInt, 10);
                param.Direction = ParameterDirection.Input;
                param.Value = clgPhone;
                cmd.Parameters.Add(param);


                // parameter for College Mobile column
                param = new SqlParameter("@CollegeMobile", SqlDbType.BigInt, 10);
                param.Direction = ParameterDirection.Input;
                param.Value = clgMobile;
                cmd.Parameters.Add(param);



                // parameter for College Mobile column
                param = new SqlParameter("@CollegeAddress", SqlDbType.VarChar, 250);
                param.Direction = ParameterDirection.Input;
                param.Value = clgAddress;
                cmd.Parameters.Add(param);


                // parameter for College Status column
                param = new SqlParameter("@CollegeStatus", SqlDbType.Char, 1);
                param.Direction = ParameterDirection.Input;
                param.Value = 'A';
                cmd.Parameters.Add(param);

                int retValue = 0;

                retValue = cmd.ExecuteNonQuery();
                return retValue;
            }

            catch (SqlException SqlEx)
            {

            }
            return 0;

        }
       



        //Check for Existing Email.Mobile Number and Phone Number from Clg Table
        public DataView FetchForExistingClgDetails(SqlConnection con,SqlTransaction trans)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblCollege";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;               
           
                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;   
            
        }

        //Update College Details for First Time
        public int UpdateCollegeDetails(SqlConnection con,SqlTransaction trans,string clgCode, string clgName, string clgEmail, Int64 clgPhone, Int64 clgMobile, string clgAddress)
        {

            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {

                qry = " Update tblCollege set CollegeName=@CollegeName,CollegeEmail=@CollegeEmail,CollegePhone=@CollegePhone,CollegeMobile=@CollegeMobile,CollegeAddress=@CollegeAddress,CollegeStatus=@CollegeStatus where CollegeCode=@CollegeCode";
                
               //" CollegeName=@adminName,AdminEmail=@adminEmail,AdminMobile=@adminMobile,AdminPassword=@Password,AdminStatus=@adminStatus where AdminUserName=@UserName and AdminStatus='R'";


                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for College Code
                param = new SqlParameter("@CollegeCode", SqlDbType.VarChar, 20);
                param.Direction = ParameterDirection.Input;
                param.Value = clgCode;
                cmd.Parameters.Add(param);

                // parameter for College Name column
                param = new SqlParameter("@CollegeName", SqlDbType.VarChar, 250);
                param.Direction = ParameterDirection.Input;
                param.Value = clgName;
                cmd.Parameters.Add(param);

                // parameter for COllege Email column
                param = new SqlParameter("@CollegeEmail", SqlDbType.VarChar, 250);
                param.Direction = ParameterDirection.Input;
                param.Value = clgEmail;
                cmd.Parameters.Add(param);

                // parameter for College Phone column
                param = new SqlParameter("@CollegePhone", SqlDbType.BigInt, 10);
                param.Direction = ParameterDirection.Input;
                param.Value = clgPhone;
                cmd.Parameters.Add(param);


                // parameter for College Mobile column
                param = new SqlParameter("@CollegeMobile", SqlDbType.BigInt, 10);
                param.Direction = ParameterDirection.Input;
                param.Value = clgMobile;
                cmd.Parameters.Add(param);



                // parameter for College Mobile column
                param = new SqlParameter("@CollegeAddress", SqlDbType.VarChar, 250);
                param.Direction = ParameterDirection.Input;
                param.Value = clgAddress;
                cmd.Parameters.Add(param);


                // parameter for College Status column
                param = new SqlParameter("@CollegeStatus", SqlDbType.Char, 1);
                param.Direction = ParameterDirection.Input;
                param.Value = 'A';
                cmd.Parameters.Add(param);

                int retValue = 0;

                retValue = cmd.ExecuteNonQuery();
                return retValue;
            }

            catch (SqlException SqlEx)
            {

            }
            return 0;  
 
        }
        
        //Add Faculty
        //public DataView CheckForExistingEIDs
        //{ 

        //}

        //Insert New Course
        public int AddCourse(SqlConnection con, SqlTransaction trans, string cName, string cShortName, Int16 cTotalSems, Int64 CollegeID)
        {

            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {

                qry = "Insert into tblCourse values(@CollegeID,@CourseName,@CourseShortName,@TotalSems,@Status)";

                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                param = new SqlParameter("@CollegeID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = CollegeID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@CourseName", SqlDbType.VarChar, 250);
                param.Direction = ParameterDirection.Input;
                param.Value = cName;
                cmd.Parameters.Add(param);


                param = new SqlParameter("@CourseShortName", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = cShortName;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@TotalSems", SqlDbType.Int);
                param.Direction = ParameterDirection.Input;
                param.Value = cTotalSems;
                cmd.Parameters.Add(param);

             

                param = new SqlParameter("@Status", SqlDbType.Char, 1);
                param.Direction = ParameterDirection.Input;
                param.Value = "A";
                cmd.Parameters.Add(param);

                int retValue = 0;

                retValue = cmd.ExecuteNonQuery();
                return retValue;
            }

            catch (SqlException SqlEx)
            {

            }
            return 0;

        }

        //Check For Existing COurse
        public DataView FetchForExistingCourseName(SqlConnection con, SqlTransaction trans, string cName,Int64 collegeID)
        {

            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {

                qry = "select * from tblCourse where CourseName = @CourseName and CourseStatus='A' and CollegeID=@CollegeID ";

                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                param = new SqlParameter("@CourseName", SqlDbType.VarChar, 250);
                param.Direction = ParameterDirection.Input;
                param.Value = cName;
                cmd.Parameters.Add(param);


                param = new SqlParameter("@CollegeID", SqlDbType.BigInt, 10);
                param.Direction = ParameterDirection.Input;
                param.Value = collegeID;
                cmd.Parameters.Add(param);


                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }
            catch (Exception ex)
            {

            }

            return MyDataSet.Tables[0].DefaultView;

        }

        //Fetch All Course Details
        public DataView FetchAllCourse(SqlConnection con, SqlTransaction trans, Int64 adminID)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {

                qry = "select * from tblCourse where CourseStatus='A' and CollegeID in (select CollegeID from tblAdmin where AdminID=@AdminID)";

                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                param = new SqlParameter("@AdminID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = adminID;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }
            catch (Exception ex)
            {

            }

            return MyDataSet.Tables[0].DefaultView;

        }
        
        //Delete Course
        public int DeleteCourse(SqlConnection con, SqlTransaction trans, Int64 courseID)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            int result = 0;
            try
            {

                qry = " update tblCourse set CourseStatus='D' where CourseID= @CourseID";
                
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for College Code
                param = new SqlParameter("@CourseID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = courseID;
                cmd.Parameters.Add(param);

                result= cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
            
            }

            if (result == 0)
            {               
                return result;
            }


            return result;
        }
        
        //Fetch Course For Edit
        public DataView FetchCourseForEdit(SqlConnection con, SqlTransaction trans, Int64 courseID)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = " select * from tblCourse where CourseID= @CourseID";

                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for College Code
                param = new SqlParameter("@CourseID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = courseID;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }
            catch (Exception ex)
            {

            }
           
            return MyDataSet.Tables[0].DefaultView;;
        }

        //Update Course Details
        public int UpdateCourseDetails(SqlConnection con, SqlTransaction trans, Int64 courseID, string cName, string cShortName, Int16 cTotalSems, Int64 CollegeID)        
       {

           DataSet MyDataSet = new DataSet();
           SqlDataAdapter MyDataAdapter;
           SqlCommand cmd = null;
           string qry = "";
           try
           {

               qry = "update tblCourse set CourseName=@CourseName,CourseShortName=@CourseShortName,CourseTotalSems=@TotalSems where CourseID=@CourseID and CollegeID=@CollegeID";

               cmd = new SqlCommand(qry, con, trans);
               cmd.CommandType = CommandType.Text;
               SqlParameter param;

               param = new SqlParameter("@CourseID", SqlDbType.BigInt);
               param.Direction = ParameterDirection.Input;
               param.Value = courseID;
               cmd.Parameters.Add(param);


               param = new SqlParameter("@CollegeID", SqlDbType.BigInt);
               param.Direction = ParameterDirection.Input;
               param.Value = CollegeID;
               cmd.Parameters.Add(param);

               param = new SqlParameter("@CourseName", SqlDbType.VarChar, 250);
               param.Direction = ParameterDirection.Input;
               param.Value = cName;
               cmd.Parameters.Add(param);


               param = new SqlParameter("@CourseShortName", SqlDbType.VarChar, 50);
               param.Direction = ParameterDirection.Input;
               param.Value = cShortName;
               cmd.Parameters.Add(param);

               param = new SqlParameter("@TotalSems", SqlDbType.Int);
               param.Direction = ParameterDirection.Input;
               param.Value = cTotalSems;
               cmd.Parameters.Add(param);

               int retValue = 0;

               retValue = cmd.ExecuteNonQuery();
               return retValue;
           }

           catch (SqlException SqlEx)
           {

           }
           return 0;

 
       }
        
    
        //Fetch All Semesters By CourseID
        public DataView FetchAllSemsByCourseID(SqlConnection con, SqlTransaction trans, long courseID)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = " select * from tblSemester where CourseID= @CourseID";

                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for College Code
                param = new SqlParameter("@CourseID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = courseID;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }
            catch (Exception ex)
            {

            }

            return MyDataSet.Tables[0].DefaultView; ;
 
        }


        //Add NEw Semester
        public int  AddNewSemester(SqlConnection con, SqlTransaction  trans,Int16 semNumber,long courseID, long totalSubjects)
        {

            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            int result = 0;
            try
            {

                qry = " insert into tblSemester (SemNumber,CourseID,SemTotalSubjects) values(@SemNumber, @CourseID,@SemTotalSubjects)";

                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                param = new SqlParameter("@SemNumber", SqlDbType.Int);
                param.Direction = ParameterDirection.Input;
                param.Value = semNumber;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@CourseID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = courseID;
                cmd.Parameters.Add(param);


                param = new SqlParameter("@SemTotalSubjects", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = totalSubjects;
                cmd.Parameters.Add(param);

                result = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

            }

            if (result == 0)
            {
                return result;
            }


            return result;
        }

        //Fetch All Sems for Grid 
        public DataView FetchAllSemesterForGrid(SqlConnection con,SqlTransaction trans,long collegeID)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select  CourseName,TS.CourseID,SemID,SemNumber,SemTotalSubjects from tblSemester TS inner join tblCourse TC on TS.CourseID = TC.CourseID  and TC.CollegeID = @CollegeID Order by TS.CourseID";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;

                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@CollegeID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = collegeID;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;
        }


        //Delete Semester
        public int DeleteSemester(SqlConnection con, SqlTransaction trans, long semID)
        {

            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
             string qry = "";
             int qryresult = 0;
            try
            {
                qry = " Delete from tblSemester Where SemID =@SemID ";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;

                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@SemID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = semID;
                cmd.Parameters.Add(param);

                qryresult = cmd.ExecuteNonQuery();

                //MyDataAdapter = new SqlDataAdapter(cmd);
                //MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return qryresult;
        }

        //Send Notification
        public DataView FetchTypeOfUserForNotification(SqlConnection con, SqlTransaction trans)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblTypeOfUser";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;
        }

        public int SendNotification(SqlConnection con, SqlTransaction trans, string notificationSubject, string notificationContent, DateTime notificationDateTime, long notificationTypeOfUser)
        {
            int isInserted = 0;
            SqlCommand cmd = null;
            string qry = "";

            try
            {
                qry = "insert into tblNotification (NotificationSubject, NotificationContent, NotificationDateTime, NotificationToTypeOfUser, NotificationStatus) values (@NotificationSubject, @NotificationContent, @NotificationDateTime, @NotificationTypeOfUser, 'I')";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@NotificationSubject", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = notificationSubject;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@NotificationContent", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = notificationContent;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@NotificationDateTime", SqlDbType.DateTime, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = notificationDateTime;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@NotificationTypeOfUser", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = notificationTypeOfUser;
                cmd.Parameters.Add(param);

                isInserted = cmd.ExecuteNonQuery();
            }

            catch (SqlException SqlEx)
            {

            }
            return isInserted;
        }
        
        //End

        //Fetch All Student Attendence
        public DataView FetchAllStudentAttendence(SqlConnection con, SqlTransaction trans, DateTime fromDate, DateTime toDate, int year, long courseID, long sectionID, long subjectID)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {


                qry = "select STA.USN as StudentUSN, SUM(IsAttended) as Attended,StudentName from tblStudentAttendance STA inner join tblStudent S on  STA.USN = S.StudentUSN and STA.CourseID = @CourseID and SectionID = @SectionID and Year = @Year and SubjectID = @SubjectID and Date between @FromDate and @ToDate group by STA.USN, S.StudentName";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                param = new SqlParameter("@CourseID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = courseID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@SectionID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = sectionID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@Year", SqlDbType.Int, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = year;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@SubjectID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = subjectID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@FromDate", SqlDbType.DateTime, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = fromDate;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@ToDate", SqlDbType.DateTime, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = toDate;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }
            catch (SqlException SqlEx)
            {

            }
            return MyDataSet.Tables[0].DefaultView;
        }


        //Fetch Particular  Student Attendence
        public DataView FetchIndividualStudentAttendence(SqlConnection con, SqlTransaction trans, string USN, DateTime fromDate, DateTime toDate, int year, long courseID, long sectionID, long subjectID)
        {
            DataSet MyDataSet = new DataSet();
            DataSet MyDataSet1 = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "select USN, SUM(IsAttended) from tblStudentAttendance where CourseID = @CourseID and SectionID = @SectionID and Year = @Year and SubjectID = @SubjectID and Date between @FromDate and @ToDate";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                param = new SqlParameter("@CourseID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = courseID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@SectionID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = sectionID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@Year", SqlDbType.Int, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = year;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@SubjectID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = subjectID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@FromDate", SqlDbType.DateTime, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = fromDate;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@ToDate", SqlDbType.DateTime, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = toDate;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);

                qry = "select USN, TotalClassesHeld, TotalClassesAttended from tblStudentAttendanceCount where CourseID = @CourseID and SectionID = @SectionID and Year = @Year and SubjectID = @SubjectID";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;

                param = new SqlParameter("@CourseID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = courseID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@SectionID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = sectionID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@Year", SqlDbType.Int, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = year;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@SubjectID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = subjectID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@FromDate", SqlDbType.DateTime, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = fromDate;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@ToDate", SqlDbType.DateTime, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = toDate;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet1);

                MyDataSet.Merge(MyDataSet1);
            }
            catch (SqlException SqlEx)
            {

            }
            return MyDataSet.Tables[0].DefaultView;
        }


        //Fetch All Subjects for DropDown using SemID
        public DataView FetchSubjectsBySemID(SqlConnection con, SqlTransaction trans, long semID)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblSubject where SemID=@SemID";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;

                SqlParameter param;

                param = new SqlParameter("@SemID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = semID;
                cmd.Parameters.Add(param);


                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;
        }


        //Fetch Section
        public DataView FetchAllSectionBySemID(SqlConnection con, SqlTransaction trans, long semID)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblSection where SemID=@SemID";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;

                SqlParameter param;

                param = new SqlParameter("@SemID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = semID;
                cmd.Parameters.Add(param);


                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;
        }

        //Fetch Sem for Edit

        public DataView FetchSemesterForEdit(SqlConnection con,SqlTransaction trans, long semID)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblSemester where SemID=@SemID";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;

                SqlParameter param;

                param = new SqlParameter("@SemID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = semID;
                cmd.Parameters.Add(param);


                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;
        }

        //Edit update Semester
        public int EditUpdateSemester(SqlConnection con, SqlTransaction trans, long semID, int semNumber, long courseID, long semTotalSubjects)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";

            int result=0;
            try
            {
                qry = "Update tblSemester set SemNumber=@SemNumber,CourseID=@CourseID,SemTotalSubjects=@SemTotalSubjects where SemID=@SemID";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;

                SqlParameter param;

                param = new SqlParameter("@SemID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = semID;
                cmd.Parameters.Add(param);


                param = new SqlParameter("@SemNumber", SqlDbType.Int);
                param.Direction = ParameterDirection.Input;
                param.Value = semNumber;
                cmd.Parameters.Add(param);


                param = new SqlParameter("@CourseID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = courseID;
                cmd.Parameters.Add(param);


                param = new SqlParameter("@SemTotalSubjects", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = semTotalSubjects;
                cmd.Parameters.Add(param);

                result = cmd.ExecuteNonQuery();

                //MyDataAdapter = new SqlDataAdapter(cmd);
                //MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return result;
        }
    
        //FEtch All Subjects For Grid 
        public DataView FetchAllSubjectsForGrid(SqlConnection con, SqlTransaction trans, long collegeID)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";

            try
            {
                qry = "select SB.SubjectCode,SB.SubjectName,SB.CourseID,SB.SemID,SB.SubjectID, C.CourseShortName, SM.SemNumber from tblSubject SB inner join tblCourse C on C.CourseID= SB.CourseID and C.CollegeID=@CollegeID inner join tblSemester SM  on SM.SemID=SB.SemID";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;

                SqlParameter param;

                param = new SqlParameter("@CollegeID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = collegeID;
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                MyDataAdapter.Fill(MyDataSet);
            }

            catch (SqlException SqlEx)
            {

            }

            return MyDataSet.Tables[0].DefaultView;
        }
   
        //Delete Subject
        public int DeleteSubjectBySubjectID(SqlConnection con,SqlTransaction trans,long subjectID)
        {
         DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            int result = 0;
            try
            {

                qry = " delete from tblSubject where SubjectID=@SubjectID";
                
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for College Code
                param = new SqlParameter("@SubjectID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = subjectID;
                cmd.Parameters.Add(param);

                result= cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
            
            }

            if (result == 0)
            {               
                return result;
            }


            return result;
        }
    }
}
