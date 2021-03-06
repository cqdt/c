using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Text.RegularExpressions;

using System.Data.SqlClient;


namespace TTV
{
    public class Utils
    {

        public static string ScanURL(string url)
        {
            string ketqua = GetHtmlFromURL(url);
            return ketqua;
        }
        public static string GetVip(object _obj)
        {
            if (!CMS.Utils.ToBoolean(_obj)) return "";
            else return "<img src=\"images/hot_ico2.gif\" alt=\"vip\" width=\"21\" height=\"12\" />";
        }

        public static string GetNew(string dt)
        {
            DateTime startdate = DateTime.Parse(dt);
            DateTime nowdate = DateTime.Now;
            TimeSpan ts = nowdate - startdate;
            double total = ts.TotalDays;
            if (total > 7) return "";
            else return "<img src=\"images/new.gif\" alt=\"vip\" width=\"33\" height=\"16\" />";
        }

        public static string PageMultiDataList(int Total, int Column, int Rows, int CurrentPage, int MaxPage, string URL, string Css, ref int TotalStart, ref int TotalEnd)
        {
            int iTotal = Column * Rows;
            string strHtmlPage = "<table border=\"0\"><tr>";
            int min = (int)(CurrentPage / MaxPage) * MaxPage;
            int max = min + MaxPage;
            System.Double max2 = (double)Total / ((double)iTotal);
            TotalStart = CurrentPage * iTotal;
            TotalEnd = (CurrentPage + 1) * iTotal;
            if (max2 - CurrentPage < 1) TotalEnd = Total;

            if (max2 > 1)
            {
               
                if (max > MaxPage)
                {
                    strHtmlPage += "<td><a class=\"" + Css + "\" href=\"" + GetURLP(URL,CMS.Utils.ToString((min - 1))) + "\">Quay lại</a></td>";
                }
                for (int i = min; i < max; i++)
                {
                    if (i != CurrentPage)
                    {
                        if (i < max2)
                        {
                            strHtmlPage += "<td><a class=\"" + Css + "\" href=\"" + GetURLP(URL, CMS.Utils.ToString(i)) + "\">" + (i + 1) + "</a></td>";
                        }
                    }
                    else
                    {
                        if (i < max2) strHtmlPage += "<td><a class=\"" + Css + "_select\" href=\"#\">" + (i + 1) + "</a></td>";
                    }
                }
                if (max < max2)
                {
                    strHtmlPage += "<td><a class=\"" + Css + "\" href=\"" + GetURLP(URL, CMS.Utils.ToString(max)) + "\">Tiếp theo</a></td>";
                }
            }
            strHtmlPage += "</tr></table>";
            return strHtmlPage;
        }

        public static string GetURLP(string key, string value)
        {
            string sURL = string.Empty;
            string sKey = string.Empty;
            string sValue = string.Empty;
            for (int i = 0; i < HttpContext.Current.Request.QueryString.Count; i++)
            {
                sKey = HttpContext.Current.Request.QueryString.GetKey(i);
                sValue = HttpContext.Current.Request.QueryString[sKey];
                if (sKey.ToLower() == key.ToLower() || sKey.ToLower() == "c" || sKey.ToLower() == "l") continue;

                if (sURL == string.Empty) sURL = "?" + sKey + "=" + HttpContext.Current.Server.UrlEncode(sValue);
                else sURL += "&" + sKey + "=" + HttpContext.Current.Server.UrlEncode(sValue);
            }
            sURL += (sURL == string.Empty ? "?" : "&") + key + "=" + value;
            return sURL;
        }

        public static string GetControl(object _obj)
        {
            string strMenu2="";
            int PK_MENU = CMS.Utils.ToInteger(_obj);
          //  if (str == "")
          //  {
            strMenu2 = CMS.MsSql.ExecuteToString("SELECT C_NAME FROM T_MENU WHERE PK_MENU= (SELECT C_PARENT FROM T_MENU WHERE PK_MENU =" + PK_MENU + ")");
           // }
            return strMenu2;
        }

        public static string GetControlParent(object _obj)
        {
            string strMenu="";
            int PK_MENU = CMS.Utils.ToInteger(_obj);
           // if (str == "")
           // {
            strMenu = CMS.MsSql.ExecuteToString("SELECT C_NAME FROM T_MENU WHERE PK_MENU=" + PK_MENU); 
           // }
            return strMenu;
        }

