<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="docmanage.aspx.cs" Inherits="Occupancy.docmanage" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3 class="card-title">Manage Documents</h3>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">





    <form id="form1" runat="server" style="height: 572px; width: 978px">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DOCUMENT_TYPE_ID" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="DOCUMENT_TYPE_ID" HeaderText="DOCUMENT_TYPE_ID" ReadOnly="True" SortExpression="DOCUMENT_TYPE_ID" />
            <asp:BoundField DataField="DOCUMENT_TYPE_NAME" HeaderText="DOCUMENT_TYPE_NAME" SortExpression="DOCUMENT_TYPE_NAME" />
            <asp:BoundField DataField="DOCUMENT_TYPE_DETAILS" HeaderText="DOCUMENT_TYPE_DETAILS" SortExpression="DOCUMENT_TYPE_DETAILS" />
            <asp:CheckBoxField DataField="ISACTIVE" HeaderText="ISACTIVE" SortExpression="ISACTIVE" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT * FROM [TBL_MST_DOCUMENT_TYPES]"></asp:SqlDataSource>
&nbsp;<br />
        <asp:Button ID="Button1" runat="server" PostBackUrl="~/docpop.aspx" Text="EDIT/ADD" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" PostBackUrl="~/docup.aspx" Text="UPLOAD" />
</form>





</asp:Content>
