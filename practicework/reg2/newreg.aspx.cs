using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;

namespace practicework.reg2
{
    public partial class newreg : System.Web.UI.Page
    {
        private static SqlConnection con;
        private static SqlCommand cmd;
        private static SqlDataReader dr;
        private static SqlDataAdapter da;
        private static DataTable dt;

        string cs = ConfigurationManager.ConnectionStrings["TrainingDBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();

  


            SqlCommand cmd = new SqlCommand("insert into reg2 (id,name,emailid,password,city,gender) " +
            "values('" + id.Text + "','" + name.Text + "','" + emailid.Text + "','" + password.Text + "','" + city.Text + "','" + gender.Text + "')", con);
            int rows = cmd.ExecuteNonQuery();
            if (rows > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k",
                   "swal('One data!', 'Successfully inserted!', 'success')", true);
                display();
                clear();
            }
            else
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k",
                    "swal('Not inserted!', 'Successfully!', 'error')", true);
        }

        void clear()
        {
            id.Text = "";
            name.Text = "";
            emailid.Text = "";
            password.Text = "";
            city.Text = "";
            gender.Text = "";
        }

        void display()
        {
            SqlConnection con = new SqlConnection(cs);
            cmd = new SqlCommand(" select * from reg2 ", con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();         
        }

        protected void reset_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void view_Click(object sender, EventArgs e)
        {
            display();
        }

        protected void GridView1_SelectedIndexChanged(object sender, GridViewUpdateEventArgs e)
        {

            id.Text = GridView1.SelectedRow.Cells[0].Text.ToString();
            name.Text = GridView1.SelectedRow.Cells[1].Text.ToString();
            emailid.Text = GridView1.SelectedRow.Cells[2].Text.ToString();
            password.Text = GridView1.SelectedRow.Cells[3].Text.ToString();
            city.Text = GridView1.SelectedRow.Cells[4].Text.ToString();
            DropDownList gender = GridView1.Rows[e.RowIndex].FindControl("DropDownList2") as DropDownList;
           
        }

        protected void update_Click(object sender, EventArgs e)
        {
     
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE  reg2  SET name='"+name.Text+ "',emailid = @uemail,password= @upassword,city = @ucity,gender = @ugender  where id = @uid", con);
            cmd.Parameters.AddWithValue("@uid", id.Text);
            //cmd.Parameters.AddWithValue("@uname", name.Text);
            cmd.Parameters.AddWithValue("@uemail", emailid.Text);
            cmd.Parameters.AddWithValue("@upassword", password.Text);
            cmd.Parameters.AddWithValue("@ucity", city.Text);
            cmd.Parameters.AddWithValue("@ugender", gender.Text);
            int rows = cmd.ExecuteNonQuery();
            if (rows > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k",
                   "swal('One data!', 'Updated Successfully!', 'success')", true);
                display();
            }
           
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from reg2 where id=@id", con);
            cmd.Parameters.AddWithValue("@id", id.Text);         
            int rows = cmd.ExecuteNonQuery();
            if (rows > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "k",
                  "swal('One data!', 'Deleted Successfully!', 'success')", true);
                display();
                clear();
            }
            else
                Console.WriteLine("Not Deleted..");
        }

        protected void search_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from reg2 where name like @name + '%'", con);
            da = new SqlDataAdapter(cmd);
            da.SelectCommand.Parameters.AddWithValue("@name", search2.Text);          
            dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
                  
        }

       
    }
}