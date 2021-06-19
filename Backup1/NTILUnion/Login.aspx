﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NTILUnion.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>Login</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <meta name="MobileOptimized" content="320">
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"
        type="text/css" />
    <link href="/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link rel="stylesheet" type="text/css" href="/assets/plugins/select2/select2_metro.css" />
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME STYLES -->
    <link href="/assets/css/style-metronic.css" rel="stylesheet" type="text/css" />
    <link href="/assets/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/assets/css/style-responsive.css" rel="stylesheet" type="text/css" />
    <link href="/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
    <link href="/assets/css/pages/login.css" rel="stylesheet" type="text/css" />
    <link href="/assets/css/custom.css" rel="stylesheet" type="text/css" />
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- BEGIN BODY -->
<body class="login">
    <!-- BEGIN LOGO -->
    <div class="logo" style="color: #FFFFFF; font-size: 30px;">
    </div>
    <!-- END LOGO -->
    <!-- BEGIN LOGIN -->
    <div class="content">
        <!-- BEGIN LOGIN FORM -->
        <form id="Form1" class="login-form" runat="server">
        <div>
            <h3 class="form-title">
                Login to your account</h3>
            <div class="alert alert-danger display-hide" id="parentdiv" runat="server">
                <button class="close" data-close="alert">
                </button>
                <span id="messageBoard" runat="server">Enter any username and password.</span>
            </div>
            <div id="msg" runat="server">
            </div>
            <div class="form-group">
                <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                <label class="control-label visible-ie8 visible-ie9">
                    Username</label>
                <div class="input-icon">
                    <i class="fa fa-user"></i>
                    <asp:TextBox ID="txtUserName" autocomplete="off" placeholder="Username" runat="server"
                        class="form-control placeholder-no-fix"></asp:TextBox>
                  
                </div>
                <label for="<%= txtUserName.ClientID%>" class="error" style="display: none">
                </label>
            </div>
            <div class="form-group">
                <label class="control-label visible-ie8 visible-ie9">
                    Password</label>
                <div class="input-icon">
                    <i class="fa fa-lock"></i>
                    <asp:TextBox ID="txtPassword" autocomplete="off" placeholder="Password" runat="server"
                        class="form-control placeholder-no-fix" TextMode="Password"></asp:TextBox>
             
                </div>
                <label for="<%= txtPassword.ClientID%>" class="error" style="display: none">
                </label>
            </div>
            <div class="form-group">
                <label class="control-label visible-ie8 visible-ie9">
                    District</label>
                <div class="input-icon">
                    <i class="fa fa-lock"></i>
                    <asp:DropDownList ID="DropAddressDistrictID" CssClass="form-control dropdown" class="form-control placeholder-no-fix" runat="server">
                        <asp:ListItem Value="Select District"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="form-actions">
            <label class="checkbox">
                <input type="checkbox" name="remember" value="1" />
                Remember me
            </label>
            <asp:Button ID="btnLogin" class="btn green pull-right" runat="server" Text="Login"
                OnClientClick="return checkFromValidation();" OnClick="btnLogin_Click" />
            <%--<button type="button" class="btn green pull-right" id="btn_login" onclick="return btn_login_onclick()">
				Login <i class="m-icon-swapright m-icon-white"></i>

				</button>    --%>
            <input type="hidden" name="id" id="id" /><br />
            <span id="popup" style="display: none; text-align: center">
                <img src="assets/img/loading.gif" /></span>
        </div>
        <div class="forget-password">
            <h4>
                Forgot your password ?</h4>
            <p>
                No worries, click <a href="javascript:;" id="forget-password">here</a> to reset
                your password.
            </p>
        </div>
        <div class="create-account">
            <p>
                Don't have an account yet ?&nbsp; <a href="javascript:;" id="register-btn">Create an
                    account</a>
            </p>
        </div>
    </div>
    </form>
    <div class="copyright">
        2014 &copy; Copyright.
    </div>
    <script src="/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script src="/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
    <script src="/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
    <script src="/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="/assets/plugins/jquery-validation/dist/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript" src="/assets/plugins/select2/select2.min.js"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="/assets/scripts/app.js" type="text/javascript"></script>
    <script type="text/javascript" src="/assets/plugins/jquery-validation/dist/jquery.validate.js"></script>
    <script src="/assets/plugins/jquery-validation/dist/additional-methods.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <script type="text/javascript">

        var checkFromValidation = false;

        $(document).ready(function () {
            $('#form').validate();
            $("#<%=txtUserName.ClientID %>").rules('add', { required: true, messages: { required: 'Fiscal Year is required.'} });
            $("#<%=txtPassword.ClientID %>").rules('add', { required: true, messages: { required: 'Fiscal Year is required.'} });


            checkFromValidation = function () {
                var bool = true;
                if ($('#<%=txtUserName.ClientID %>').valid() == false) bool = false;
                if ($('#<%=txtPassword.ClientID %>').valid() == false) bool = false;
                if (!bool) $('#form').validate().focusInvalid();
                return bool;
            }
        });

    </script>
    <script type="text/javascript">

        jQuery(document).ready(function () {
            App.init();
            Login.init();

        });

	   

    </script>
    <%-- <script type="text/javascript" runat="server">
        Function setSession() As Boolean
            CreateSession("userName", "role")
            Return True
        End Function
          function Setsession() { 
        
             "<%= CreateSession('userName', 'role')%>")
        }
    </script>
	<!-- END JAVASCRIPTS -->
    <%= CreateSession("userName", "role")%>--%>
</body>
<!-- END BODY -->
</html>
