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
    public partial class FrmMain : Form
    {
        public FrmMain()
        {
            InitializeComponent();
            //datagridfill
            /*
             1-AutosizeColumMode -> Fill
            2-BackgroundColor -> Control
            3-ReadOnly -> True
            4-Selection Mode ->Full Row Select
            5-ContextMenuStrip ekleme
            6-Modifiers -> Public
             */
        }

        SqlConnection conn = new SqlConnection("Data Source=109-01;Initial Catalog=Northwind;Integrated Security=True");
        SqlDataAdapter da;
        DataSet ds;
        DataTable dt;
        SqlCommand cmd;
        string main_param,where_param, orderby_param;
        private void btnList_Click(object sender, EventArgs e)
        {
            GridFill("");
        }
        public void GridFill(string param)
        {
            conn.Open();
            string cmdText = "select EmployeeID,concat(FirstName,' ',LastName) [Ad Soyad],Title,TitleOfCourtesy,City,Country from Employees "+param;
            da = new SqlDataAdapter(cmdText, conn);
            ds = new DataSet();
            dt = new DataTable();
            //da.Fill(ds);
            //da.Fill(ds,"Çalısanlar");
            da.Fill(dt);
            //dataGridView1.DataSource = ds.Tables[0];
            //dataGridView1.DataSource = ds.Tables["Çalısanlar"];
            dataGridView1.DataSource = dt;
            conn.Close();
            GridEdit();
        }
        DataGridViewColumn columnId;
        DataGridViewColumn columnFullname;
        DataGridViewColumn columnTitle;
        DataGridViewColumn columnTitleOfCourtesy;
        DataGridViewColumn columnCity;
        DataGridViewColumn columnCountry;
        private void GridEdit()
        {
            columnId = dataGridView1.Columns[0];
            columnFullname = dataGridView1.Columns[1];
            columnTitle = dataGridView1.Columns[2];
            columnTitleOfCourtesy = dataGridView1.Columns[3];
            columnCity = dataGridView1.Columns[4];
            columnCountry = dataGridView1.Columns[5];

            columnId.HeaderText = "ID";
            columnTitle.HeaderText = "Görevi";
            columnTitleOfCourtesy.HeaderText = "Ünvanı";
            columnCity.HeaderText = "Şehir";
            columnCountry.HeaderText = "Ülke";

            columnId.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            columnId.Width = 46;
        }

        private void silToolStripMenuItem_Click(object sender, EventArgs e)
        {
            conn.Open();
            string cmdText = "delete from Employees where EmployeeID = @id";
            cmd = new SqlCommand(cmdText, conn);
            cmd.Parameters.AddWithValue("@id", dataGridView1.CurrentRow.Cells[0].Value.ToString());
            cmd.ExecuteNonQuery();
            conn.Close();
            GridFill("");
        }

        FrmInsert fi;
        public bool isInsert = true;
        private void ekleToolStripMenuItem_Click(object sender, EventArgs e)
        {
            isInsert = true;
            fi = new FrmInsert();
            fi.Show();
            fi.Text = "Çalışan Ekle";
            fi.btnAdd.Text = "Ekle";
            this.Hide();
        }

        private void güncelleToolStripMenuItem_Click(object sender, EventArgs e)
        {
            isInsert = false;
            fi = new FrmInsert();
            fi.Show();
            fi.Text = "Çalışan Güncelle";
            fi.btnAdd.Text = "Güncelle";
            string[] Fullname = dataGridView1.CurrentRow.Cells[1].Value.ToString().Split(' ');
            fi.txtName.Text = Fullname[0];
            fi.txtSurname.Text = Fullname[1];
            fi.txtTitle.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            fi.txtTOC.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            fi.txtCity.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
            fi.txtCountry.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
            this.Hide();
        }

        private void txtName_TextChanged(object sender, EventArgs e)
        {
            where_param = "where FirstName like '%"+txtName.Text+ "%' or LastName like '%" + txtName.Text + "%' ";
            main_param = where_param + orderby_param;
            GridFill(main_param);
        }

        private void cbName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbName.SelectedIndex == 0)
                orderby_param = "order by 2";
            else
                orderby_param = "order by 2 desc";

            main_param = where_param + orderby_param;
            GridFill(main_param);

        }
    }
}
