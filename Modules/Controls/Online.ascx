<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Online.ascx.cs" Inherits="Modules_Base_Online" %>

<span class="homnay">Trực tuyến: <%= Application["visitors_online"].ToString()%></span> <br />

<span class="homnay">Hôm nay: <%= Application["HomNay"].ToString()%></span> <br /> 
<span class="homnay">Tháng này: <%= Application["ThangNay"].ToString()%></span> <br />           
<span class="tongso">Tổng số: <%= Application["TatCa"].ToString()%></span>
              
              
           
           