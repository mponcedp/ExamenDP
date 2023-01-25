using PracticaDP2.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticaDP2.Catalogs
{
    public partial class Formulario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtID.Text = "";
            txtName.Text = "";
            txtFatherLasName.Text = "";
            txtMotherLastName.Text = "";
            txtStreet.Text = "";
            txtNumber.Text = "";
            txtNeighborhood.Text = "";
            lblMensaje.InnerText = "";
            lblNameFull.Text = "";
            lblNeighborhood.Text = "";
            lblNumber.Text = "";
            lblStreet.Text = "";
            divData.Style.Remove("display");
            divData.Style.Add("display", "none");
            txtID.Enabled = false;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Distributor distribuitor = new Distributor();

            if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtFatherLasName.Text) || string.IsNullOrEmpty(txtMotherLastName.Text) ||
                string.IsNullOrEmpty(txtStreet.Text) || string.IsNullOrEmpty(txtNumber.Text) || string.IsNullOrEmpty(txtNeighborhood.Text))
            {
                lblMensaje.InnerText = "Es necesario capturar todos los datos del formulario.";
                return;
            }

            distribuitor.id = txtID.Text;
            distribuitor.Name = txtName.Text;
            distribuitor.FatherLastName = txtFatherLasName.Text;
            distribuitor.MotherLasName = txtMotherLastName.Text;
            distribuitor.Street = txtStreet.Text;
            distribuitor.Number = Convert.ToInt32(txtNumber.Text);
            distribuitor.Neighborhood = txtNeighborhood.Text;

            DistributorService Disservice = new DistributorService();

            if (Disservice.addDistributor(distribuitor))
            {
                lblMensaje.InnerText = "Distribuidor agregado con exito.";
                txtID.Text = "";
                txtName.Text = "";
                txtFatherLasName.Text = "";
                txtMotherLastName.Text = "";
                txtStreet.Text = "";
                txtNumber.Text = "";
                txtNeighborhood.Text = "";
            }
                
            else
                lblMensaje.InnerText = Disservice.error;
            
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            lblMensaje.InnerText = "";

            if (!string.IsNullOrEmpty(txtID.Text))
            {
                DistributorService Disservice = new DistributorService();

                Distributor dis = Disservice.getDistributor(txtID.Text);

                if (!string.IsNullOrEmpty(dis.id))
                {
                    txtID.Enabled = false;
                    divData.Style.Add("display", "block");
                    lblNameFull.Text = dis.NameFull;
                    lblNeighborhood.Text = dis.Neighborhood;
                    lblNumber.Text = dis.Number.ToString();
                    lblStreet.Text = dis.Street;
                }
                else
                {
                    lblMensaje.InnerText = "ID de distribuidor no encontrado.";
                }


            }
            else
            {
                txtID.Enabled = true;
            }            
        }
    }
}