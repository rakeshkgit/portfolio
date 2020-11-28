<%@ Page Language="C#" AutoEventWireup="true" CodeFile="get-in-touch.aspx.cs" Inherits="get_in_touch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<script language="javascript" type="text/javascript">
    function validateLogin() {
        if (document.getElementById("<%=txtname.ClientID%>").value == "") {
            alert("Please enter your name");
            document.getElementById("<%=txtname.ClientID%>").focus();
            return false;
        }
        if (document.getElementById("<%=txtmobile.ClientID%>").value == "") {
            alert("Please enter phone number");
            document.getElementById("<%=txtmobile.ClientID%>").focus();
            return false;
        }
        var digits = "0123456789";
        var temp;
        for (var i = 0; i < document.getElementById("<%=txtmobile.ClientID %>").value.length; i++) {
            temp = document.getElementById("<%=txtmobile.ClientID%>").value.substring(i, i + 1);
            if (digits.indexOf(temp) == -1) {
                alert("Please enter correct phone number");
                document.getElementById("<%=txtmobile.ClientID%>").focus();
                return false;
            }
        }
        var emailPat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        var emailid = document.getElementById("<%=txtemail.ClientID %>").value;
        var matchArray = emailid.match(emailPat);
        if (matchArray == null) {
            alert("Your email address seems incorrect. Please try again.");
            document.getElementById("<%=txtemail.ClientID %>").focus();
            return false;
        }
		return true;
    }
    </script>
   <meta charset="utf-8">
     <title>Get In Touch</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- Preloader -->

<!-- Facebook Pixel Code -->
<script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '303860506981966');
  fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
  src="https://www.facebook.com/tr?id=303860506981966&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->
</head>
<body>
    <form id="form1" class="contact-form m-top-30" runat="server">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
											<span><i class="fa fa-user-o"></i></span>
											<asp:TextBox ID="txtname" runat="server" placeholder="Your Full Name"></asp:TextBox>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
										<span><i class="fa fa-mobile fa-lg"></i></span>
                                            <asp:TextBox ID="txtmobile" runat="server" MaxLength="10" placeholder="Mobile No."></asp:TextBox>	
                                            
										</div>
									</div>
                                    <div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
											
                                          <span><i class="fa fa-envelope-o"></i></span>
                                           <asp:TextBox ID="txtemail" runat="server" placeholder="Your Email"></asp:TextBox>   
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
											<span><i class="fa fa-globe"></i></span>
                                            <asp:TextBox ID="txtcompany" runat="server" placeholder="Company/Organization"></asp:TextBox>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group message">
											<span><i class="fa fa-pencil"></i></span>
											 <asp:TextBox ID="txtmess" rows="5" TextMode="MultiLine" runat="server" placeholder="Type Your Message"></asp:TextBox>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group button">	
                                            <asp:Button ID="Button1" runat="server" class="btn theme-2 effect" Text="Send Message" OnClientClick="return validateLogin()"
                                OnClick="Button1_Click"></asp:Button>
										</div>
									</div>
								</div>
							</form>
</body>
</html>
