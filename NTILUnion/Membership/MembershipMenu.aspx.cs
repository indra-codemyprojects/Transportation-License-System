﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NTILUnion.Membership
{
    public partial class MembershipMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null || Session["username"] == null || Session["UserDistrict"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
        }
    }
}