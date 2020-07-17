<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuLeft.ascx.cs" Inherits="Modules_Controls_MenuLeft" %>
<script type="text/javascript" language="javascript">

function expand(s,i)
{
  var d = s.getElementsByTagName("div").item(i);
  d.className = "menuHover";
}

function collapse(s,i)
{
  var d = s.getElementsByTagName("div").item(i);
  d.className = "menuNormal";
}

</script>
 
    <%= strHTMLMenu %>         
