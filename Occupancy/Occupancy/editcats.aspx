<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editcats.aspx.cs" Inherits="Occupancy.editcats" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3 class="card-title">Edit/Add Categories</h3>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">





    <form id="form1" runat="server">
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ComplianceEntities4" DefaultContainerName="ComplianceEntities4" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="TBL_MST_CATEGORIES">
        </asp:EntityDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CATEGORY_ID" DataSourceID="EntityDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="CATEGORY_ID" HeaderText="CATEGORY_ID" ReadOnly="True" SortExpression="CATEGORY_ID" />
                <asp:BoundField DataField="CATEGORY_NAME" HeaderText="CATEGORY_NAME" SortExpression="CATEGORY_NAME" />
                <asp:BoundField DataField="CATEGORY_DETAILS" HeaderText="CATEGORY_DETAILS" SortExpression="CATEGORY_DETAILS" />
                <asp:CheckBoxField DataField="ISACTIVE" HeaderText="ISACTIVE" SortExpression="ISACTIVE" />
            </Columns>
        </asp:GridView>
    </form>





</asp:Content>
