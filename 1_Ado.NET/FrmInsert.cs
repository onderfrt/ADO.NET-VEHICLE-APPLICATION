using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _1_Ado.NET
{
    public partial class FrmInsert : Form
    {
        public FrmInsert()
        {
            InitializeComponent();
        }
        SqlConnection conn = new SqlConnection("Data Source=109-01;Initial Catalog=Northwind;Integrated Security=True");
        SqlCommand cmd;
        FrmMain fm = (FrmMain)Application.OpenForms["FrmMain"];
        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (fm.isInsert)
                Insert();
            else
                Update();
        }

        public void Insert()
        {
            conn.Open();
            string cmdText = "insert into Employees" +
                "(FirstName, LastName, Title, TitleOfCourtesy, City, Country) " +
                "values(@name, @surname, @title, @TOC, @city, @country)";
            cmd = new SqlCommand(cmdText, conn);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@surname", txtSurname.Text);
            cmd.Parameters.AddWithValue("@title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@TOC", txtTOC.Text);
            cmd.Parameters.AddWithValue("@city", txtCity.Text);
            cmd.Parameters.AddWithValue("@country", txtCountry.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            fm.Show();
            fm.GridFill("");
            this.Close();
        }

        public void Update()
        {
            conn.Open();
            string cmdText = "update Employees " +
                "set FirstName = @name, LastName = @surname, Title = @title,TitleOfCourtesy = @TOC, City = @city, Country = @country " +
                "where EmployeeID = @id";
            cmd = new SqlCommand(cmdText, conn);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@surname", txtSurname.Text);
            cmd.Parameters.AddWithValue("@title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@TOC", txtTOC.Text);
            cmd.Parameters.AddWithValue("@city", txtCity.Text);
            cmd.Parameters.AddWithValue("@country", txtCountry.Text);
            cmd.Parameters.AddWithValue("@id", fm.dataGridView1.CurrentRow.Cells[0].Value.ToString());
            cmd.ExecuteNonQuery();
            conn.Close();
            fm.Show();
            fm.GridFill("");
            this.Close();
        }

        private void FrmInsert_Load(object sender, EventArgs e)
        {

        }
    }
}
