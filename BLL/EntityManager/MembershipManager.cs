﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DAO;
using BLL;

namespace BLL
{
    public class MembershipManager : IMasterActions<Membership>
    {

        public DataTable CRUD(Membership member, string flag)
        {

            var cmd = DataAccess.CreateCommand();
            cmd.CommandText = "[Membership].[usp_Membership]";
            cmd.Parameters.AddWithValue("@MembershipID", member.MembershipID);
            cmd.Parameters.AddWithValue("@Name", member.Name);
            cmd.Parameters.AddWithValue("@Zone", member.Zone);
            cmd.Parameters.AddWithValue("@District", member.District);
            cmd.Parameters.AddWithValue("@CurrentCity", member.CurrentCity);
            cmd.Parameters.AddWithValue("@Gender",member.Gender);
            cmd.Parameters.AddWithValue("@VDC", member.VDC);
            cmd.Parameters.AddWithValue("@City", member.City);
            cmd.Parameters.AddWithValue("@DateofBirth", member.DateofBirth);
            cmd.Parameters.AddWithValue("@FatherName", member.FatherName);
            cmd.Parameters.AddWithValue("@MotherName", member.MotherName);
            cmd.Parameters.AddWithValue("@CitizenShipNO", member.CitizenShipNO);
            cmd.Parameters.AddWithValue("@LicenseNo", member.LicenseNo);
            cmd.Parameters.AddWithValue("@LicenseType", member.LicenseType);
            cmd.Parameters.AddWithValue("@MembershipDate", member.MembershipDate);
            cmd.Parameters.AddWithValue("@ValidDate", member.ValidDate);
            cmd.Parameters.AddWithValue("@Unit", member.Unit);
            cmd.Parameters.AddWithValue("@Post", member.Post);
            cmd.Parameters.AddWithValue("@Email", member.Email);
            cmd.Parameters.AddWithValue("@Mobile", member.Mobile);
            cmd.Parameters.AddWithValue("@Phone", member.Phone);
            cmd.Parameters.AddWithValue("@Photo", member.Photo);
            cmd.Parameters.AddWithValue("@Education", member.Education);
            cmd.Parameters.AddWithValue("@IsVerified",member.IsVerified);
            cmd.Parameters.AddWithValue("@UserDistrict", member.UserDistrict);
            cmd.Parameters.AddWithValue("@flag", flag);
            return DataAccess.ExecuteReaderCommand(cmd);
        }

        public DataTable SelectById(string MembershipID)
        {
            var cmd = DataAccess.CreateCommand();
            cmd.CommandText = "[Membership].[usp_Membership]";
            cmd.Parameters.AddWithValue("@MembershipID", MembershipID);
            cmd.Parameters.AddWithValue("@flag", "s");
            return DataAccess.ExecuteReaderCommand(cmd);
        }

        public DataTable Report(string flag)
        {

            var cmd = DataAccess.CreateCommand();
            cmd.CommandText = "[Membership].[uspAggregate]";
            cmd.Parameters.AddWithValue("@Flag", flag);
            return DataAccess.ExecuteReaderCommand(cmd);
        }




        public DataTable Search(string flag, string searchText)
        {
            var cmd = DataAccess.CreateCommand();
            cmd.CommandText = "[Membership].[usp_Search]";
            cmd.Parameters.AddWithValue("@Flag", flag);
            cmd.Parameters.AddWithValue("@SearchText", searchText);
            //cmd.Parameters.AddWithValue("@UserDistrict",UserDistrict);
            return DataAccess.ExecuteReaderCommand(cmd);
        }

        public DataTable SearchRenew(string flag, string searchText, string UserDistrict)
        {
            var cmd = DataAccess.CreateCommand();
            cmd.CommandText = "[Setup].[usp_SearchForRenew]";
            cmd.Parameters.AddWithValue("@Flag", flag);
            cmd.Parameters.AddWithValue("@SearchText", searchText);
            cmd.Parameters.AddWithValue("@UserDistrict",UserDistrict);
            return DataAccess.ExecuteReaderCommand(cmd);
        }

        public DataTable SerchVerification(string Flag, string DateFrom, string DateTo, string UserDistrict)
        {
            var cmd = DataAccess.CreateCommand();
            cmd.CommandText = "[Membership].[VarificationSearch]";
            cmd.Parameters.AddWithValue("@DateTo", DateTo);
            cmd.Parameters.AddWithValue("@DateFrom", DateFrom);
            cmd.Parameters.AddWithValue("@UserDistrict",UserDistrict);
           // cmd.Parameters.AddWithValue("@UserID",UserID);
            //cmd.Parameters.AddWithValue("@DateTo", DateTo);
            cmd.Parameters.AddWithValue("@Flag", Flag);
            return DataAccess.ExecuteReaderCommand(cmd);
        }


        public DataTable IsVarified(string flag, string MemebershipID, string IsVerified)
        {
            var cmd = DataAccess.CreateCommand();
            cmd.CommandText = "[Membership].[usp_Membership]";
            cmd.Parameters.AddWithValue("@MembershipID", MemebershipID);
            cmd.Parameters.AddWithValue("@IsVerified", IsVerified);
            cmd.Parameters.AddWithValue("@flag", "v");
            return DataAccess.ExecuteReaderCommand(cmd);
        }


