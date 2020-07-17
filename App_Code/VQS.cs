using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Newwind
{
    public class VQS
    {
        public static string URL
        {
            get
            {
                if (ConfigurationSettings.AppSettings["URL"] != null)
                {
                    return ConfigurationSettings.AppSettings["URL"].ToString();
                }
                else
                {
                    if (HttpContext.Current.Request.Url.Port != 80)
                    {
                        if (HttpContext.Current.Request.ApplicationPath == "/") return HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Host + ":" + HttpContext.Current.Request.Url.Port;
                        else return HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Host + ":" + HttpContext.Current.Request.Url.Port + HttpContext.Current.Request.ApplicationPath;
                    }
                    else
                    {
                        if (HttpContext.Current.Request.ApplicationPath == "/") return HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Host;
                        else return HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.ApplicationPath;
                    }
                }
            }
        }
        public static string Key { get { return CMS.Setting.GetStringSetting("Website_Key"); } }
        public static string Ext { get { return CMS.Setting.GetStringSetting("Website_Ext"); } }
        public static string Control 
        { 
            get 
            {
                if (HttpContext.Current.Request.QueryString["c"] != null)
                {
                    return HttpContext.Current.Request.QueryString["c"].Replace(".", "").Replace("\\", "").Replace("/", "").Trim();
                }
                else return "Home";
            } 
        }

        string[] strItems;
        public static string Getkey(string key)
        {
            string percent = CMS.MsSql.ExecuteToString("SELECT ResourceValue from T_RESOURCESTRING where ResourceKey ='" + key + "'");
            return percent;
        }
        public VQS()
        {
             strItems = CMS.TTV.Web.Utils.GetStringFromQueryString("l","").Trim().Split('-');
        }

        public int Count { get { return strItems.Length; } }

        public bool Exists(int Index)
        {
            if (Index >= 0 && Index < strItems.Length) return true;
            else return false;
        }

        public string GetString(int Index)
        {
            if (Exists(Index)) return strItems[Index].Trim();
            else return "";
        }

        public int GetInt(int Index)
        {
            if (Exists(Index)) return CMS.Utils.ToInteger(strItems[Index]);
            else return 0;
        }

        public static string GetURL(string Control, string Title, params object[] Values)
        {
            string strURL = URL + "/";
            if (Key != "") strURL += Key + "/";
            strURL += Control + "/";
            string _Title = GetTitle(Title);

            string value = "";
            for (int i = 0; i < Values.Length; i++)
            {
                if (i == 0 && Values[0] is DateTime)
                {
                    strURL += String.Format("{0:yyyy-MM-dd}", Values[0]) + "/";
                }
                else
                {
                    value = Values[i].ToString().Trim();
                    if (i != Values.Length - 1) strURL += value + "-";
                    else
                    {
                        if (_Title != "") strURL += value + "/";
                        else strURL += value;
                    }
                }
            }

            if (_Title == "" && strURL.EndsWith("/")) strURL = strURL.Substring(0, strURL.Length - 1);
            strURL += _Title + Ext;
            return strURL.Replace("_", "-");

        }
        public static string GetURL2(string Control, string Title, string Title2, params object[] Values)
        {
            string strURL = URL + "/";
            // if (Key != "") strURL += Key + "/";
            strURL += Control + "/";
            string _Title = GetTitle(Title);
            string _Title2 = GetTitle(Title2);
            string value = "";
            if (_Title == "" && strURL.EndsWith("/")) strURL = strURL.Substring(0, strURL.Length - 1);

            strURL += _Title2 + "/";
            // strURL += _Title + "/";
            for (int i = 0; i < Values.Length; i++)
            {
                if (i == 0 && Values[0] is DateTime)
                {
                    strURL += String.Format("{0:yyyy-MM-dd}", Values[0]) + "/";
                }
                else
                {
                    value = Values[i].ToString().Trim();
                    if (i != Values.Length - 1) strURL += value + "-";
                    else
                    {
                        if (_Title != "") strURL += value;
                        else strURL += value;
                    }
                }
            }
            strURL += "/" + _Title + Ext;
            return strURL.Replace("_", "-");

        }
        public static string RemoveChar(string Title)
        {
            string str = "";
            char c;
            for (int i = 0; i < Title.Length; i++)
            {
                c = Title[i];
                if (Char.IsLetterOrDigit(c) || Char.IsWhiteSpace(c)) str += c.ToString();
                //if (!Char.IsSymbol(c)) str += c.ToString();
            }
            return str;
        }

        public static string GetTitle(string Title)
        {
            string strTitle = Newwind.VN.Remove(Title);
            strTitle = RemoveChar(strTitle);
            return strTitle.Trim().Replace(" ", "-").Replace("_", "-").Replace("'", "").Replace("/", "-").Replace("\\", "-").Replace("--", "-").Replace("--", "-");
        }
    }
}