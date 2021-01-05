<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="docup.aspx.cs" Inherits="Occupancy.docup" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3 class="card-title">Upload Documents</h3>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">






    <form id="form1" runat="server" style="height: 496px; width: 889px">
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT DISTINCT [ACCOUNT] FROM [TBL_MST_GOVT_CASES]"></asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT DISTINCT [STATE] FROM [TBL_MST_REPO]"></asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT DISTINCT [branchname] FROM [tbl_em_employeedetails]"></asp:SqlDataSource>


        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT DISTINCT [DOCUMENT_TYPE_NAME] FROM [TBL_MST_DOCUMENT_TYPES]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT DISTINCT [CATEGORY_NAME] FROM [TBL_MST_CATEGORIES]"></asp:SqlDataSource>


        &nbsp; Please select all dropdowns before uploading document<br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="up" UpdateMode="Conditional">
        <ContentTemplate>
&nbsp;<asp:DropDownList ID="ddl1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ACCOUNT" DataValueField="ACCOUNT" AppendDataBoundItems ="True">
             <asp:ListItem>Account</asp:ListItem>   
       </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddl2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="STATE" DataValueField="STATE"  AppendDataBoundItems="True">
             <asp:ListItem>State</asp:ListItem>  
        </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddl3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="branchname" DataValueField="branchname"  AppendDataBoundItems="True">
             <asp:ListItem>Branch</asp:ListItem>  
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddl4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="DOCUMENT_TYPE_NAME" DataValueField="DOCUMENT_TYPE_NAME"  AppendDataBoundItems="True">
             <asp:ListItem>Document Type</asp:ListItem>  
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddl5" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="CATEGORY_NAME" DataValueField="CATEGORY_NAME"  AppendDataBoundItems="True">
             <asp:ListItem>Category</asp:ListItem>  
        </asp:DropDownList>
        <br />
        <br />
        <br />
              
        </ContentTemplate>        
    </asp:UpdatePanel>
        <br />
        <br />
      
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            Please wait....
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click" OnClientClick="ShowProgress();"/>
            <br />
            <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="Button1" runat="server"/>
        </Triggers>
    </asp:UpdatePanel>
    
    
    </form>






</asp:Content>
