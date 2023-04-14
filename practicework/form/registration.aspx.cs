using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practicework.form
{
    public partial class registration : System.Web.UI.Page
    {
        private static SqlConnection con;
        private static SqlCommand cmd;
        private static SqlDataReader dr;
        private static SqlDataAdapter da;
        private static DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        public static SqlConnection getConnection()
        {
            con = new SqlConnection("data source = 192.168.10.18; database =TrainingDB;  user id = TrainingDB_User; password =  'X1;xbhpUN#a5eGHt4ohF'");
            con.Open();
            return con;
        }

       


        protected void save_Click(object sender, EventArgs e)
        {
            con = getConnection();
            cmd = new SqlCommand("insert into registration (firstname,lastname,age,employeeid,city) " +
                "values('" + firstname.Text + "','" + lastname.Text + "','" + age.Text + "','" + employeeid.Text + "','" + city.Text + "')", con);
           
            int rows = cmd.ExecuteNonQuery();
            con.Close();
           
            if (rows > 0)
            {
                Response.Write("<script> alert('Save') </script>");
            }
            else
                Console.WriteLine("Not Inserted..");
     
        }


        protected void view_Click(object sender, EventArgs e)
        {
            display();
        }
        void display()
        {
            con = getConnection();
            con.Close();
            cmd = new SqlCommand(" select * from registration ", con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            data.DataSource = dt;
            data.DataBind();
            
        }


        //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        //{
           

        //}
    }
}