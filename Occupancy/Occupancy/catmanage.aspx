<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="catmanage.aspx.cs" Inherits="Occupancy.catmanage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3 class="card-title">View Categories</h3>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <form id="form1" runat="server" style="font-size: medium; height: 622px; width: 1048px;">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CATEGORY_ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="CATEGORY_ID" HeaderText="CATEGORY_ID" ReadOnly="True" SortExpression="CATEGORY_ID" />
                <asp:BoundField DataField="CATEGORY_NAME" HeaderText="CATEGORY_NAME" SortExpression="CATEGORY_NAME" />
                <asp:BoundField DataField="CATEGORY_DETAILS" HeaderText="CATEGORY_DETAILS" SortExpression="CATEGORY_DETAILS" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString3 %>" SelectCommand="SELECT * FROM [TBL_MST_CATEGORIES]"></asp:SqlDataSource>
        <br />
&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" PostBackUrl="~/catpop.aspx" Text="EDIT/ADD" />
        <br />
    </form>


</asp:Content>
