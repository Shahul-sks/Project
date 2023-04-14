using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace practicework.boots
{
    public partial class form : System.Web.UI.Page
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

        void clear()
        {
            name.Text = "";
            emailid.Text = "";
            password.Text = "";
            city.Text = ""; 
        }
        public static SqlConnection getConnection()
        {
            con = new SqlConnection("data source = 192.168.10.18; database =TrainingDB;  user id = TrainingDB_User; password =  'X1;xbhpUN#a5eGHt4ohF'");
            con.Open();
            return con;
        }


        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void register_Click(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into form (name,emailid,password,city,gender) " +
                "values('" + name.Text + "','" + emailid.Text + "','" + password.Text + "','" + city.Text + "','" + gender.Text + "')", con);
                int rows = cmd.ExecuteNonQuery();
                con.Close();
                if (rows > 0)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(),"k",
                    "swal('Good job!', 'You clicked the button!', 'success')",true);

                }
                else
                    Console.WriteLine("Not Inserted..");
            }
           
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        void display()
        {
            con = getConnection();
            con.Close();
            cmd = new SqlCommand(" select * from form ", con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
              GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void update_Click(object sender, EventArgs e)
        {
            display();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            display();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[0].Controls[0]).Text;
            string emailid = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string password = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string city = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            DropDownList gender = GridView1.Rows[e.RowIndex].FindControl("DropDownList2") as DropDownList;

            using (SqlConnection con = new SqlConnection(cs))  
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update form set name='" +name+ "', emailid='" + emailid + "',password='" + password + "',city='" + city + "',gender='" + gender + "' where id ='" + id+"' ", con);
                int row = cmd.ExecuteNonQuery();
                if(row > 0)
                {
                    Response.Write("<script>alert('data Updated'</script>)");
                    GridView1.EditIndex = -1;
                    display();
                }
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            display();
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            con = getConnection();
            con.Open();
            SqlCommand cmd = new SqlCommand("delete  from form where name = @name");
            cmd.Parameters.AddWithValue("name",@name);
            cmd.ExecuteNonQuery();
            con.Close();
            int rows = cmd.ExecuteNonQuery();           
            if (rows > 0)
            {
                Response.Write("<script> alert('delete') </script>");

            }
            else
                Console.WriteLine("Not delete..");

        }

        protected void Search_Click(object sender, EventArgs e)
        {
            con = getConnection();
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from form where name = @name",con);
            cmd.ExecuteNonQuery();
            con.Close();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
        }

        
    }
}