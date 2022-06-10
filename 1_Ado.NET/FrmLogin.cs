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
    public partial class FrmLogin : Form
    {
        public FrmLogin()
        {
            InitializeComponent();
        }
        FrmMain fm;
        SqlConnection conn = new SqlConnection("Data Source=317-13;Initial Catalog=Northwind;Integrated Security=True");
        SqlCommand cmd;
        SqlDataReader dr;
        string username, pass;

        private void FrmLogin_Load(object sender, EventArgs e)
        {

        }

        private void txtUsername_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            conn.Open();
            string cmdText = "select Username,Pass from Users ";
            cmd = new SqlCommand(cmdText, conn);
            dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                username = dr["Username"].ToString();
                pass = dr[1].ToString();
            }
            if (txtUsername.Text == username && txtPass.Text == pass)
            {
                fm = new FrmMain();
                fm.Show();
                this.Hide();
            }
            else
                MessageBox.Show("Kullanıcı Adı veya Şifre Hatalı","Hata",MessageBoxButtons.OK,MessageBoxIcon.Error);

            conn.Close();
        }
    }
}
