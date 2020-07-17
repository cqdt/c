<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SupportOnline.ascx.cs" Inherits="Modules_Controls_SupportOnline" %>


<div id="bg_menuleft">
  <center>    
     <asp:DataList ID="DataList1" runat="server" HorizontalAlign="Center" Width="100%" CaptionAlign="Top" DataSourceID="DataSource" RepeatColumns="1">
          <ItemTemplate>
          
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
          
                    <tr>
                     <td align="right" style="padding-right:5px">
                            <%# Eval("C_NAME")%>          
                        </td>
                      <td align="left">
                      <a href="ymsgr:sendIM?<%# Eval("C_YAHOO") %> "> 
                        <img border=0 src="http://opi.yahoo.com/online?u=<%# Eval("C_YAHOO") %>&m=g&t=1&l=us">
                        </a>                         
                          
                          <br>
                          
                          </td>
                    </tr>
        </table>
          
          </ItemTemplate>
  </asp:DataList>
   
  </center>
</div>
<asp:SqlDataSource ID="DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
   SelectCommand="SELECT * FROM T_SUPORT  ORDER BY PK_SUPORT  DESC">
  
</asp:SqlDataSource>