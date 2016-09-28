﻿using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;



namespace GoCollege_DL
{
    public class StudentDL
    {

        //Fetch FOr Existing USN
        public DataView FetchForExistingStudentUSN(SqlConnection con, SqlTransaction trans, string studentUSN, long collegeID)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                qry = "Select * from tblStudent where StudentUSN = @StudentUSN and CollegeID=@CollegeID ";
                    cmd = new SqlCommand(qry, con, trans);
                    cmd.CommandType = CommandType.Text;
                    SqlParameter param;

                    param = new SqlParameter("@StudentUSN", SqlDbType.VarChar, 50);
                    param.Direction = ParameterDirection.Input;
                    param.Value = studentUSN;
                    cmd.Parameters.Add(param);


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

        public DataView FetchStudentForDuplicationCheck(SqlConnection con, SqlTransaction trans, string studentUserName, string studentName, long collegeID, long courseID, string studentEmail, long studentMobile)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            try
            {
                if (studentUserName != "" || studentUserName != null)
                {
                    qry = "Select StudentID from tblStudent whereStudentUSN = @StudentUserName";
                    cmd = new SqlCommand(qry, con, trans);
                    cmd.CommandType = CommandType.Text;
                    SqlParameter param;

                    param = new SqlParameter("@StudentUserName", SqlDbType.BigInt, 50);
                    param.Direction = ParameterDirection.Input;
                    param.Value = studentUserName;
                    cmd.Parameters.Add(param);

                    MyDataAdapter = new SqlDataAdapter(cmd);
                    MyDataAdapter.Fill(MyDataSet);
                }
                else
                {
                    qry = "Select StudentID from tblStudent where StudentMobile=@StudentMobile and CollegeID = @CollegeID";
                    cmd = new SqlCommand(qry, con, trans);
                    cmd.CommandType = CommandType.Text;
                    SqlParameter param;

                    // parameter for UserName column
                    param = new SqlParameter("@StudentMobile", SqlDbType.BigInt, 50);
                    param.Direction = ParameterDirection.Input;
                    param.Value = studentMobile;
                    cmd.Parameters.Add(param);

                    param = new SqlParameter("@StudentUserName", SqlDbType.BigInt, 50);
                    param.Direction = ParameterDirection.Input;
                    param.Value = studentUserName;
                    cmd.Parameters.Add(param);

                    param = new SqlParameter("@CollegeID", SqlDbType.BigInt, 50);
                    param.Direction = ParameterDirection.Input;
                    param.Value = collegeID;
                    cmd.Parameters.Add(param);

                    MyDataAdapter = new SqlDataAdapter(cmd);
                    MyDataAdapter.Fill(MyDataSet);
                }
            }

            catch (SqlException SqlEx)
            {

            }
            return MyDataSet.Tables[0].DefaultView;
        }

        public int AddStudent(SqlConnection con, SqlTransaction trans, string studentUSN,long collegeID, long courseID, long semID, string studentPassword)
        {
            DataSet MyDataSet = new DataSet();
            SqlDataAdapter MyDataAdapter;
            SqlCommand cmd = null;
            string qry = "";
            int isUpdated = 0;

            try
            {
                qry = "INSERT INTO tblStudent (StudentUSN,CollegeID,CourseID,SemID,StudentPassword,StudentStatus) values (@StudentUSN,@CollegeID,@CourseID,@SemID,@StudentPassword,@StudentStatus) ";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@StudentUSN", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = studentUSN;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@CollegeID", SqlDbType.BigInt);
                param.Direction = ParameterDirection.Input;
                param.Value = collegeID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@CourseID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = courseID;
                cmd.Parameters.Add(param);
                
                param = new SqlParameter("@SemID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = semID;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@StudentPassword", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = studentPassword;
                cmd.Parameters.Add(param);


                param = new SqlParameter("@StudentStatus", SqlDbType.Char, 1);
                param.Direction = ParameterDirection.Input;
                param.Value = 'R';
                cmd.Parameters.Add(param);

                MyDataAdapter = new SqlDataAdapter(cmd);
                isUpdated = cmd.ExecuteNonQuery();
            }

            catch (SqlException SqlEx)
            {

            }

            return isUpdated;
        }

        public int EditStudent(SqlConnection con, SqlTransaction trans, string studentUserName, string studentName, long collegeID, long courseID, string studentEmail, long studentMobile, string studentAddress, long semID, string studentPassword)
        {

            return 0;
        }

        public int DeleteStudent(SqlConnection con, SqlTransaction trans, string studentUserName, string CollegeID)
        {
            DataSet MyDataSet = new DataSet();
            SqlCommand cmd = null;
            string qry = "";
            int isStudentDeleted = 0;

            try
            {
                qry = "DELETE FROM tblStudent where StudentUSN=@StudentUserName and CollegeID = @CollegeID";
                cmd = new SqlCommand(qry, con, trans);
                cmd.CommandType = CommandType.Text;
                SqlParameter param;

                // parameter for UserName column
                param = new SqlParameter("@StudentUserName", SqlDbType.VarChar, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = studentUserName;
                cmd.Parameters.Add(param);

                param = new SqlParameter("@CollegeID", SqlDbType.BigInt, 50);
                param.Direction = ParameterDirection.Input;
                param.Value = CollegeID;
                cmd.Parameters.Add(param);

                //MyDataAdapter = new SqlDataAdapter(cmd);
                isStudentDeleted = cmd.ExecuteNonQuery();
            }

            catch (SqlException SqlEx)
            {

            }

            return isStudentDeleted;
        }



    }
}