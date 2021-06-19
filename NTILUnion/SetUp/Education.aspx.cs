﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using System.Text;


namespace NTILUnion.SetUp
{
    public partial class Education : System.Web.UI.Page
    {
        string EducationID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null || Session["username"] == null || Session["UserDistrict"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
            
            if (!IsPostBack)
            {
                GetEductionList();
                

                if (! String.IsNullOrWhiteSpace(Request.QueryString["EducationID"]) ) 
                {
               EducationID = Request.QueryString["EducationID"];
                GetEducationlistByID(EducationID);
                }

                else if (! String.IsNullOrWhiteSpace(Request.QueryString["DeleteID"]) )
                {
                EducationID = Request.QueryString["DeleteID"];
                DeleteEducation(EducationID);
                }

            
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (btnSubmit.Text.ToLower() == "update")
            {
                EducationID = Request.QueryString["EducationID"];
                save("u", EducationID);
            }
            else
            {
                save("i", "");
            }
            btnSubmit.Text = "Submit";
        }

        private void save(string option, string EducationId)
        {
            int Educationid = option == "i" ? 0 : Convert.ToInt32(EducationId);
            var edu = new BLL.Education
            {
                EducationID = Educationid,
                EducationName = txtEducation.Text.Trim(),
                EducationDescription= txtDescription.Text.Trim()
            };

            var eduManger = new EducationManager();
            DataTable tbl = eduManger.CRUD(edu, option);
            message.InnerHtml  = "<div class = 'note note-success'>" + "<div class='close-note'>x</div>" + tbl.Rows[0]["mes"].ToString();
            GetEductionList();
            fieldclear();
        }

        private void GetEductionList()
        {
            listData.InnerHtml = "";

            var eduManger = new EducationManager();
            var edu = new BLL.Education();
            DataTable tbl = eduManger.CRUD(edu, "s");

            StringBuilder sb = new StringBuilder() ;

            if (tbl.Rows.Count > 0)
            {
                sb.AppendLine("<div class='row'>");
                sb.AppendLine("<div class='col-md-12'>");
                sb.AppendLine("<div class='portlet box green'>");
                sb.AppendLine("<div class='portlet-title'>");
                sb.AppendLine("<div class='caption'><i class='fa fa-cogs'></i>Education List Information</div>");
                sb.AppendLine("<div class='tools'>");
                sb.AppendLine("<a href='javascript:;' class='collapse'></a>");
                sb.AppendLine("<a href='#portlet-config' data-toggle='modal' class='config'></a>");
                sb.AppendLine("<a href='javascript:;' class='reload'></a>");
                sb.AppendLine("<a href='javascript:;' class='remove'></a>");
                sb.AppendLine("</div>");
                sb.AppendLine("</div>");
                sb.AppendLine("<div class='portlet-body flip-scroll'>");
            sb.AppendLine("<table class='table table-bordered table-striped table-condensed flip-content'>");
            sb.AppendLine("<thead class='flip-content'>");
            sb.AppendLine("<tr>");
            sb.AppendLine("<th>S.N</th>");
            sb.AppendLine("<th>Education </th>");
        
            sb.AppendLine("<th>Description</th>");
        
            sb.AppendLine("<th Colspan=2 style='text-align:center'>Actions</th>");
            sb.AppendLine("</tr>");
            sb.AppendLine("</thead>");
            sb.AppendLine("<tbody>");

        
            int i =0;
            foreach(DataRow row in tbl.Rows)
            {
                string EducationID = tbl.Rows[i]["EducationID"].ToString();
                 string MembershipType = tbl.Rows[i]["EducationName"].ToString();

                 string Description = tbl.Rows[i]["EducationDescription"].ToString();

            sb.AppendLine("<tr><td class='numeric'>" + (i + 1).ToString() + "</td>");
            sb.AppendLine("<td>" + MembershipType + "</td>");
            sb.AppendLine("<td>" + Description + "</td>");

            sb.AppendLine("<td style='text-align:center'><a href='?EducationID=" + EducationID + "'> Edit </a></td>");
            sb.AppendLine("<td style='text-align:center'><a href='?DeleteID=" + EducationID + "'> Delete </a></td>");

            sb.AppendLine("</tr>");

            i += 1;
            }

            sb.AppendLine("</tbody>");
            sb.AppendLine("</table>");
            sb.AppendLine(" </div>");
            sb.AppendLine("</div>");
            sb.AppendLine("</div>");
            sb.AppendLine("</div>");
            listData.InnerHtml = sb.ToString();
          }
           
        }

        private void DeleteEducation(string ID)
        {

            var edu = new BLL.Education
            {

                EducationID = Convert.ToInt32(ID)
            };

            var eduManger = new EducationManager();
            DataTable tbl = eduManger.CRUD(edu, "d");
            message.InnerHtml = "<div class = 'note note-success'>" + "<div class='close-note'>x</div>" + tbl.Rows[0]["mes"].ToString();
            GetEductionList();
        }

        private void GetEducationlistByID(string ID) 
        {
            var EducationManager = new EducationManager();
            var edu = new BLL.Education();
            edu.EducationID = Convert.ToInt32(ID);
            DataTable tbl = EducationManager.CRUD(edu, "s");

            if (tbl.Rows.Count > 0)
            {
                txtEducation.Text = tbl.Rows[0]["EducationName"].ToString();
                txtDescription.Text = tbl.Rows[0]["EducationDescription"].ToString();
                btnSubmit.Text = "Update";
            }
        }

        void fieldclear()
        {
            txtDescription.Text = string.Empty;
            txtEducation.Text = string.Empty;
        }
        



    }


}