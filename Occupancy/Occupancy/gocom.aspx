<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="gocom.aspx.cs" Inherits="Occupancy.gocom" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3 class="card-title">Government Communications</h3>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">






    <form id="form1" runat="server" style="height: 741px; width: 965px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:ScriptManager ID="tsm" runat="server"></asp:ScriptManager>
    <div>
    <asp:UpdatePanel runat="server" ID="up" UpdateMode="Conditional">
        <ContentTemplate>
             <asp:DropDownList ID="ddl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_OnSelectedIndexChanged" DataSourceID="SqlDataSource1" DataValueField="ACCOUNT" DataTextField="ACCOUNT" AppendDataBoundItems="True">
     <asp:ListItem>Account</asp:ListItem>  
        </asp:DropDownList>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT DISTINCT [ACCOUNT] FROM [TBL_MST_GOVT_CASES]"></asp:SqlDataSource>
    

            <table style = "width: 100%">
                <tr>
                    <td style="text-align: right; width:70%;">
                    <asp:Button ID="btnAddNew1" runat="server" CausesValidation="false" Text="Add New" OnClick="btnAddNew_Click"/></td> 
                    <td></td>
                    <td></td>                  
                </tr>
                    <tr>
                       <td >


        <asp:GridView ID="gv" runat="server" AllowPaging="True" AllowSorting="True" EnableSortingAndPagingCallbacks="true" OnSorting="gv_sort" OnPageIndexChanging="gv_PageIndexChanging" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                 <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" Text="Edit" 

                        OnClick="lnkEdit_Click" 

                        runat="server"></asp:LinkButton>
                     </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="ACCOUNT" HeaderText="ACCOUNT" ReadOnly="True" SortExpression="ACCOUNT" />
                <asp:BoundField DataField="CASE_NAME" HeaderText="CASE_NAME" SortExpression="CASE_NAME" />
                <asp:BoundField DataField="CASE_DATE" HeaderText="CASE_DATE" DataFormatString="{0:dd/MM/yyyy}" SortExpression="CASE_DATE" />
                <asp:BoundField DataField="ACT" HeaderText="ACT" SortExpression="ACT" />
                <asp:BoundField DataField="DEPARTMENT" HeaderText="DEPARTMENT" SortExpression="DEPARTMENT" />
                <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                <asp:BoundField DataField="CASE_DETAILS" HeaderText="CASE_DETAILS" SortExpression="CASE_DETAILS" />
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
        

          </td>
                    </tr>
            </table>

            <!--Panel to add new record-->

  <ajaxToolkit:ModalPopupExtender ID="mpe1" runat="server" TargetControlID="btnAddNew1" PopupControlID="panelAddNew" X="25" Y="25" RepositionMode="RepositionOnWindowResizeAndScroll" DropShadow="true" PopupDragHandleControlID="panelAddNewTitle" BackgroundCssClass="modalBackground"  ></ajaxToolkit:ModalPopupExtender>
  <asp:Panel ID="panelAddNew" runat="server" style="display:none; background-color:antiquewhite;" ForeColor="Black" Width="1000" Height="700">
            <asp:Panel ID="panelAddNewTitle" runat="server" style="cursor:move;font-family:Tahoma;padding:2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="White" Height="25" ><b>Add New</b></asp:Panel>
            <table style="width:100%; padding:5px;">
                <tr>
                <td colspan="6">
                    <asp:Label ID="lblStatus1" runat="server"></asp:Label>
                </td>
                
                </tr>
                <tr>
                    <td><b>ID</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtid1" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="ID not editable" Display="None"  ControlToValidate="txtid1"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce1" TargetControlID="rfv1" runat="server"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                <!--
                </tr>
                <tr>
                    -->
                    <td><b>Account</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtacc1" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Account not editable"  Display="None" ControlToValidate="txtacc1"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce2" runat="server" TargetControlID="rfv2" ></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><b>Enter Case Name</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtcn1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv3" runat="server"  ErrorMessage="Enter Case Name" Display="None" ControlToValidate="txtcn1" ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server"  ID="vce3" TargetControlID="rfv3" ></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                <!--
                </tr>
                <tr>
                    -->
                    <td><b>Case Date</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtcdate1" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv4" runat="server" ErrorMessage="Case Date not editable" Display="None"  ControlToValidate="txtcdate1"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce4" TargetControlID="rfv4"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><b>Enter Act</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtact1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv5" runat="server" ErrorMessage="Enter Act" Display="None"  ControlToValidate="txtact1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce5" TargetControlID="rfv5"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Department</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtd1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv6" runat="server" ErrorMessage="Enter Department" Display="None"  ControlToValidate="txtd1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce6" TargetControlID="rfv6"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>

                 <tr>
                    <td><b>Enter Status</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txts1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv7" runat="server" ErrorMessage="Enter Status" Display="None"  ControlToValidate="txts1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce7" TargetControlID="rfv7"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Case Details</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtcd1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv8" runat="server" ErrorMessage="Enter Case Details" Display="None"  ControlToValidate="txtcd1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce8" TargetControlID="rfv8"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
            
            </table>
            <br />
                <div style = "width:100%; margin: 0 auto;">
                <asp:Button ID="btnAddNew2" runat="server" Width="70" Text="Add" OnClick="btnAddNew_Click"  ValidationGroup="add"/>
                &nbsp;
                <asp:Button ID="btnCancel1" runat="server" Width="70" Text="Cancel" CausesValidation="false" OnClick="Cancel1_Click" ValidationGroup="add"/>
            </div>
        </asp:Panel>   
            <!--End of Panel to add new record-->

            <!--Panel to Edit record-->         
  <asp:Button ID="btnDummy1" runat="server" style="display:none"/>   
  <ajaxToolkit:ModalPopupExtender ID="mpe2" runat="server" TargetControlID="btnDummy1" PopupControlID="panelEdit" X="25" Y="25" RepositionMode="RepositionOnWindowResizeAndScroll" DropShadow="true" PopupDragHandleControlID="panelEditTitle" BackgroundCssClass="modalBackground" ></ajaxToolkit:ModalPopupExtender>
  <asp:Panel ID="panelEdit" runat="server" style="display:none; background-color:antiquewhite;" ForeColor="Black" Width="1000" Height="700">
            <asp:Panel ID="panelEditTitle" runat="server" style="cursor:move;font-family:Tahoma;padding:2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="White" Height="25" ><b>Edit</b></asp:Panel>
            <table style="width:100%; padding:5px;">
                <tr>
                <td colspan="6">
                    <asp:Label ID="lblStatus2" runat="server"></asp:Label>
                </td>
                </tr>
                
                <tr>
                    <td><b>ID</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtid2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv14" runat="server" ErrorMessage="ID not editable" Display="None"  ControlToValidate="txtid2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce14" TargetControlID="rfv14" runat="server"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                 <!--
                </tr>
                <tr>
                    -->
                    <td><b>Account</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtacc2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv15" runat="server" ErrorMessage="Account not editable"  Display="None" ControlToValidate="txtacc2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce15" runat="server" TargetControlID="rfv15" ></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><b>Enter Case Name</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtcn2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv16" runat="server"  ErrorMessage="Enter Case Name" Display="None" ControlToValidate="txtcn2" ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server"  ID="vce16" TargetControlID="rfv16" ></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                 <!--
                </tr>
                <tr>
                    -->
                    <td><b>Case Date</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtcdate2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv17" runat="server" ErrorMessage="Case Date not editable" Display="None"  ControlToValidate="txtcdate2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce17" TargetControlID="rfv17"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><b>Enter Act</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtact2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv18" runat="server" ErrorMessage="Enter Act" Display="None"  ControlToValidate="txtact2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce18" TargetControlID="rfv18"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                 <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Department</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtd2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv19" runat="server" ErrorMessage="Enter Department" Display="None"  ControlToValidate="txtd2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce19" TargetControlID="rfv19"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>

                 <tr>
                    <td><b>Enter Status</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txts2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv20" runat="server" ErrorMessage="Enter Status" Display="None"  ControlToValidate="txts2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce20" TargetControlID="rfv20"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Case Details</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtcd2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv21" runat="server" ErrorMessage="Enter Case Details" Display="None"  ControlToValidate="txtcd2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce21" TargetControlID="rfv21"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                
                
            </table>
            <br />
                 <div style="width: 100%; margin: 0 auto;">
                <asp:Button ID="btnUpdate" runat="server" Width="70" Text="Update" OnClick="btnUpdate_Click"  ValidationGroup="edit"/>
                &nbsp;
                <asp:Button ID="btnCancel2" runat="server" Width="70" Text="Cancel" CausesValidation="false" OnClick="Cancel2_Click"/>
            </div>
        </asp:Panel>    
                   <!--End of Panel to edit record-->   
                                        
                                           
          
        </ContentTemplate>        
    </asp:UpdatePanel>
    </div>         




        <br />
    <br />
&nbsp;&nbsp;
    


</form>






</asp:Content>
