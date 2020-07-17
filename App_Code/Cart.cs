using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

/// <summary>
/// Summary description for Cart
/// </summary>
/// 
namespace Newwind
{
    public class Cart
    {
        SortedList mCartItem;

        public Cart()
        {
            if (CMS.Setting.GetBoolSetting("CartUseSession"))
            {
                if (!CMS.Session.Exists("TWEB_Cart"))
                {
                    mCartItem = new SortedList();
                }
                else
                {
                    try
                    {
                        mCartItem = (SortedList)(CMS.Session.Get("TWEB_Cart"));
                    }
                    catch
                    {
                        mCartItem = new SortedList();
                    }
                }
            }
            else
            {
                mCartItem = new SortedList();
                if (HttpContext.Current.Request.Cookies["TWEB_Cart"] != null)
                {
                    string[] arrKey = HttpContext.Current.Request.Cookies["TWEB_Cart"].Values.AllKeys;
                    foreach (string strKey in arrKey)
                    {
                        int iKey = CMS.Utils.ToInteger(strKey);
                        int iValue = CMS.Utils.ToInteger(HttpContext.Current.Request.Cookies["TWEB_Cart"][strKey]);
                        mCartItem.Add(iKey, iValue);
                    }
                }
            }
        }

        public bool Exists(int ItemID)
        {
            if (mCartItem.ContainsKey(ItemID)) return true;
            else return false;
        }

        public void Add(int ItemID, int Value,bool Check)
        {
            if (!Exists(ItemID))
            {
                mCartItem.Add(ItemID, Value);
            }
            else
            {
                int iIndex = mCartItem.IndexOfKey(ItemID);
                int iValue = 0;
                if (Check) iValue = (int)mCartItem[ItemID];
                iValue += Value;
                mCartItem.SetByIndex(iIndex, iValue);
            }
        }

        public void Add(int ItemID, int Value)
        {
            Add(ItemID, Value, true);
        }

        public void Add(int ItemID)
        {
            Add(ItemID, 1, true);
        }

        public int Get(int ItemID, int Default)
        {
            if (!Exists(ItemID))
            {
                return Default;
            }
            else
            {
                return (int)mCartItem[ItemID];
            }
        }

        public int Get(int ItemID)
        {
            return Get(ItemID, 0);
        }

        public string GetListStringItems()
        {
            string str = "";
            for (int i = 0; i < mCartItem.Count; i++)
            {
                if (i == 0) str = mCartItem.GetKey(i) + "";
                else str += "," + mCartItem.GetKey(i);
            }
            return str;
        }

        public int[] GetListIntItems()
        {
            int[] iArr = new int[mCartItem.Count];
            for (int i = 0; i < mCartItem.Count; i++)
            {
                iArr[i] = (int)mCartItem.GetKey(i);
            }
            return iArr;
        }

        public void Remove(int ItemID)
        {
            if (Exists(ItemID))
            {
                mCartItem.Remove(ItemID);
            }
        }

        public void RemoveAll()
        {
            mCartItem.Clear();
        }

        public void Save()
        {
            if (mCartItem.Count > 0)
            {
                if (CMS.Setting.GetBoolSetting("CartUseSession"))
                {
                    CMS.Session.Set("TWEB_Cart", mCartItem);
                }
                else
                {
                    HttpContext.Current.Response.Cookies["TWEB_Cart"].Value = "";
                    int[] iArr = GetListIntItems();
                    for (int i = 0; i < iArr.Length; i++)
                    {
                        int iKey = iArr[i];
                        int iValue = Get(iKey);
                        HttpContext.Current.Response.Cookies["TWEB_Cart"][iKey + ""] = iValue + "";
                    }
                }
            }
            else
            {
                if (CMS.Setting.GetBoolSetting("CartUseSession"))
                {
                    CMS.Session.Remove("TWEB_Cart");
                }
                else
                {
                    HttpContext.Current.Response.Cookies["TWEB_Cart"].Value = "";
                    HttpContext.Current.Response.Cookies["TWEB_Cart"].Expires = System.DateTime.Now.AddDays(-2);
                }
            }
        }
    }
}
