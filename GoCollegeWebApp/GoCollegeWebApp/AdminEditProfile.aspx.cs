﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoCollegeWebApp
{
    public partial class AdminEditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("AdminLogin");
                }
                else
                {
                    BindProfileData();
                }
            }
        }

        public void BindProfileData()
        {

        }
    }
}