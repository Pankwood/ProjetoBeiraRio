<%@ WebHandler Language="C#" Class="EnviaEmail" %>

using System;
using System.Web;

public class EnviaEmail : IHttpHandler {
    
    
    
    public void ProcessRequest (HttpContext context) {
        System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
        smtp.Host = "smtp.projetobeirario.com.br";
        smtp.Port = 587; // or 465 
        //smtp.EnableSsl = true;
        smtp.Credentials = new System.Net.NetworkCredential("contato@projetobeirario.com.br", "dan2006");

        System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
        msg.From = new System.Net.Mail.MailAddress("contato@projetobeirario.com.br");
        msg.To.Add("contato@projetobeirario.com.br");
        msg.Subject = "Web site inquiry";

        // Additional options
        // msg.IsBodyHtml   = true;
        // msg.BodyEncoding = Encoding.UTF8;
        // msg.Priority     = MailPriority.High;

        string strName = context.Request.Form["Nome"];
        string strEmail = context.Request.Form["Email"];
        string strPhone = context.Request.Form["Fone"];
        string strMessage = context.Request.Form["Msg"];

        string strBody = "";
        strBody += "Name:   " + strName + "\n";
        strBody += "E-mail: " + strEmail + "\n";
        strBody += "Phone:  " + strPhone + "\n";
        strBody += "Message:\n" + strMessage + "\n";

        msg.Body = strBody;

        context.Response.ContentType = "text/plain";
        try
        {
            smtp.Send(msg);
            context.Response.Redirect("index-4.html");

        }
        catch
        {
            context.Response.Redirect("index-4.html");
            context.Response.Write("Não foi possível enviar o email"); ;
        }

        msg.Dispose();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    
     private void SendEmail(string address, string content)
    {
        
    }


}