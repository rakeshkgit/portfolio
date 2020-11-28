using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Net;
using System.IO;
using System.Text.RegularExpressions;
using System.Collections;
using System.Net.Mail;

public partial class get_in_touch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string From = txtemail.Text.Trim();
            string to = "neeraj@hanjicrystalcreation.com , info@shreejisoftech.com";
            string subject = "GET IN TOUCH!";
            string Body = "Name:- " + txtname.Text + Environment.NewLine + "<Br>" +
                          "Mobile Number:- " + txtmobile.Text + Environment.NewLine + "<Br>" +
                          "Email:- " + txtemail.Text + Environment.NewLine + "<Br>" +
                          "Company/Organization:- " + txtcompany.Text + Environment.NewLine + "<Br>" +
                          "Message:- " + txtmess.Text + Environment.NewLine;
            MailMessage msg = new MailMessage(From, to);
            msg.Subject = subject;
            AlternateView view;
            SmtpClient client;
            StringBuilder msgText = new StringBuilder();
            msgText.Append(Body);
            view = AlternateView.CreateAlternateViewFromString(msgText.ToString(), null, "text/html");
            msg.AlternateViews.Add(view);
            client = new SmtpClient();
            //client.Host = "smtp.gmail.com";
            client.EnableSsl = false;
            client.Port = 25;
            client.Host = "relay-hosting.secureserver.net";
            client.Credentials = new System.Net.NetworkCredential("enquiry.noreply@gmail.com", "enq@#123ABCD");
            client.Send(msg);
            Response.Redirect("mail-success.html");
            Reset();

        }

        catch (Exception ex)
        {

            Trace.Warn(ex.Message);

        }

    }
    public void Reset()
    {
        txtname.Text = "";
        txtmobile.Text = "";
		txtemail.Text = "";
		txtcompany.Text = "";
		txtmess.Text = "";
		
    }
}