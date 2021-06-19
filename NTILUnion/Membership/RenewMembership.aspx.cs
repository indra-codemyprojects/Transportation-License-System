﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;

using System.Data.SqlClient;

using System.Text;


namespace NTILUnion.Membership
{
    public partial class RenewPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

         
            if (!IsPostBack)
            {
                string membid = Request.QueryString["MembershipID"].ToString();
                GetMember(membid);
            }

            //GetRenewMemberList();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            save();
        }



        private void save()
        {
           
            var memManager = new MembershipManager();
            DataTable tbl = memManager.Renewmember(txtRenewDate.Text, Request.QueryString["MembershipID"], Convert.ToDecimal(txtAmount.Text));
            if (tbl.Rows.Count>0)
            {
            message.InnerHtml = "<div class = 'note note-success'>" + "<div class='close-note'>x</div>" + tbl.Rows[0]["mes"].ToString();
            }

            message.InnerHtml = "<div class = 'note note-success'>" + "<div class='close-note'>x</div>" + tbl.Rows[0]["mes"].ToString();
        }

        private void GetMember(string memberId)
        {
            var memManager = new BLL.MembershipManager();
            DataTable tbl = memManager.SelectById(memberId);
            if (tbl.Rows.Count > 0)
            {
                txtMemName.Text = tbl.Rows[0]["Name"].ToString();
            }



        }


        //private void GetRenewMemberList()
        //{

        //    var memManager = new MembershipManager();
        //    var mem = new BLL.Membership();
        //    DataTable tbl = memManager.CRUD(mem, "s");

        //    StringBuilder sb = new StringBuilder();
        //    sb.AppendLine("<table class='table table-bordered table-striped table-condensed flip-content'>");
        //    sb.AppendLine("<thead class='flip-content'>");
        //    sb.AppendLine("<tr>");
        //    sb.AppendLine("<th>S.N</th>");
        //    sb.AppendLine("<th>Member Name </th>");
        //    sb.AppendLine("<th>Renew Date </th>");
        //    sb.AppendLine("<th>Amount </th>");
        //    sb.AppendLine("<th Colspan=2 style='text-align:center'>Actions</th>");
        //    sb.AppendLine("</tr>");
        //    sb.AppendLine("</thead>");
        //    sb.AppendLine("<tbody>");

        //    int i = 0;
        //    foreach (DataRow row in tbl.Rows)
        //    {
        //        string RenewID = tbl.Rows[i]["RenewID"].ToString();
        //        string Name = tbl.Rows[i]["Name"].ToString();
        //        string RenewDate = tbl.Rows[i]["RenewDate"].ToString();
        //        string Amount = tbl.Rows[i]["Amount"].ToString();


        //        sb.AppendLine("<tr><td class='numeric'>" + (i + 1).ToString() + "</td>");
        //        sb.AppendLine("<td>" + Name + "</td>");
        //        sb.AppendLine("<td>" + Amount + "</td>");
        //        sb.AppendLine("<td>" + Amount + "</td>");

        //        sb.AppendLine("<td style='text-align:center'><a href='?MembershipTypeID=" + RenewID + "'> Edit </a></td>");
        //        sb.AppendLine("<td style='text-align:center'><a href='?DeleteID=" + RenewID + "'> Delete </a></td>");

        //        sb.AppendLine("</tr>");

        //        i += 1;
        //        sb.AppendLine("</tbody>");
        //        sb.AppendLine("</table>");
        //        listData.InnerHtml = sb.ToString();

        //    }

        //}

        
    }
}