        //public DataTable IsDistrict(string flag, string MemebershipID, string IsDistrict)
        //{
        //    var cmd = DataAccess.CreateCommand();
        //    cmd.CommandText = "[Membership].[usp_Membership]";
        //    cmd.Parameters.AddWithValue("@MembershipID", MemebershipID);
        //    cmd.Parameters.AddWithValue("@UserDistrict", IsDistrict);
        //    cmd.Parameters.AddWithValue("@flag", "d");
        //    return DataAccess.ExecuteReaderCommand(cmd);
        //}



        public DataTable Renewmember(string renewDate, string memberId,decimal Amount)
        {
            var cmd = DataAccess.CreateCommand();
       
            cmd.CommandText = "[Membership].[usp_RenewMembership]";
            cmd.Parameters.AddWithValue("@MembershipID", memberId);
            cmd.Parameters.AddWithValue("@RenewDate", renewDate);
            cmd.Parameters.AddWithValue("@Amount",Amount );
            cmd.Parameters.AddWithValue("@Flag", "i");
            return DataAccess.ExecuteReaderCommand(cmd);
        }



        public DataTable CRUD1(USER user, string flag)
        {

            var cmd = DataAccess.CreateCommand();
            cmd.CommandText = "[Administartion].[usp_LoginUser]";
            cmd.Parameters.AddWithValue("@UserName", user.UserName);
            cmd.Parameters.AddWithValue("@UserPassword",user.Password);
            cmd.Parameters.AddWithValue("@UserAddress",user.Address);
            cmd.Parameters.AddWithValue("UserDistrict",user.District);
            cmd.Parameters.AddWithValue("@UserMobile",user.Mobile);
            cmd.Parameters.AddWithValue("@UserPost",user.Post);
            cmd.Parameters.AddWithValue("@UserRole",user.Role);
            cmd.Parameters.AddWithValue("@UserEmail",user.Email);
            cmd.Parameters.AddWithValue("@CreatedBy",user.CreatedBy);
            cmd.Parameters.AddWithValue("@IsActive",user.IsActive);
            cmd.Parameters.AddWithValue("@flag", flag);
             return DataAccess.ExecuteReaderCommand(cmd);
        }

        public DataTable find(string flag, string searchText)
        {
            var cmd = DataAccess.CreateCommand();
            cmd.CommandText = "[Administartion].[usp_LoginUser]";
            cmd.Parameters.AddWithValue("@SearchText", searchText);
            cmd.Parameters.AddWithValue("@Flag", flag);
            return DataAccess.ExecuteReaderCommand(cmd);
        }

        //public DataTable Del(string flag, string UserID)
        //{
        //    var cmd = DataAccess.CreateCommand();
        //    cmd.CommandText = "[Administartion].[usp_LoginUser]";
        //    cmd.Parameters.AddWithValue("@UserID",UserID);
        //    cmd.Parameters.AddWithValue("@flag","d");
        //    return DataAccess.ExecuteReaderCommand(cmd);
        //}

        public DataTable UserById(USER User, string UserID)
        {
            var cmd = DataAccess.CreateCommand();
            cmd.CommandText = "[Administartion].[usp_LoginUser]";
            cmd.Parameters.AddWithValue("@UserID",User.UserID );
            cmd.Parameters.AddWithValue("@flag", "s");
            return DataAccess.ExecuteReaderCommand(cmd);
        }


        public DataTable isActive(string flag, MembershipManager isActive)
        {
            throw new NotImplementedException();
        }

        public DataTable CRUD2(USER user, string flag) 
        {
            var cmd = DataAccess.CreateCommand();
            cmd.CommandText = "[Administartion].[usp_LoginUser]";
            cmd.Parameters.AddWithValue("@UserID", user.UserID);
            cmd.Parameters.AddWithValue("@UserName", user.UserName);
           
            cmd.Parameters.AddWithValue("@flag", flag);
            return DataAccess.ExecuteReaderCommand(cmd);
        }

        public DataTable CRUDV(Voucher voucher, string flag)
        {
            var cmd = DataAccess.CreateCommand();
            cmd.CommandText = "[Membership].[useVoucher]";
            cmd.Parameters.AddWithValue("@VoucherID",voucher.VoucherID);
            cmd.Parameters.AddWithValue("@Amount", voucher.Amount);
            cmd.Parameters.AddWithValue("@VoucherDate", voucher.VoucherDate);
            cmd.Parameters.AddWithValue("@VoucherNo", voucher.VoucherNo);
            cmd.Parameters.AddWithValue("@Narration", voucher.Narration);
            cmd.Parameters.AddWithValue("@Purpose", voucher.Purpose);
            cmd.Parameters.AddWithValue("@UserID", voucher.UserID);
            cmd.Parameters.AddWithValue("@District", voucher.District);
            cmd.Parameters.AddWithValue("@flag", flag);
            return DataAccess.ExecuteReaderCommand(cmd);
        }

    }
}
