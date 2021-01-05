<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="repo.aspx.cs" Inherits="Occupancy.repo" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3 class="card-title">Repository</h3>
</asp:Content>
                    

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">






    <form id="form1" runat="server" style="width: 1170px; height: 894px">
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT DISTINCT [ACCOUNT] FROM [TBL_MST_GOVT_CASES]"></asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT DISTINCT [STATE] FROM [TBL_MST_REPO]"></asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT DISTINCT [branchname] FROM [tbl_em_employeedetails]"></asp:SqlDataSource>


        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT DISTINCT [DOCUMENT_TYPE_NAME] FROM [TBL_MST_DOCUMENT_TYPES]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT DISTINCT [CATEGORY_NAME] FROM [TBL_MST_CATEGORIES]"></asp:SqlDataSource>

         <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT * FROM [TBL_MST_REPO]"></asp:SqlDataSource>
         <br />

         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ScriptManager ID="tsm" runat="server"></asp:ScriptManager>
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Category Name&nbsp;&nbsp;
    
    <asp:UpdatePanel runat="server" ID="up" UpdateMode="Conditional">
        <ContentTemplate>
    &nbsp;<asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_OnSelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="ACCOUNT" DataValueField="ACCOUNT" AppendDataBoundItems ="True">
             <asp:ListItem>Account</asp:ListItem>   
       </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddl2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_OnSelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="STATE" DataValueField="STATE"  AppendDataBoundItems="True">
             <asp:ListItem>State</asp:ListItem>  
        </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddl3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_OnSelectedIndexChanged" DataSourceID="SqlDataSource3" DataTextField="branchname" DataValueField="branchname"  AppendDataBoundItems="True">
             <asp:ListItem>Branch</asp:ListItem>  
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddl4" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_OnSelectedIndexChanged" DataSourceID="SqlDataSource4" DataTextField="DOCUMENT_TYPE_NAME" DataValueField="DOCUMENT_TYPE_NAME"  AppendDataBoundItems="True">
             <asp:ListItem>Document Type</asp:ListItem>  
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddl5" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_OnSelectedIndexChanged" DataSourceID="SqlDataSource5" DataTextField="CATEGORY_NAME" DataValueField="CATEGORY_NAME"  AppendDataBoundItems="True">
             <asp:ListItem>Repository Name</asp:ListItem>  
        </asp:DropDownList>
            <br />
        <br />
       


    <asp:GridView ID="gv" runat="server" AllowPaging="True" AllowSorting="True" OnRowDataBound="gv_RowDataBound" OnPageIndexChanging="gv_PageIndexChanging" OnSorting="gv_sort" EnableSortingAndPagingCallbacks="false" OnRowCommand="gv_RowCommand" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource6" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                 
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="REPO_NAME" HeaderText="REPO_NAME" ReadOnly="True" SortExpression="REPO_NAME" />
                <asp:BoundField DataField="ACCOUNT" HeaderText="ACCOUNT" ReadOnly="True" SortExpression="ACCOUNT" />
                <asp:BoundField DataField="BRANCH" HeaderText="BRANCH" ReadOnly="True" SortExpression="BRANCH" />
                <asp:BoundField DataField="STATE" HeaderText="STATE" ReadOnly="True" SortExpression="STATE" />
                <asp:BoundField DataField="DOCUMENT_NAME" HeaderText="DOCUMENT_NAME" ReadOnly="True" SortExpression="DOCUMENT_NAME" />
                <asp:BoundField DataField="DOC_TYPE" HeaderText="DOC_TYPE" ReadOnly="True" SortExpression="DOC_TYPE" />
                
                <asp:TemplateField HeaderText="View">
                    <ItemTemplate>
                        <asp:LinkButton ID="View" runat="server" ClientIDMode="AutoID" CommandArgument='<%#Eval("ID") %>' CommandName="View" Text="View"></asp:LinkButton>
                     </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DATE" HeaderText="DATE" DataFormatString="{0:dd/MM/yyyy}" SortExpression="DATE" />
                
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
        
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             </ContentTemplate>          
                <Triggers>
            <asp:PostBackTrigger ControlID="gv" runat="server"/>
        </Triggers>
    </asp:UpdatePanel>     
     
    </form>






</asp:Content>
