using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Configuration;
using System.IO;


namespace Occupancy
{
    public partial class repo : System.Web.UI.Page
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
            
            //RegisterPostBackControls();
            //cn.ConnectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            if (!Page.IsPostBack)
            {
                Bind_Data();
                //RegisterPostBackControls();
                // ddl_OnSelectedIndexChanged(sender, e);
                // Bind_Data_Ddl(ddlAdd);
                // Bind_Data_Ddl(ddlEdit);
            }
        }

        protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {   
            //LinkButton lb = e.Row.FindControl("View") as LinkButton;
            //ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(lb);
            return;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // find link button first
                LinkButton btn = e.Row.FindControl("View") as LinkButton;

                // use postback trigger assignment
                ScriptManager.GetCurrent(this.Parent.Page).RegisterAsyncPostBackControl(btn);
            }
        }
        private void RegisterPostBackControls()
        {
           
            foreach (GridViewRow row in gv.Rows)
            {   
                LinkButton button = row.FindControl("View") as LinkButton;
                ScriptManager.GetCurrent(this).RegisterPostBackControl(button);
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

        protected void ddl_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            //Do your processing logic

            sqlQry = "select * from tbl_mst_repo where (repo_name=@rep or @rep2=0) and (state=@s or @s2=0)  and (account=@acc or @acc2=0)  and (branch=@b or @b2=0)  and (doc_type=@d or @d2=0)";
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
            ViewState["sortdr"] = "Asc";
        }

        void Bind_Data(int newPageIndex = 0)    //Binding Data to GridView
        {

            sqlQry = "select * from tbl_mst_repo";
            //sqlQry = "select * from tbl_mst_govt_cases where account=@acc";

            //cmd = new SqlCommand(sqlQry, cn);

            //cmd.Parameters.Add("@acc", SqlDbType.VarChar);
            //cmd.Parameters["@acc"].Value = ddl.SelectedItem.Value;
            //ds = new DataSet();
            //da = new SqlDataAdapter(cmd);
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
            //up.Update();
            ViewState["dirState"] = table;
            ViewState["sortdr"] = "Asc";


        }

        protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {   
            if(e.CommandName == "Sort")
                return;

            int fileId = Convert.ToInt32(e.CommandArgument);
            DataTable Database = (DataTable)ViewState["dirState"];

            //string folderPath = "C:\\Users\\Devansh\\Documents\\Occupancy_updated\\Occupancy\\Occupancy\\pdfs\\";

            string fileName = (from row in Database.AsEnumerable()
                               where row.Field<int>("ID") == fileId
                               select row.Field<string>("PATH")).ToArray().FirstOrDefault();

            if (fileName != null)
            {
                //string pdfPath = folderPath + fileName;// + ".pdf";
                string pdfPath = Server.MapPath("pdfs\\" + fileName);

                StreamReader streamReader = new StreamReader(pdfPath);

                Stream stream = streamReader.BaseStream;

                BinaryReader binaryReader = new BinaryReader(stream);

                byte[] sendbyteArray = binaryReader.ReadBytes(Convert.ToInt32(binaryReader.BaseStream.Length));

                //string pdfPath = Server.MapPath("pdfs\\" + fileName);
                WebClient User = new WebClient();
                Byte[] FileBuffer = User.DownloadData(pdfPath);
                if (FileBuffer != null)
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-length", FileBuffer.Length.ToString());
                    Response.BinaryWrite(FileBuffer);
                }
                return;

                if (e.CommandName.Equals("View"))
                {
                    //Response.Redirect(pdfPath);
                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("Content-Type", "application/pdf");
                    Response.AddHeader("Content-Disposition", "inline");
                    //Response.AddHeader("content-length", sendbyteArray.Length.ToString());
                    Response.BinaryWrite(sendbyteArray);
                    //Response.OutputStream.Write(sendbyteArray, 0, sendbyteArray.Length);
                    //Response.End();
                   
                    try
                    {
                        Response.End();
                        //Response.Flush();
                        //Response.Close();
                    }
                    catch
                    {

                    }

                }

               /* if (e.CommandName.Equals("Download"))
                {
                    Response.ContentType = "application/pdf";
                    Response.AppendHeader("Content-Disposition", "attachment; filename=MyFile.pdf");

                    Response.BinaryWrite(sendbyteArray);
                    Response.End();
                }*/

            }

        }
    }
}