        public static DataTable DTPage(DataTable _objdt, int intStart, int intEnd)
        {
            DataTable _objdt2 = new DataTable();
            for (int i = 0; i < _objdt.Columns.Count; i++)
            {
                _objdt2.Columns.Add(new DataColumn(_objdt.Columns[i].ColumnName,_objdt.Columns[i].DataType));
            }
            for (int j = intStart; j < intEnd; j++)
            {
                if (j >= _objdt.Rows.Count) break;
                DataRow dr = _objdt2.NewRow();
                for (int i = 0; i < _objdt.Columns.Count; i++)
                {
                    dr[i] = _objdt.Rows[j][i];
                }
                _objdt2.Rows.Add(dr);
            }
            return _objdt2;
        }

        public static int GetLangIDFromAimageID(int AimageID)
        {
            string sql = "SELECT FK_LANG FROM T_MENU WHERE PK_MENU=(SELECT FK_MENU FROM T_AIMAGE WHERE PK_AIMAGE=" + AimageID + ")";
            return CMS.SqlCache.ExecuteToInt(sql);
        }


        public static string SetNull(object _obj)
        {
            string str = _obj.ToString();
            if (str == "0")
            {
                str = "<span>Liên hệ</span>";
            }
            return str;
        }
        
      

        public static object CheckEmtyImage(object _obj)
        {
            string str = _obj.ToString().Trim();
            if (str == "")
            {
                return str = "~/images/img_no_image_4.gif";
            }
            else return str;
        }
        
      
        public static int GetCparentIDFromMenuID(int mID)
        {
            string sql = "select C_PARENT FROM T_MENU WHERE PK_MENU=" + mID;
            return CMS.SqlCache.ExecuteToInt(sql);
        }

        public static int GetCountIDFromCparentID(int cID)
        {
            string sql = "select count(PK_MENU) FROM T_MENU WHERE C_PARENT=" + cID;
            return CMS.SqlCache.ExecuteToInt(sql);
        }

        public static int GetMenuIDFromCparentID(int cID)
        {
            string sql = "select top 1 PK_MENU from T_MENU Where C_PARENT=" + cID +" order by PK_MENU";
            return CMS.SqlCache.ExecuteToInt(sql);
        }


        public static int GetC_MenuIDFromMenuID(int mID)
        {
            string sql = "select C_PARENT from T_MENU Where PK_MENU=" + mID;
            return CMS.SqlCache.ExecuteToInt(sql);
        }

        public static int GetFK_MENUFromaID(int aID)
            {
                string sql = "select FK_MENU from T_ARTICLE where PK_ARTICLE=" + aID;
                return CMS.SqlCache.ExecuteToInt(sql);
            }

        public static int GetoIDFromMenuID(int mID)
        {
            string sql = "select C_PARENT from T_MENU Where PK_MENU=" + mID;
            int cID = CMS.SqlCache.ExecuteToInt(sql);
            string sql1 = "select C_PARENT from T_MENU Where PK_MENU=" + cID;
            return CMS.SqlCache.ExecuteToInt(sql1);
        }

        public static int GetMenuIDFromCparentIDdesc(int cID)
        {
            string sql = "select top 1 PK_MENU from T_MENU Where C_PARENT=" + cID + " order by PK_MENU desc";
            return CMS.SqlCache.ExecuteToInt(sql);
        }

       

        public static int GetArticleIDFromArticleID(int ArticleID)
        {
            return GetArticleIDFromArticleID(ArticleID, CMS.Lang.LangValue);
        }

        public static int GetArticleIDFromArticleID(int ArticleID,int iLangID)
        {
            string sql = "SELECT PK_ARTICLE FROM T_ARTICLE WHERE (SELECT FK_LANG FROM T_MENU WHERE PK_MENU=T_ARTICLE.FK_MENU)=" + iLangID + " AND FK_ARTICLE=" + ArticleID;
            return CMS.SqlCache.ExecuteToInt(sql);
        }


        public static string CreateLink(string _img_url, object _obj_url)
        {
            if (_obj_url == null) return _img_url;
            string str = _obj_url.ToString();
            str = str.Trim();
            if (str == "") return _img_url;
            return "<a href=\"" + str + "\" target=\"_blank\">" + _img_url + "</a>";
        }

        public static string Cut2(object _obj_url)
        {
            string str = _obj_url.ToString();
            if (str.Length > 2) str = str.Substring(2);
            return str;
        }
        public static object SetDateNull(string shc, object _obj)
        {
            if (shc != "") return _obj;
            else return "";
        }
        public static string GetHtmlFromURL(string url)
        {
            string strHtml = "";

            object _obj = CMS.Cache.Get("Web_Cache_" + url.GetHashCode());
            if (_obj != null)
            {
                strHtml = _obj.ToString();
            }
            else
            {
                try
                {
                    System.Net.WebClient a = new System.Net.WebClient();
                    byte[] b = a.DownloadData(url);
                    strHtml = System.Text.Encoding.UTF8.GetString(b);
                    CMS.Cache.Insert("Web_Cache_" + url.GetHashCode(), strHtml,120);
                }
                catch { }
            }

            return strHtml.Trim();
        }


