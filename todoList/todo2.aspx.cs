using System;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;

namespace todoList
{
    public partial class todo2 : System.Web.UI.Page
    {
        OleDbConnection con = new OleDbConnection("Provider=Microsoft.ACE.Oledb.12.0;Data Source=C:\\fatma\\Todo.accdb");
        OleDbCommand cmd = new OleDbCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            btnguncelle.Visible = false;
            tbDegisimTarihi.Visible = false;
            lblDurumDegisim.Visible = false;
            tbTarih.Text = DateTime.Now.ToString();
            tbDegisimTarihi.Text = DateTime.Now.ToString();
            listele();
        }


        private void filtreListele(String durum)
        {

         
            OleDbDataAdapter adp = new OleDbDataAdapter(@"Select id,Tarih,[Not],Onem,Durum,DurumDegisimTarihi from Veri_Tablosu Where Durum=@durum", con);
            adp.SelectCommand.Parameters.AddWithValue("@Durum", durum);
            DataSet ds = new DataSet();

            adp.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();


        }



        private void listele()
        {

            OleDbDataAdapter adp = new OleDbDataAdapter("Select id,Tarih,[Not],Onem,Durum,DurumDegisimTarihi from Veri_Tablosu ", con);
            DataSet ds = new DataSet();
            
            adp.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();// web projelerinde zorunlu


        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {

                if (tbNot.Text == string.Empty && rbOnem.Text == string.Empty)
                {

                    Label1.Text = "* BOŞ BIRAKMAYINIZ !";
                    Label2.Text = "* BOŞ BIRAKMAYINIZ !";

                    /* tbNot.BackColor = Color.PaleVioletRed;
                     rbOnem.BackColor = Color.PaleVioletRed;*/


                }
                
              else  if (tbNot.Text != string.Empty && rbOnem.Text == string.Empty)
                {
                    Label2.Text = "* BOŞ BIRAKMAYINIZ !";
                    Label1.Text = " ";
                }
                else if (tbNot.Text == string.Empty && rbOnem.Text != string.Empty)
                {
                    Label1.Text = "* BOŞ BIRAKMAYINIZ !";
                    Label2.Text = " ";
                }

                else
                        {
                    Label1.Text = "";
                    Label2.Text = "";

                    con.Open();
                    /* string Sqlcumle = "INSERT INTO Veri_Tablosu(Tarih,[Not],Onem,Durum,DurumDegisimTarihi) values ('" + tbTarih.Text + "','" + tbnot.Text + "','" + rbonem.Text + "','" + ddurum.Text + "','" + tbdegisimtarihi.Text + "')";
                     Response.Write(Sqlcumle);*/

                    /*Değişken ataması gerçekleştirildi
                     T karakterine bölen dateParsed dizi atayarak iki ayrı parça haline getirildi.
                     Bu satır, unformattedDate değişkenindeki tarihi "-" karakterine göre böler ve sonucu splittedDate adlı bir diziye atanır
                     Bu metin, gün-ay-yıl formatında olacak şekilde formattedDate adlı bir metin değişkenine atanır. Bu  splittedDate dizisindeki gün, ay ve yıl bilgilerini alır ve düzenlenmiş bir tarih metni oluşturur. Aynı satırda dateParsed[1] ile de saati alarak sonuç tarih ve saat bilgisini içeren bir dize elde eder.*/

                    String newTbTarih = DateTime.Now.ToString();
                    String[] dateParsed = tbDegisimTarihi.Text.Split('T');
                    //String unformattedDate = dateParsed[0];
                    //String[] splittedDate = unformattedDate.Split('-');
                    //String formattedDate = splittedDate[2] + "-" + splittedDate[1] + "-" + splittedDate[0] + " " + dateParsed[1];

                    cmd = new OleDbCommand("INSERT INTO Veri_Tablosu(Tarih,[Not],Onem,Durum) values (?,?,?,?)", con);
                    cmd.Parameters.AddWithValue("@Tarih", newTbTarih);
                    cmd.Parameters.AddWithValue("@Not", tbNot.Text);
                    cmd.Parameters.AddWithValue("@Onem", rbOnem.Text);
                    cmd.Parameters.AddWithValue("@Durum", dlDurum.Text);
                    //cmd.Parameters.AddWithValue("@DurumDegisimTarihi", tbDegisimTarihi);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    listele();
                    tbNot.Text = " ";
                    tbID.Text = " ";
                    dlDurum.ClearSelection();
                    rbOnem.ClearSelection();
                    tbDegisimTarihi.Text = " ";
                }

            }
            catch (Exception ex)
            {
                tbNot.Text = ex.Message;
                Console.WriteLine("Mesaj : " + ex.Message);

            }
            
        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();           
            Response.Write("<script> confirm ('Bilgiler silinsin mi ?') </script>");

            Label id = GridView1.Rows[e.RowIndex].FindControl("id") as Label;

            int silinecekId = Convert.ToInt32(id.Text);

            Response.Write(silinecekId);          
            cmd = new OleDbCommand("DELETE FROM Veri_Tablosu WHERE  id = " + silinecekId, con); 
            cmd.ExecuteNonQuery();
            con.Close();
            listele();
            
            


        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            try { 
            String newTbTarih = DateTime.Now.ToString();
            String[] dateParsed = tbDegisimTarihi.Text.Split('T');
            String unformattedDate = dateParsed[0];
                //String[] splittedDate = unformattedDate.Split('-');
                //String formattedDate = splittedDate[2] + "-" + splittedDate[1] + "-" + splittedDate[0] + " " + dateParsed[1];
             String degisimTarih = DateTime.Now.ToString();
             String[] degisimParsed = tbDegisimTarihi.Text.Split('T');
                con.Open();


                cmd = dlDurum.SelectedIndex == 1 ?  new OleDbCommand(@"UPDATE Veri_Tablosu SET Tarih = @tarih,[Not] = @Not,Onem = @Onem,Durum = @Durum,DurumDegisimTarihi = @DurumDegisimTarihi  WHERE [id] = @ID", con) :
                       new OleDbCommand(@"UPDATE Veri_Tablosu SET Tarih = @tarih,[Not] = @Not,Onem = @Onem,Durum = @Durum  WHERE [id] = @ID", con);
                
                cmd.Parameters.AddWithValue("@Tarih", newTbTarih);
                cmd.Parameters.AddWithValue("@Not", tbNot.Text);
                cmd.Parameters.AddWithValue("@Onem", rbOnem.Text);
                cmd.Parameters.AddWithValue("@Durum", dlDurum.Text);

                if (dlDurum.SelectedIndex == 1) {
                    cmd.Parameters.AddWithValue("@DurumDegisimTarihi", degisimTarih);
                }

                cmd.Parameters.AddWithValue("@ID", tbID.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                listele();
                tbID.Text = " ";
                tbNot.Text = " ";
                dlDurum.ClearSelection();
                rbOnem.ClearSelection();






            }
            catch (Exception ex)
            {
                tbNot.Text = ex.Message;
                Console.WriteLine("Mesaj : " + ex.Message);
                

            }
           
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int secili;
            secili = GridView1.SelectedIndex;
            Label tarih = GridView1.Rows[secili].FindControl("tarih") as Label;
            Label not = GridView1.Rows[secili].FindControl("not") as Label;
            Label onem = GridView1.Rows[secili].FindControl("onem") as Label;
            Label durum = GridView1.Rows[secili].FindControl("durum") as Label;
            Label id = GridView1.Rows[secili].FindControl("id") as Label;
            Label durumdegisimtarihi = GridView1.Rows[secili].FindControl("durumdegisimtarihi") as Label;
            tbTarih.Text = tarih.Text.ToString();
            tbNot.Text = not.Text.ToString();
            rbOnem.Text = onem.Text.ToString();
            dlDurum.Text = durum.Text.ToString();
            tbID.Text = id.Text.ToString();
            tbDegisimTarihi.Text = durumdegisimtarihi.Text.ToString();
            btnguncelle.Visible = true;


        }

        protected void dlDurum_SelectedIndexChanged(object sender, EventArgs e)
        {

            if(dlDurum.SelectedIndex == 1)
            {
                tbDegisimTarihi.Visible = true;
                lblDurumDegisim.Visible = true;
            }

            if(dlDurum.SelectedIndex == 0)
            {
                tbDegisimTarihi.Visible = false;
                lblDurumDegisim.Visible = false;

            }
            btnguncelle.Visible = true;

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (DropDownList1.SelectedIndex) { 
            case 0:
                    listele(); 
                    break;
            case 1:
                    filtreListele("Devam Ediyor");
                    break;
            case 2:
                    filtreListele("Tamamlandı");
                    break;
             
           

            
            }
        }

        protected void btnTemizle_Click(object sender, EventArgs e)
        {
            tbNot.Text = "";
            tbID.Text = " ";
            rbOnem.ClearSelection();
            dlDurum.ClearSelection();
            Label1.Text = "";
            Label2.Text = "";
        }
    }

}
