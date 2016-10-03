﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using GoCollege_BL;

namespace GoCollegeWebApp
{
    public partial class AddFaculty : System.Web.UI.Page
    {
        FacultyBL objFacultyBL = new FacultyBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("AdminLogin.aspx");
                }
                else
                {
                    BindFacultyGrid();
                }
            }

        }

        

        //
        protected void BindFacultyGrid()
        {
            divDataGrid.Visible = true;
            divAdd.Visible = false;
            divEdit.Visible = false;

            DataView dv = new DataView();
            dv = objFacultyBL.FetchAllFacultyForGrid(long.Parse(Session["UserID"].ToString()));

            dgFacultyDetails.DataSource = null;
            dgFacultyDetails.DataBind();

            if (!dv.Count.Equals(0))
            {
                dgFacultyDetails.DataSource = dv;
                dgFacultyDetails.DataBind();
            }

        }

        //Edit COmmand
        protected void btnFacultytEdit_Command(object sender, CommandEventArgs e)
        {
            ResetAll();
            divAdd.Visible = false;
            divDataGrid.Visible = false;

            divEdit.Visible = true;
        }

        //Delete Command
        protected void btnFacultyDelete_Command(object sender, CommandEventArgs e)
        {
            int qry = 0;

            qry = objFacultyBL.DeleteFaculty(long.Parse(e.CommandName.ToString()));


            if (qry == 1)
            {
                errMsg.Text = "Faculty Deleted Successfully";
                BindFacultyGrid();
            }
        }

        // Add new click 
        protected void lnkAddNewFaculty(object sender, EventArgs e)
        {
            ResetAll();
            divAdd.Visible = true;
            divDataGrid.Visible = false;
            divEdit.Visible = false;

        }

        //View All click 
        protected void lnkViewAll(object sender, EventArgs e)
        {
            ResetAll();
            BindFacultyGrid();
        }

        //Add New Faculty
        protected void btnFacultyAddSubmit_Click(object sender, EventArgs e)
        {
            int qryresult = 0;
            if (Page.IsValid)
            {
                qryresult = objFacultyBL.AddFaculty(txtFacultyCode.Text.ToString(), txtFacultyPassword.Text.ToString(), long.Parse(Session["CollegeID"].ToString()));


                if (qryresult == -1)
                {
                    errMsg.Text = "Facfulty Code Already Exists";
                }
                else
                {
                    errMsg.Text = "Faculty Added Successfully";
                    BindFacultyGrid();
                }
            }
        }
        

        //Reset Al
        protected void ResetAll()
        {
            errMsg.Text = "";
            txtFacultyCode.Text = "";
            txtFacultyPassword.Text = "";
        }
        

    }
}