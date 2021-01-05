<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="catadd.aspx.cs" Inherits="Occupancy.catadd" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3 class="card-title">Edit/Add Categories</h3>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">






    <form id="form1" runat="server">
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ComplianceEntities4" DefaultContainerName="ComplianceEntities4" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="TBL_MST_CATEGORIES">
        </asp:EntityDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="CATEGORY_ID" DataSourceID="EntityDataSource1" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="CATEGORY_ID" HeaderText="CATEGORY_ID" ReadOnly="True" SortExpression="CATEGORY_ID" />
                <asp:BoundField DataField="CATEGORY_NAME" HeaderText="CATEGORY_NAME" SortExpression="CATEGORY_NAME" />
                <asp:BoundField DataField="CATEGORY_DETAILS" HeaderText="CATEGORY_DETAILS" SortExpression="CATEGORY_DETAILS" />
                <asp:CheckBoxField DataField="ISACTIVE" HeaderText="ISACTIVE" SortExpression="ISACTIVE" />
                <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <br />
    </form>






</asp:Content>
