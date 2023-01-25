<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="PracticaDP2.Catalogs.Formulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="btn-container" runat="server">
        <asp:Button runat="server" ID="btnLimpiar" UseSubmitBehavior="False" Style="margin-left: 5px; margin-top: 5px;" CssClass="btn custom-btn btn-primary pull-right" Text="Limpiar" OnClick="btnLimpiar_Click" />
        <asp:Button runat="server" ID="btnGuardar" UseSubmitBehavior="False" Style="margin-left: 5px; margin-top: 5px;" CssClass="btn custom-btn btn-primary pull-right" Text="Guardar" OnClick="btnGuardar_Click" />
        <asp:Button runat="server" ID="btnConsultar" UseSubmitBehavior="False" Style="margin-left: 5px; margin-top: 5px;" CssClass="btn custom-btn btn-primary pull-right" Text="Consultar " OnClick="btnConsultar_Click" />
    </div>

    <section class="custom-content">
        <div class="bs-component">
            <div class="clearfix">
                <div class="row">
                    <div class="col-sm-12 paddingoff">
                        <div class="box custom-box box-primary">
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <label class="control-label-top">ID</label>
                                        <asp:TextBox runat="server" CssClass="form-control marginoff" ID="txtID" Enabled="false" placeholder="ID" MaxLength="50" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label-top">Nombre:</label>
                                        <asp:TextBox runat="server" CssClass="form-control marginoff" ID="txtName" validate="true" placeholder="Nombre" MaxLength="250" onkeypress="return soloLetras(event)" autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="control-label-top">Apellido Paterno:</label>
                                        <asp:TextBox runat="server" CssClass="form-control marginoff" ID="txtFatherLasName" placeholder="Apellido Paterno" MaxLength="250" onkeypress="return soloLetras(event)" autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="control-label-top">Apelllido Materno:</label>
                                        <asp:TextBox runat="server" CssClass="form-control marginoff" ID="txtMotherLastName" placeholder="Apellido Materno" MaxLength="250" onkeypress="return soloLetras(event)" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label class="control-label-top">Calle:</label>
                                        <asp:TextBox runat="server" CssClass="form-control marginoff" ID="txtStreet" placeholder="Calle" MaxLength="250" onkeypress="return soloLetras(event)" autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="control-label-top">Número:</label>
                                        <asp:TextBox runat="server" CssClass="form-control marginoff" ID="txtNumber" placeholder="Numero" MaxLength="18" onkeypress="return soloNumeros(event)" autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-3">
                                        <label class="control-label-top">Colonia:</label>
                                        <asp:TextBox runat="server" CssClass="form-control marginoff" ID="txtNeighborhood" placeholder="Colonia" MaxLength="250" onkeypress="" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <label id="lblMensaje" class="control-label-buttom" runat="server"></label>
                                </div>
                                <div class="box-body" id="divData" style="display: none;" runat="server">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <label class="control-label-top">Nombre:</label>
                                            <asp:Label ID="lblNameFull" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <label class="control-label-top">Calle:</label>
                                            <asp:Label ID="lblStreet" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <label class="control-label-top">Número:</label>
                                            <asp:Label ID="lblNumber" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <label class="control-label-top">Colonia:</label>
                                            <asp:Label ID="lblNeighborhood" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>

        function soloLetras(e) {
            var key = e.keyCode || e.which,
                tecla = String.fromCharCode(key).toLowerCase(),
                letras = " áéíóúabcdefghijklmnñopqrstuvwxyz",
                especiales = [8, 37, 39, 46],
                tecla_especial = false;

            for (var i in especiales) {
                if (key == especiales[i]) {
                    tecla_especial = true;
                    break;
                }
            }

            if (letras.indexOf(tecla) == -1 && !tecla_especial) {
                return false;
            }
        }

        function soloNumeros(e) {
            var key = e.keyCode || e.which,
                tecla = String.fromCharCode(key).toLowerCase(),
                numeros = "1234567890",
                especiales = [8, 37, 39, 46],
                tecla_especial = false;

            for (var i in especiales) {
                if (key == especiales[i]) {
                    tecla_especial = true;
                    break;
                }
            }

            if (numeros.indexOf(tecla) == -1 && !tecla_especial) {
                return false;
            }
        }

    </script>

</asp:Content>