        public static string ConvertStringToUnSign(string s)
        {
            if (s.Length <= 0) s = "";
            string stFormD = s.Normalize(NormalizationForm.FormD);
            StringBuilder sb = new StringBuilder();
            for (int ich = 0; ich < stFormD.Length; ich++)
            {
                System.Globalization.UnicodeCategory uc = System.Globalization.CharUnicodeInfo.GetUnicodeCategory(stFormD[ich]);
                if (uc != System.Globalization.UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(stFormD[ich]);
                }
            }
            sb = sb.Replace('Đ', 'D');
            sb = sb.Replace('đ', 'd');
            return (sb.ToString().Normalize(NormalizationForm.FormD));
        }










        //==================================================================

        public static SqlConnection _ConnectionToDB;
        public static string _cnnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        public static string FixCNN(string connStr, bool Pooling)
        {
            string[] aconnStr = connStr.Split(';');
            string sTemp = "";

            for (int i = 0; i < aconnStr.Length; i++)
            {
                if (
                    !aconnStr[i].ToLower().StartsWith("pooling=")
                    && !aconnStr[i].ToLower().StartsWith("min pool size=")
                    && !aconnStr[i].ToLower().StartsWith("max pool size=")
                    && !aconnStr[i].ToLower().StartsWith("connect timeout=")
                    && !aconnStr[i].Equals("")
                    )
                {
                    sTemp += aconnStr[i] + ";";
                }
            }

            if (Pooling)
            {
                sTemp +=
                    "Pooling=true;Min Pool Size=5;Max Pool Size=15;Connect Timeout=2;Connection Reset = True;Connection Lifetime = 600;";
            }
            else
            {
                sTemp += "Pooling=false;Connect Timeout=45;";
            }
            return sTemp;
        }

        public static SqlConnection OpenConnection()
        {
            if (_cnnString == "")
            {
                throw new Exception("Connection String can not null");
            }
            SqlConnection mySqlConnection;

            try
            {
                mySqlConnection = new SqlConnection(FixCNN(_cnnString, true));
                mySqlConnection.Open();
                return mySqlConnection;
            }
            catch (Exception)
            {
                // De phong truong hop bi max pool thi se fix lai connection string pooling=false
                mySqlConnection = new SqlConnection(FixCNN(_cnnString, false));
                mySqlConnection.Open();
                return mySqlConnection;
                // throw (new Exception(myException.Message));
            }
        }

        public static void CloseConnection(SqlConnection mySqlConnection)
        {
            try
            {
                if (mySqlConnection != null)
                {
                    if (mySqlConnection.State == ConnectionState.Open)
                    {
                        mySqlConnection.Close();
                    }
                }
            }
            catch (SqlException myException)
            {
                throw (new Exception(myException.Message));
            }
        }


        public static DataSet getDataSet(SqlCommand sqlCommand)
        {
            SqlConnection conn = null;
            try
            {
                if (_ConnectionToDB == null)
                {
                    conn = OpenConnection();
                    sqlCommand.Connection = conn;
                }
                else
                {
                    sqlCommand.Connection = _ConnectionToDB;
                }
                SqlDataAdapter myDataAdapter = new SqlDataAdapter(sqlCommand);
                DataSet myDataSet = new DataSet();
                myDataAdapter.Fill(myDataSet);
                return myDataSet;
            }
            catch (SqlException myException)
            {
                throw (new Exception(myException.Message));
            }
            finally
            {
                if (conn != null)
                {
                    CloseConnection(conn);
                }
            }
        }


        public static void Import_GDVL(int FK_PHIEN, string C_CTY, string C_VITRI, string C_DIACHI, string C_TEL)
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            try
            {
                Conn.Open();
                SqlCommand cmdUpd = new SqlCommand("sp_Import_GDVL", Conn);
                cmdUpd.CommandType = CommandType.StoredProcedure;

                cmdUpd.Parameters.AddWithValue("@FK_PHIEN", FK_PHIEN);
                cmdUpd.Parameters.AddWithValue("@C_CTY", C_CTY);
                cmdUpd.Parameters.AddWithValue("@C_VITRI", C_VITRI);                
                cmdUpd.Parameters.AddWithValue("@C_DIACHI", C_DIACHI);                
                cmdUpd.Parameters.AddWithValue("@C_TEL", C_TEL);                
                cmdUpd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine("{0} Second exception caught.", ex);
            }
            finally
            {
                if (Conn.State == ConnectionState.Open)
                    Conn.Close();
                Conn.Dispose();
            }
        }

