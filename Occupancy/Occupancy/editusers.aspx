<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editusers.aspx.cs" Inherits="Occupancy.editusers" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3 class="card-title">Edit/Add Users</h3>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">






    <form id="form1" runat="server" style="height: 1157px; width: 1120px">
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ComplianceEntities4" DefaultContainerName="ComplianceEntities4" EnableFlattening="False" EnableUpdate="True" EntitySetName="tbl_em_employeedetails">
        </asp:EntityDataSource>
         <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT [ROLE_NAME] FROM [TBL_MST_ROLES]"></asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT [ROLE_NAME] FROM [TBL_eM_employeedetails]"></asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ComplianceConnectionString4 %>" SelectCommand="SELECT DISTINCT [branchNAME] FROM [TBL_em_employeedetails]"></asp:SqlDataSource>


         <asp:ScriptManager ID="tsm" runat="server"></asp:ScriptManager>

        <br />

         <div>
    <asp:UpdatePanel runat="server" ID="up" UpdateMode="Conditional">

        <ContentTemplate>
            <table style = "width: 100%; height: 406px;">
                <tr>
                    <td style="text-align: right; width:70%;">
                    <asp:Button ID="btnAddNew1" runat="server" CausesValidation="false" Text="Add New" OnClick="btnAddNew_Click"/></td> 
                    <td></td>
                    <td></td>                  
                </tr>
                    <tr>
                       <td >

        <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" OnSorting="gv_sort" EnableSortingAndPagingCallbacks="true" DataSourceID="SqlDataSource1" OnPageIndexChanging="gv_PageIndexChanging" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Height="374px" style="margin-right: 57px; margin-bottom: 47px;" Width="659px">
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" Text="Edit" 

                        CausesValidation="false"
                        OnClick="lnkEdit_Click" 

                        runat="server"></asp:LinkButton>
                     </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:BoundField DataField="EmployeeCode" HeaderText="EmployeeCode" SortExpression="EmployeeCode" />
                <asp:BoundField DataField="FullName" HeaderText="FullName" SortExpression="FullName" />
                <asp:BoundField DataField="isactive" HeaderText="isactive" SortExpression="isactive" />
                <asp:BoundField DataField="companyname" HeaderText="companyname" SortExpression="companyname" />
                <asp:BoundField DataField="branchname" HeaderText="branchname" SortExpression="branchname" />
                <asp:BoundField DataField="ROLE_NAME" HeaderText="ROLE_NAME" SortExpression="ROLE_NAME" />
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
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Enter ID" Display="None"  ControlToValidate="txtid1"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce1" TargetControlID="rfv1" runat="server"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Employee Code</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtec1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Enter Employee Code"  Display="None" ControlToValidate="txtec1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce2" runat="server" TargetControlID="rfv2" ></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><b>Enter Full Name</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtfn1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv3" runat="server"  ErrorMessage="Enter Full Name" Display="None" ControlToValidate="txtfn1" ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server"  ID="vce3" TargetControlID="rfv3" ></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Company Code</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtcc1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv4" runat="server" ErrorMessage="Enter Company Code" Display="None"  ControlToValidate="txtcc1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce4" TargetControlID="rfv4"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><b>Enter Company Name</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtcn1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv5" runat="server" ErrorMessage="Enter Company Name" Display="None"  ControlToValidate="txtcn1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce5" TargetControlID="rfv5"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Branch Name</b></td>
                    <td><b>:</b></td>
                    <td><td><asp:CheckBoxList ID="ddl10" runat="server" SelectionMode="Multiple" DataSourceID="SqlDataSource2" DataTextField="branchname" DataValueField="branchname">
                        </asp:CheckBoxList>
                    </td>
                    </td>
                </tr>

                 <tr>
                    <td><b>Enter Branch ID</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtbi1" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv7" runat="server" ErrorMessage="Enter Branch ID" Display="None"  ControlToValidate="txtbi1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce7" TargetControlID="rfv7"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Reporting Manager</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtr1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv8" runat="server" ErrorMessage="Enter Reporting Manager" Display="None"  ControlToValidate="txtr1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce8" TargetControlID="rfv8"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                
                <tr>
                    <td><b>Enter Reporting Manager Code</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtrc1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv9" runat="server" ErrorMessage="Enter Reporting Manager Code" Display="None"  ControlToValidate="txtrc1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce9" TargetControlID="rfv9"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
               <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter State</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txts1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv10" runat="server" ErrorMessage="Enter State" Display="None"  ControlToValidate="txts1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce10" TargetControlID="rfv10"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>

                <tr>
                    <td><b>Enter Mobile</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtm1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv11" runat="server" ErrorMessage="Enter Mobile" Display="None"  ControlToValidate="txtm1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce11" TargetControlID="rfv11"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Office Email</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtem1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv12" runat="server" ErrorMessage="Enter Office Email" Display="None"  ControlToValidate="txtem1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce12" TargetControlID="rfv12"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>

                <tr>
                    <td><b>Enter RoleID</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtrid1" runat="server" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv13" runat="server" ErrorMessage="Enter Role ID" Display="None"  ControlToValidate="txtrid1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce13" TargetControlID="rfv13"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>

                    <td><b>Enter Role</b></td>
                    <td><b>:</b></td>
                    <td><asp:DropDownList ID="ddl1" runat="server" DataSourceID="SqlDataSource5" DataTextField="ROLE_NAME" DataValueField="ROLE_NAME">
                            </asp:DropDownList>
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
                        <asp:RequiredFieldValidator ID="rfv14" runat="server" ErrorMessage="Enter ID" Display="None"  ControlToValidate="txtid2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce14" TargetControlID="rfv14" runat="server"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                 <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Employee Code</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtec2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv15" runat="server" ErrorMessage="Enter Employee Code"  Display="None" ControlToValidate="txtec2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce15" runat="server" TargetControlID="rfv15" ></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><b>Enter Full Name</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtfn2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv16" runat="server"  ErrorMessage="Enter Full Name" Display="None" ControlToValidate="txtfn2" ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server"  ID="vce16" TargetControlID="rfv16" ></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                 <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Company Code</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtcc2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv17" runat="server" ErrorMessage="Enter Company Code" Display="None"  ControlToValidate="txtcc2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce17" TargetControlID="rfv17"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><b>Enter Company Name</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtcn2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv18" runat="server" ErrorMessage="Enter Company Name" Display="None"  ControlToValidate="txtcn2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce18" TargetControlID="rfv18"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                 <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Branch Name</b></td>
                    <td><b>:</b></td>
                    <td><asp:CheckBoxList ID="ddl11" runat="server" SelectionMode="Multiple" DataSourceID="SqlDataSource2" DataTextField="branchname" DataValueField="branchname">
                        </asp:CheckBoxList>
                    </td>
                </tr>

                 <tr>
                    <td><b>Enter Branch ID</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtbi2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv20" runat="server" ErrorMessage="Enter Branch ID" Display="None"  ControlToValidate="txtbi2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce20" TargetControlID="rfv20"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Reporting Manager</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtr2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv21" runat="server" ErrorMessage="Enter Reporting Manager" Display="None"  ControlToValidate="txtr2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce21" TargetControlID="rfv21"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                
                <tr>
                    <td><b>Enter Reporting Manager Code</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtrc2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv22" runat="server" ErrorMessage="Enter Reporting Manager Code" Display="None"  ControlToValidate="txtrc2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce22" TargetControlID="rfv22"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter State</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txts2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv23" runat="server" ErrorMessage="Enter State" Display="None"  ControlToValidate="txts2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce23" TargetControlID="rfv23"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>

                <tr>
                    <td><b>Enter Mobile</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtm2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv24" runat="server" ErrorMessage="Enter Mobile" Display="None"  ControlToValidate="txtm2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce24" TargetControlID="rfv24"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                <!--
                </tr>
                <tr>
                    -->
                    <td><b>Enter Office Email</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtem2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv25" runat="server" ErrorMessage="Enter Office Email" Display="None"  ControlToValidate="txtem2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce25" TargetControlID="rfv25"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>

                <tr>
                    <td><b>Enter RoleID</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtrid2" runat="server" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv26" runat="server" ErrorMessage="Enter Role ID" Display="None"  ControlToValidate="txtrid2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server" ID="vce26" TargetControlID="rfv26"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>

                    <td><b>Enter Role</b></td>
                    <td><b>:</b></td>
                    <td><asp:DropDownList ID="ddl2" runat="server" DataSourceID="SqlDataSource5" DataTextField="ROLE_NAME" DataValueField="ROLE_NAME">
                            </asp:DropDownList>
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





    </form>

</asp:Content>
