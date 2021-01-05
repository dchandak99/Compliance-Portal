using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Occupancy
{
    public partial class docup : System.Web.UI.Page
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

        }

        //left: add updation of path in database
        protected void Button1_Click(object sender, EventArgs e)
        {   
            //use seletced drop down values to use to insert in database table
            if(ddl1.SelectedIndex == 0 || ddl2.SelectedIndex == 0 || ddl3.SelectedIndex == 0 || ddl4.SelectedIndex == 0 || ddl5.SelectedIndex == 0)
            {
                lblmessage.Text = "Please select all above";
                return;
                //Code for nothing selected
            }
            else  // store ddl values in table
            {   

                //Code for selected item
            }

            if (FileUpload1.HasFile)
            {
                string filenanmme = System.IO.Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("pdfs\\" + filenanmme));
                lblmessage.Text = "File uploaded successfully.";

                string stmt = "SELECT COUNT(*) FROM tbl_mst_repo";
                int count = 0;

             

                string cmdString = "SET IDENTITY_INSERT TBL_MST_REPO ON INSERT INTO TBL_MST_REPO(id, repo_name, document_name, state, doc_type, branch, account, date, path) VALUES (@id, @cat,  @docname, @s, @doctype, @b, @acc, @cdate, @p)";
                try
                {   
                    if (cn.State != ConnectionState.Open)
                        cn.Open();

                    SqlCommand cmdCount = new SqlCommand(stmt, cn);
                    count = (int)cmdCount.ExecuteScalar();

                    cmd = new SqlCommand();
                    cmd.CommandText = cmdString;
                    cmd.Connection = cn;
                    //cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@cat", ddl5.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@s", ddl2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@doctype", ddl4.SelectedItem.Value);
                    string doc_name = filenanmme.Remove(filenanmme.IndexOf('.'));

                    cmd.Parameters.AddWithValue("@docname", doc_name);
                    cmd.Parameters.AddWithValue("@b", ddl3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@acc", ddl1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@p", filenanmme);
                    cmd.Parameters.AddWithValue("@cdate", DateTime.Now);
                    cmd.Parameters.Add("@id", SqlDbType.Int);
                    cmd.Parameters["@id"].Value = count + 1;
                    // cmd.Parameters.AddWithValue("@tdeptno", ddlAdd.SelectedValue);
                    cmd.ExecuteNonQuery();
                    //mpe1.Hide();
                }
                catch
                {
                    lblmessage.Text = "Record is not added";
                    //mpe1.Show();
                }
                finally
                {
                   // Bind_Data();
                    cmd.Dispose();
                    cn.Close();
                }
            }
            else
            {
                lblmessage.Text = "Please select file.";
            }
        }
    }
}