        public static void Import_khaibaothongtin(string C_MUCDICH, string C_HOTEN, string C_HOCHIEU, string C_NGAYNHAPCANH, string C_CMND, string C_SOTHE, string C_DIENTHOAI, string C_EMAIL, string C_TENDN1, string
                      C_NGUOISUDUNGLAODONG1, string C_DIENTHOAIDN1, string C_DIACHIDN1, string C_NGAYLAMVIECDN1, string C_TENDN2, string C_NGUOISUDUNGLAODONG2, string C_DIENTHOAIDN2, string C_DIACHIDN2, string
                      C_NGAYLAMVIECDN2, string C_TENDN3, string C_NGUOISUDUNGLAODONG3, string C_DIENTHOAIDN3, string C_DIACHIDN3, string C_NGAYLAMVIECDN3, string C_TENDN4, string
                      C_NGUOISUDUNGLAODONG4, string C_DIENTHOAIDN4, string C_DIACHIDN4, string C_NGAYLAMVIECDN4, string C_TENDN5, string C_NGUOISUDUNGLAODONG5, string C_DIENTHOAIDN5, string C_DIACHIDN5, string
                      C_NGAYLAMVIECDN5, string C_HOPDONGDEN, string C_LYDO, string C_NGAYHETHAN, string C_NGAYDANGKYVENUOC)
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            try
            {
                Conn.Open();
                SqlCommand cmdUpd = new SqlCommand("sp_Import_khaibaothongtin", Conn);
                cmdUpd.CommandType = CommandType.StoredProcedure;

                cmdUpd.Parameters.AddWithValue("@C_MUCDICH", C_MUCDICH);
                cmdUpd.Parameters.AddWithValue("@C_HOTEN", C_HOTEN);
                cmdUpd.Parameters.AddWithValue("@C_HOCHIEU", C_HOCHIEU);
                cmdUpd.Parameters.AddWithValue("@C_NGAYNHAPCANH", C_NGAYNHAPCANH);
                cmdUpd.Parameters.AddWithValue("@C_CMND", C_CMND);
                cmdUpd.Parameters.AddWithValue("@C_SOTHE", C_SOTHE);
                cmdUpd.Parameters.AddWithValue("@C_DIENTHOAI", C_DIENTHOAI);
                cmdUpd.Parameters.AddWithValue("@C_EMAIL", C_EMAIL);

                cmdUpd.Parameters.AddWithValue("@C_TENDN1", C_TENDN1);
                cmdUpd.Parameters.AddWithValue("@C_NGUOISUDUNGLAODONG1", C_NGUOISUDUNGLAODONG1);
                cmdUpd.Parameters.AddWithValue("@C_DIENTHOAIDN1", C_DIENTHOAIDN1);
                cmdUpd.Parameters.AddWithValue("@C_DIACHIDN1", C_DIACHIDN1);
                cmdUpd.Parameters.AddWithValue("@C_NGAYLAMVIECDN1", C_NGAYLAMVIECDN1);

                cmdUpd.Parameters.AddWithValue("@C_TENDN2", C_TENDN2);
                cmdUpd.Parameters.AddWithValue("@C_NGUOISUDUNGLAODONG2", C_NGUOISUDUNGLAODONG2);
                cmdUpd.Parameters.AddWithValue("@C_DIENTHOAIDN2", C_DIENTHOAIDN2);
                cmdUpd.Parameters.AddWithValue("@C_DIACHIDN2", C_DIACHIDN2);
                cmdUpd.Parameters.AddWithValue("@C_NGAYLAMVIECDN2", C_NGAYLAMVIECDN2);


                cmdUpd.Parameters.AddWithValue("@C_TENDN3", C_TENDN3);
                cmdUpd.Parameters.AddWithValue("@C_NGUOISUDUNGLAODONG3", C_NGUOISUDUNGLAODONG3);
                cmdUpd.Parameters.AddWithValue("@C_DIENTHOAIDN3", C_DIENTHOAIDN3);
                cmdUpd.Parameters.AddWithValue("@C_DIACHIDN3", C_DIACHIDN3);
                cmdUpd.Parameters.AddWithValue("@C_NGAYLAMVIECDN3", C_NGAYLAMVIECDN3);

                cmdUpd.Parameters.AddWithValue("@C_TENDN4", C_TENDN4);
                cmdUpd.Parameters.AddWithValue("@C_NGUOISUDUNGLAODONG4", C_NGUOISUDUNGLAODONG4);
                cmdUpd.Parameters.AddWithValue("@C_DIENTHOAIDN4", C_DIENTHOAIDN4);
                cmdUpd.Parameters.AddWithValue("@C_DIACHIDN4", C_DIACHIDN4);
                cmdUpd.Parameters.AddWithValue("@C_NGAYLAMVIECDN4", C_NGAYLAMVIECDN4);

                cmdUpd.Parameters.AddWithValue("@C_TENDN5", C_TENDN5);
                cmdUpd.Parameters.AddWithValue("@C_NGUOISUDUNGLAODONG5", C_NGUOISUDUNGLAODONG5);
                cmdUpd.Parameters.AddWithValue("@C_DIENTHOAIDN5", C_DIENTHOAIDN5);
                cmdUpd.Parameters.AddWithValue("@C_DIACHIDN5", C_DIACHIDN5);
                cmdUpd.Parameters.AddWithValue("@C_NGAYLAMVIECDN5", C_NGAYLAMVIECDN5);


                cmdUpd.Parameters.AddWithValue("@C_HOPDONGDEN", C_HOPDONGDEN);
                cmdUpd.Parameters.AddWithValue("@C_LYDO", C_LYDO);
                cmdUpd.Parameters.AddWithValue("@C_NGAYHETHAN", C_NGAYHETHAN);
                cmdUpd.Parameters.AddWithValue("@C_NGAYDANGKYVENUOC", C_NGAYDANGKYVENUOC);


                cmdUpd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine("{0} Second exception caught.", ex);
            }
            finally
            {
                if (Conn.State == ConnectionState.Open)
                    Conn.Close();
                Conn.Dispose();
            }
        }


        public static void Update_EPS(string C_ORDER, string C_HOTEN, string C_CMND, string C_NGAYSINH, string C_HOCHIEU, string C_SBD, string C_TINHTRANG)
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            try
            {
                Conn.Open();
                SqlCommand cmdUpd = new SqlCommand("sp_Update_EPS", Conn);
                cmdUpd.CommandType = CommandType.StoredProcedure;                
                cmdUpd.Parameters.AddWithValue("@C_HOTEN", C_HOTEN);
                cmdUpd.Parameters.AddWithValue("@C_CMND", C_CMND);
                cmdUpd.Parameters.AddWithValue("@C_NGAYSINH", C_NGAYSINH);
                cmdUpd.Parameters.AddWithValue("@C_HOCHIEU", C_HOCHIEU);
                cmdUpd.Parameters.AddWithValue("@C_SBD", C_SBD);
                cmdUpd.Parameters.AddWithValue("@C_TINHTRANG", C_TINHTRANG);
                cmdUpd.Parameters.AddWithValue("@C_ORDER", C_ORDER);
                cmdUpd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine("{0} Second exception caught.", ex);
            }
            finally
            {
                if (Conn.State == ConnectionState.Open)
                    Conn.Close();
                Conn.Dispose();
            }

        }


        public static string UploadImage2(object obj, string Name, string Dir, Random random)
        {
            FileUpload fuFile = null;
            if (obj is DetailsView) fuFile = ((DetailsView)obj).FindControl(Name) as FileUpload;
            if (obj is FileUpload) fuFile = obj as FileUpload;


            if (fuFile != null)
            {
                string strFileName = fuFile.FileName;
                string[] arrStr;
                string strFileType = "";
                string[] arrFileType = new string[] { "GIF", "PNG", "JPG", "JEPG", "BMP", "XLS", "XLSX" };
                if (strFileName != "")
                {
                    arrStr = strFileName.Split('.');
                    if (arrStr.Length > 1) strFileType = arrStr[arrStr.Length - 1].ToUpper();
                    if (Array.IndexOf(arrFileType, strFileType) > -1)
                    {
                        try
                        {
                            if (random != null)
                            {
                                DateTime dtTime = DateTime.Now;
                                strFileName = dtTime.Day + "_" + dtTime.Month + "_" + dtTime.Year + "_" + random.Next() + "." + strFileType.ToLower();
                            }

                            fuFile.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "/Uploads/" + Dir + "/" + strFileName);
                            return "~/Uploads/" + Dir + "/" + strFileName;
                        }
                        catch
                        {
                            return "ERR_SAVE";
                        }
                    }
                    else
                    {
                        return "ERR_TYPE";
                    }
                }
                else
                {
                    return "NO_FILE";
                }
            }
            return "NO_FILE";
        }



    }
}