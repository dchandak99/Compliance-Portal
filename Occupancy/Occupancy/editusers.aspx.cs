using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

namespace Occupancy
{
    public partial class editusers : System.Web.UI.Page
    {
        SqlConnection cn = null;
        SqlDataAdapter da = null;
        SqlDataReader dr = null;
        SqlCommand cmd = null;
        DataSet ds = null;
        string sqlQry = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection();
            cn.ConnectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Compliance;Integrated Security=True";
            //cn.ConnectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            if (!Page.IsPostBack)
            {
                Bind_Data();
                // Bind_Data_Ddl(ddlAdd);
                // Bind_Data_Ddl(ddlEdit);
            }
        }

        protected void gv_sort(object sender, GridViewSortEventArgs e)
        {
            // gv.PageIndex = e.NewPageIndex;
            DataTable dtrslt = (DataTable)ViewState["dirState"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr"] = "Asc";
                }
                gv.DataSource = dtrslt;
                gv.DataBind();
            }
        }

        protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           // gv.PageIndex = e.NewPageIndex;
            Bind_Data(e.NewPageIndex);
        }


        void Bind_Data(int newPageIndex = 0)    //Binding Data to GridView
        {
            sqlQry = "select ID, employeecode, fullname, isactive, companyname, branchname, role_name from tbl_em_employeedetails";
            da = new SqlDataAdapter(sqlQry, cn);
            //ds = new DataSet();
            DataTable table = new DataTable();
            da.Fill(table);
            gv.DataSourceID = "";
            gv.DataSource = table;
            gv.PageIndex = newPageIndex;
            
            //gv.EnableSortingAndPagingCallbacks = false;
            //gv.DataMember = "emp";
            gv.DataBind();
            up.Update();
            ViewState["dirState"] = table;
            ViewState["sortdr"] = "Asc";
        }

        void End_Block(Panel p)    //Clearing TextBoxes and DropdownLists
        {
            foreach (dynamic txtBox in p.Controls)
            {

                if (txtBox is TextBox)
                    txtBox.Text = String.Empty;

            }
            //ddlEdit.ClearSelection();
            //ddlAdd.ClearSelection();
            mpe1.Hide();
            mpe2.Hide();
            //mpe3.Hide();

        }
        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            //txtid1.Text = gv.Rows.Count.ToString();
            string cmdString = "SET IDENTITY_INSERT TBL_em_employeedetails ON INSERT INTO TBL_em_employeedetails(id, employeecode, fullname, isactive, companycode, companyname, branchname, branchid, reptmgr1, reportingmanager1code, state, mobile, officeemail, roleid) VALUES (@id, @ec, @fn, 1, @cc, @cn, @bn, @bi, @r, @rc, @s, @m, @em, @rid)";
            //string id = gv.Rows.Count.ToString();
            DataTable t = (DataTable)ViewState["dirState"];
            string id = t.Rows.Count.ToString();

            try
            {
                if (cn.State != ConnectionState.Open)
                    cn.Open();
                cmd = new SqlCommand();
                cmd.CommandText = cmdString;
                cmd.Connection = cn;
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@id", txtid1.Text);
                cmd.Parameters.Add("@id", SqlDbType.Int);
                cmd.Parameters["@id"].Value = int.Parse(id) + 1;
                cmd.Parameters.AddWithValue("@ec", txtec1.Text);
                cmd.Parameters.AddWithValue("@fn", txtfn1.Text);
                cmd.Parameters.AddWithValue("@cc", txtcc1.Text);
                cmd.Parameters.AddWithValue("@cn", txtcn1.Text);
                // cmd.Parameters.AddWithValue("@bn", txtbn1.Text);
                cmd.Parameters.AddWithValue("@bn", GetValueCheckBoxList(ddl10));

                cmd.Parameters.AddWithValue("@bi", txtbi1.Text);
                cmd.Parameters.AddWithValue("@r", txtr1.Text);
                cmd.Parameters.AddWithValue("@rc", txtrc1.Text);
                cmd.Parameters.AddWithValue("@s", txts1.Text);
                cmd.Parameters.AddWithValue("@m", txtm1.Text);
                cmd.Parameters.AddWithValue("@em", txtem1.Text);
                //cmd.Parameters.AddWithValue("@rid", txtrid1.Text);
                cmd.Parameters.Add("@rid", SqlDbType.Int);
                cmd.Parameters["@rid"].Value = ddl1.SelectedIndex + 1;
                // cmd.Parameters.AddWithValue("@tdeptno", ddlAdd.SelectedValue);
                cmd.ExecuteNonQuery();
                mpe1.Hide();
            }
            catch
            {
                lblStatus1.Text = "Record is not added";
                mpe1.Show();
            }
            finally
            {
                Bind_Data();
                cmd.Dispose();
                cn.Close();
            }
        }

        protected void Cancel1_Click(object sender, EventArgs e)
        {
            End_Block(panelAddNew);
        }

        public void SetValueCheckBoxList(CheckBoxList cbl, string sValues)
        {
            if (!string.IsNullOrEmpty(sValues))
            {
                ArrayList values = StringToArrayList(sValues);
                foreach (ListItem li in cbl.Items)
                {
                    if (values.Contains(li.Value))
                        li.Selected = true;
                    else
                        li.Selected = false;
                }
            }
        }

        public string GetValueCheckBoxList(CheckBoxList cbl)
        {
            string s = null;
            
            foreach (ListItem li in cbl.Items)
            {
                if (li.Selected)
                    s = s + li.Text + ",";
            }
            s = s.Remove(s.Length - 1, 1);
            return s;
            
        }

        private ArrayList StringToArrayList(string value)
        {
            ArrayList _al = new ArrayList();
            string[] _s = value.Split(new char[] { ',' });

            foreach (string item in _s)
                _al.Add(item);

            return _al;
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnk = sender as LinkButton;
                GridViewRow gr = (GridViewRow)lnk.NamingContainer;
                string tempID = gv.DataKeys[gr.RowIndex].Value.ToString();
                ViewState["tempId"] = tempID;
                sqlQry = "select id, employeecode, fullname, isactive, companycode, companyname, branchname, branchid, reptmgr1, reportingmanager1code, state, mobile, officeemail, roleid from tbl_em_employeedetails where id=" + tempID;
                if (cn.State != ConnectionState.Open)
                    cn.Open();
                cmd = new SqlCommand(sqlQry, cn);
                

                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtid2.Text = dr["id"].ToString();
                    txtec2.Text = dr["employeecode"].ToString();
                    txtfn2.Text = dr["fullname"].ToString();
                    txtcc2.Text = dr["companycode"].ToString();
                    txtcn2.Text = dr["companyname"].ToString();
                    //txtbn2.Text = dr["branchname"].ToString();
                    SetValueCheckBoxList(ddl11, dr["branchname"].ToString());

                    txtbi2.Text = dr["branchid"].ToString();
                    txtr2.Text = dr["reptmgr1"].ToString();
                    txtrc2.Text = dr["reportingmanager1code"].ToString();
                    txts2.Text = dr["state"].ToString();
                    txtm2.Text = dr["mobile"].ToString();
                    txtem2.Text = dr["officeemail"].ToString();
                    txtrid2.Text = dr["roleid"].ToString();
                    if (dr["roleid"].ToString() != "")
                    { 
                        ddl2.SelectedIndex = int.Parse(dr["roleid"].ToString()) - 1;
                    }
                }
                mpe2.Show();
            }
            catch
            {
                return;
            }
            finally
            {
                cmd.Dispose();
                dr.Close();
                cn.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //string cmdString = "INSERT INTO TBL_MST_CATEGORIES VALUES (@catid,@catname,@catdet)";
            string cmdString = "UPDATE TBL_EM_EMPLOYEEDETAILS SET employeecode=@ec, fullname=@fn, isactive=1, companycode=@cc, companyname=@cn, branchname=@bn, branchid=@bi, reptmgr1=@r, reportingmanager1code=@rc, state=@s, mobile=@m, officeemail=@em, roleid=@rid, role_name=@rnn Where ID = @id";


            try
            {
                if (cn.State != ConnectionState.Open)
                    cn.Open();
                cmd = new SqlCommand();
                cmd.CommandText = cmdString;
                cmd.Connection = cn;
                //cmd.CommandType = CommandType.StoredProcedure;
                //  cmd.Parameters.AddWithValue("@catid", Convert.ToInt16(ViewState["tempId"].ToString()));
                //cmd.Parameters.AddWithValue("@id", txtid2.Text);
                cmd.Parameters.Add("@id", SqlDbType.Int);
                cmd.Parameters["@id"].Value = int.Parse(txtid2.Text);
                cmd.Parameters.AddWithValue("@ec", txtec2.Text);
                cmd.Parameters.AddWithValue("@fn", txtfn2.Text);
                cmd.Parameters.AddWithValue("@cc", txtcc2.Text);
                cmd.Parameters.AddWithValue("@cn", txtcn2.Text);
                //cmd.Parameters.AddWithValue("@bn", txtbn2.Text);
                cmd.Parameters.AddWithValue("@bn", GetValueCheckBoxList(ddl11));
                cmd.Parameters.AddWithValue("@bi", txtbi2.Text);
                cmd.Parameters.AddWithValue("@r", txtr2.Text);
                cmd.Parameters.AddWithValue("@rc", txtrc2.Text);
                cmd.Parameters.AddWithValue("@s", txts2.Text);
                cmd.Parameters.AddWithValue("@m", txtm2.Text);
                cmd.Parameters.AddWithValue("@em", txtem2.Text);
                //cmd.Parameters.AddWithValue("@rid", txtrid2.Text);
                cmd.Parameters.Add("@rid", SqlDbType.Int);
                cmd.Parameters["@rid"].Value = ddl2.SelectedIndex + 1;
                //cmd.Parameters.AddWithValue("@tdeptno", ddlEdit.SelectedValue);
                cmd.Parameters.AddWithValue("@rnn", ddl2.SelectedValue);
                cmd.ExecuteNonQuery();
                // panelEdit.Update();
                mpe2.Hide();
            }
            catch
            {
                lblStatus1.Text = "Record is not updated";
                mpe2.Show();
            }
            finally
            {
                Bind_Data();
                cmd.Dispose();
                cn.Close();
            }

        }
        protected void Cancel2_Click(object sender, EventArgs e)
        {
            End_Block(panelEdit);
        }

        protected void ddl_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            //Do your processing logic

           /* sqlQry = "select * from tbl_mst_repo where (repo_name=@rep or @rep2=0) and (state=@s or @s2=0)  and (account=@acc or @acc2=0)  and (branch=@b or @b2=0)  and (doc_type=@d or @d2=0)";
            cmd = new SqlCommand(sqlQry, cn);

            cmd.Parameters.Add("@s", SqlDbType.VarChar);
            cmd.Parameters["@s"].Value = ddl2.SelectedItem.Value;
            cmd.Parameters.Add("@rep", SqlDbType.VarChar);
            cmd.Parameters["@rep"].Value = ddl5.SelectedItem.Value;
            cmd.Parameters.Add("@rep2", SqlDbType.Int);
            cmd.Parameters["@rep2"].Value = ddl5.SelectedIndex;
            cmd.Parameters.Add("@s2", SqlDbType.Int);
            cmd.Parameters["@s2"].Value = ddl2.SelectedIndex;
            cmd.Parameters.Add("@acc", SqlDbType.VarChar);
            cmd.Parameters["@acc"].Value = ddl1.SelectedItem.Value;
            cmd.Parameters.Add("@acc2", SqlDbType.Int);
            cmd.Parameters["@acc2"].Value = ddl1.SelectedIndex;
            cmd.Parameters.Add("@b", SqlDbType.VarChar);
            cmd.Parameters["@b"].Value = ddl3.SelectedItem.Value;
            cmd.Parameters.Add("@b2", SqlDbType.Int);
            cmd.Parameters["@b2"].Value = ddl3.SelectedIndex;
            cmd.Parameters.Add("@d", SqlDbType.VarChar);
            cmd.Parameters["@d"].Value = ddl4.SelectedItem.Value;
            cmd.Parameters.Add("@d2", SqlDbType.Int);
            cmd.Parameters["@d2"].Value = ddl4.SelectedIndex;
            //ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            da.Fill(table);
            gv.DataSourceID = "";
            gv.DataSource = table;
            gv.PageIndex = 0;

            //gv.EnableSortingAndPagingCallbacks = false;
            //gv.DataMember = "emp";
            gv.DataBind();
            //up.Update();
            //ViewState["dirState"] = table;
            ViewState["sortdr"] = "Asc";*/
        }
    }
}