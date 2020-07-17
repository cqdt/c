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

public partial class Admin_Controls_MenuTop : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Menus", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem2.Visible = false;
        }

        if (!CMS.TTV.Rule.IsModuleRule("Articles", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem3.Visible = false;
        }
        if (!CMS.TTV.Rule.IsModuleRule("Links", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem6.Visible = false;
        }
        //if (!CMS.TTV.Rule.IsModuleRule("Tuyendungs", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem144.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("Tim-viecs", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem36.Visible = false;
        //}
        if (!CMS.TTV.Rule.IsModuleRule("Banners", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem16.Visible = false;
        }
        //if (!CMS.TTV.Rule.IsModuleRule("Advs", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem444.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("FAQs", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem55.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("SetPass", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem34.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("Danh-sach-diem-kiem-tra-tieng-han", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem17.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("Register_CEs", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem5.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("Danh-sach-duoc-cap-chung-chi-CE", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem35.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("List_LD_KYHDs", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem37.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("Tu-nghiep-sinhs", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem4.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("List_xuat_canh", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem44.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("Diem-kiem-tra-tay-nghes", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem41.Visible = false;
        //}

        //if (!CMS.TTV.Rule.IsModuleRule("Tinh-trang-ho-sos", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem42.Visible = false;
        //}


        //if (!CMS.TTV.Rule.IsModuleRule("Danh-sach-dang-ky-cap-CE", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem33.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("Register_Koreas", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem15.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("Danh-sach-dang-ky-kiem-tra-tieng-han", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem32.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("Thong-ke-TNS", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem38.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("Thong-ke-ky-hop-dong", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem40.Visible = false;
        //}
        //if (!CMS.TTV.Rule.IsModuleRule("Thong-ke-xuat-canh", CMS.TTV.Rules.APPROVE))
        //{
        //    RadMenuItem39.Visible = false;
        //}
        if (!CMS.TTV.Rule.IsModuleRule("GImages", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem19.Visible = false;
        }
        if (!CMS.TTV.Rule.IsModuleRule("Images", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem20.Visible = false;
        }
        if (!CMS.TTV.Rule.IsModuleRule("SendMail", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem21.Visible = false;
        }
        if (!CMS.TTV.Rule.IsModuleRule("Users", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem23.Visible = false;
        }
        if (!CMS.TTV.Rule.IsModuleRule("Langs", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem24.Visible = false;
        }
        if (!CMS.TTV.Rule.IsModuleRule("User_Log", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem25.Visible = false;
        }
        if (!CMS.TTV.Rule.IsModuleRule("Log", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem26.Visible = false;
        }
        if (!CMS.TTV.Rule.IsModuleRule("Config", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem27.Visible = false;
        }
        if (!CMS.TTV.Rule.IsModuleRule("User_Pass", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem29.Visible = false;
        }
        if (!CMS.TTV.Rule.IsModuleRule("User_Info", CMS.TTV.Rules.APPROVE))
        {
            RadMenuItem30.Visible = false;
        }
    }
}
