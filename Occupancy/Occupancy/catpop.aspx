<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="catpop.aspx.cs" Inherits="Occupancy.catpop" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h3 class="card-title">Edit/Add Categories</h3>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   

    <form id="form1" runat="server" style="height: 955px; width: 1187px">
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ComplianceEntities4" DefaultContainerName="ComplianceEntities4" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="TBL_MST_CATEGORIES">
        </asp:EntityDataSource>
     
          <asp:ScriptManager ID="tsm" runat="server"></asp:ScriptManager>
    <div>
    <asp:UpdatePanel runat="server" ID="up" UpdateMode="Conditional">
        <ContentTemplate>
            <table style = "width: 100%">
                <tr>
                    <td style="text-align: right; width:70%;">
                    <asp:Button ID="btnAddNew1" runat="server" CausesValidation="false" Text="Add New" OnClick="btnAddNew_Click"/></td> 
                    <td></td>
                    <td></td>                  
                </tr>
                    <tr>
                       <td >

        <asp:GridView ID="gv" runat="server" AllowPaging="True" AllowSorting="True" EnableSortingAndPagingCallbacks="true" OnSorting="gv_sort" OnPageIndexChanging="gv_PageIndexChanging" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="EntityDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
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
        

          </td>
                    </tr>
            </table>
            <!--Panel to add new record-->
  <ajaxToolkit:ModalPopupExtender ID="mpe1" runat="server" TargetControlID="btnAddNew1" PopupControlID="panelAddNew" RepositionMode="RepositionOnWindowResizeAndScroll" DropShadow="true" PopupDragHandleControlID="panelAddNewTitle" BackgroundCssClass="modalBackground"  ></ajaxToolkit:ModalPopupExtender>
  <asp:Panel ID="panelAddNew" runat="server" style="display:none; background-color:gray;" ForeColor="Black" Width="500" Height="300">
            <asp:Panel ID="panelAddNewTitle" runat="server" style="cursor:move;font-family:Tahoma;padding:2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="White" Height="25" ><b>Add New</b></asp:Panel>
            <table style="width:100%; padding:5px;">
                <tr>
                <td colspan="3">
                    <asp:Label ID="lblStatus1" runat="server"></asp:Label>
                </td>
                </tr>
                
                <tr>
                    <td><b>ID</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtid1" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv0" runat="server" ErrorMessage="ID not editable" Display="None"  ControlToValidate="txtid1"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce0" TargetControlID="rfv0" runat="server"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>

                <tr>
                    <td><b>Enter Category ID</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtName1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Enter ID" Display="None"  ControlToValidate="txtName1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce1" TargetControlID="rfv1" runat="server"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><b>Enter Category Name</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtJob1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Enter Name"  Display="None" ControlToValidate="txtJob1"  ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce2" runat="server" TargetControlID="rfv2" ></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><b>Enter Category Details</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtSal1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv3" runat="server"  ErrorMessage="Enter Details" Display="None" ControlToValidate="txtSal1" ValidationGroup="add"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender runat="server"  ID="vce3" TargetControlID="rfv3" ></ajaxToolkit:ValidatorCalloutExtender>
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
  <ajaxToolkit:ModalPopupExtender ID="mpe2" runat="server" TargetControlID="btnDummy1" PopupControlID="panelEdit" RepositionMode="RepositionOnWindowResizeAndScroll" DropShadow="true" PopupDragHandleControlID="panelEditTitle" BackgroundCssClass="modalBackground" ></ajaxToolkit:ModalPopupExtender>
  <asp:Panel ID="panelEdit" runat="server" style="display:none; background-color:gray;" ForeColor="Black" Width="500" Height="300">
            <asp:Panel ID="panelEditTitle" runat="server" style="cursor:move;font-family:Tahoma;padding:2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="White" Height="25" ><b>Edit</b></asp:Panel>
            <table style="width:100%; padding:5px;">
                <tr>
                <td colspan="3">
                    <asp:Label ID="lblStatus2" runat="server"></asp:Label>
                </td>
                </tr>
                <tr>
                    <td><b>ID</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtid2" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv11" runat="server" ErrorMessage="ID not editable" Display="None"  ControlToValidate="txtid2"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce11" TargetControlID="rfv11" runat="server"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><b>Enter Category ID</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtName2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv5" runat="server" ControlToValidate="txtName2" Display="None" ErrorMessage="Enter Category ID"  ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce5" runat="server" TargetControlID="rfv5" ></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><b>Enter Category Name</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtJob2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv6" runat="server"  ControlToValidate="txtJob2" Display="None" ErrorMessage="Enter Category Name" ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce6" runat="server" TargetControlID="rfv6"></ajaxToolkit:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td><b>Enter Category Details</b></td>
                    <td><b>:</b></td>
                    <td><asp:TextBox ID="txtSal2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv7" runat="server" ControlToValidate="txtSal2" Display="None" ErrorMessage="Enter Category Details" ValidationGroup="edit"></asp:RequiredFieldValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="vce7" runat="server" TargetControlID="rfv7" ></ajaxToolkit:ValidatorCalloutExtender>
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


