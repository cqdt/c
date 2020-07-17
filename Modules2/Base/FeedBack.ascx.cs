using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Modules_Base_FeedBack : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void dvFeedBack_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void dvFeedBack_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string strEmailFrom = e.Values["C_SENDER_EMAIL"].ToString();
        string strName = e.Values["C_SENDER_NAME"].ToString();
        string strContent = "";
        strContent += " Ten don vi :" + strName + "\r\n";
        strContent += " Dia chi :" + e.Values["C_SENDER_ADDRESS"] + "\r\n";
        strContent += " Tel :" + e.Values["C_SENDER_TEL"] + "\r\n";
        strContent += " Email :" + e.Values["C_SENDER_EMAIL"] + "\r\n";
        strContent += " Chu de :" + e.Values["C_TITLE"] + "\r\n";
        strContent += " Noi dung :" + e.Values["C_CONTENT"] + "\r\n";
        string strEmailTo = CMS.TTV.Config.GetStringValue("FEEDBACK_EMAIL");
        CMS.Utils.SendMail(strEmailTo, strEmailFrom, strName, "Thong tin lien he", strContent);

        pnFeedBack.Visible = true;
        dvFeedBack.Visible = false;
    }
}
