<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ImageInfoControl.ascx.cs" Inherits="Telerik.WebControls.EditorControls.ImageInfoControl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table cellpadding="3" cellspacing="0">
	<tr>
		<td nowrap class="Label">
			<script>localization.showText('FileName');</script>
		</td>
		<td id="radEditorimagesrc" class="Text"></td>					
	</tr>
	<tr>
		<td nowrap class="Label">
			<script>localization.showText('imagesize');</script>
		</td>
		<td id="radEditorimagesize" class="Text"></td>
	</tr>
	<tr>
		<td nowrap class="Label">
			<script>localization.showText('ImageWidth');</script>
		</td>
		<td id="radEditorOriginalWidth" class="Text"></td>
	</tr>
	<tr>
		<td height="5"></td>
	</tr>
	<tr>
		<td width="80" class="Label">
			<script>localization.showText('ImageHeight');</script>
		</td>
		<td id="radEditorOriginalHeight" class="Text"></td>
	</tr>
</table>
<script language="javascript">
	var <%=this.ClientID%> = new ImageInfoControl();
</script>