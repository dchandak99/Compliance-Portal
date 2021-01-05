using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Occupancy
{
    public partial class docpop : System.Web.UI.Page
    {
        SqlConnection cn = null;
        SqlDataAdapter da = null;
        SqlDataReader dr = null;
        SqlCommand cmd = null;
        DataSet ds = null;
        string sqlQry = null;
        //string tempID = null;
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

        protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // gv.PageIndex = e.NewPageIndex;
            Bind_Data(e.NewPageIndex);
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

        void Bind_Data(int newPageIndex = 0)    //Binding Data to GridView
        {
            sqlQry = "select * from tbl_mst_document_types";
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
            //string id = gv.Rows.Count.ToString();
            DataTable t = (DataTable)ViewState["dirState"];
            string id = t.Rows.Count.ToString();

            string cmdString = "SET IDENTITY_INSERT TBL_MST_DOCUMENT_TYPES ON INSERT INTO TBL_MST_DOCUMENT_TYPES(id, document_type_id, document_type_name, document_type_details, isactive) VALUES (@id,@docid,@docname,@docdet, 1)";
            try
            {
                if (cn.State != ConnectionState.Open)
                    cn.Open();
                cmd = new SqlCommand();
                cmd.CommandText = cmdString;
                cmd.Connection = cn;
                //cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@docid", txtName1.Text);
                cmd.Parameters.AddWithValue("@docname", txtJob1.Text);
                cmd.Parameters.AddWithValue("@docdet", txtSal1.Text);
                cmd.Parameters.Add("@id", SqlDbType.Int);
                cmd.Parameters["@id"].Value = int.Parse(id) + 1;
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

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnk = sender as LinkButton;
                GridViewRow gr = (GridViewRow)lnk.NamingContainer;
                string tempID = gv.DataKeys[gr.RowIndex].Value.ToString();
                ViewState["tempId"] = tempID;
                sqlQry = "select id, document_type_id, document_type_name,  document_type_details, isactive from tbl_mst_document_types where id=" + tempID;
                if (cn.State != ConnectionState.Open)
                    cn.Open();
                cmd = new SqlCommand(sqlQry, cn);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtid2.Text = dr["id"].ToString();
                    txtName2.Text = dr["document_type_id"].ToString();
                    txtJob2.Text = dr["document_type_name"].ToString();
                    txtSal2.Text = dr["document_type_details"].ToString();

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
            string cmdString = "UPDATE TBL_MST_DOCUMENT_TYPES SET DOCUMENT_TYPE_ID = @docid, DOCUMENT_TYPE_NAME = @docname, DOCUMENT_TYPE_DETAILS = @docdet Where ID=@id";


            try
            {
                if (cn.State != ConnectionState.Open)
                    cn.Open();
                cmd = new SqlCommand();
                cmd.CommandText = cmdString;
                cmd.Connection = cn;
                //cmd.CommandType = CommandType.StoredProcedure;
                //  cmd.Parameters.AddWithValue("@catid", Convert.ToInt16(ViewState["tempId"].ToString()));
                cmd.Parameters.AddWithValue("@docid", txtName2.Text);
                cmd.Parameters.AddWithValue("@docname", txtJob2.Text);
                cmd.Parameters.AddWithValue("@docdet", txtSal2.Text);
                cmd.Parameters.Add("@id", SqlDbType.Int);
                cmd.Parameters["@id"].Value = int.Parse(txtid2.Text);
                //cmd.Parameters.AddWithValue("@tdeptno", ddlEdit.SelectedValue);
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

    }
}