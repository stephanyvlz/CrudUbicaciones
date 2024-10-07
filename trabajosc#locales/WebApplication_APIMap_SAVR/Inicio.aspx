<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="WebApplication_APIMap_SAVR.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Google Map Picker</title>
    <!--Bootstrap y JQuery-->
     <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <!--Complementos del plugin-->
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyDlv2PNwLztXH4VUYD9J9jW5vuv-T6YzRs'></script>
    <script src="Js/locationpicker.jquery.js"></script>
    <!--
        API google maps caducada :c     AIzaSyBg8g8zcX5yG2KCtULlw-4eQ-lXd-WEBeI
        API google maps de copito :D    AIzaSyDlv2PNwLztXH4VUYD9J9jW5vuv-T6YzRs
    ---->
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!--Crear el boton-->
            <button type="button" data-toggle="modal" data-target="#ModalMap" class="btn btn-default">
            <span class="glyphicon glyphicon-map-marker">
            <span id="ubicacion">Seleccionar ubicación</span>
            </span>
            </button>
            <!--Proveniente del js-->
            <style>
                .pac-container {
                    z-index:99999;
                }
            </style>
            <!--Creación del modal-->
            <div class="modal fade" id="ModalMap" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body"></div>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Ubicación</label>
                                <div class="col-sm-7">
                                    <asp:TextBox ID="ModalMapaddress" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <!--boton para cerrar el modal-->
                                <div class="col-sm-1">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </div>
                            <div id="ModalMapPreview" style="width:100%; height:400px;"></div>
                            <div class="clearfix">&nbsp;</div>
                            <div class="m-t-small">
                                <label class="p-r-small col-sm-1 control-label">Latitud: </label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="ModalMapLat" CssClass="formControl" runat="server"></asp:TextBox>
                                </div>
                                <label class="p-r-small col-sm-1 control-label">Longitud: </label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="ModalMapLong" CssClass="formControl" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <button type="button" class="btn btn-primary btn-block" data-dismiss="modal"></button>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <!--Uso de Script para agregar mapa al modal-->
                            <script>
                                $('#ModalMapPreview').locationpicker({
                                    radius: 0,
                                    location: {
                                        latitude: 27.365938954017043,
                                        longitude: -109.93136356074504
                                    },
                                    enableAutocomplete: true,
                                    inputBinding: {
                                        latitudeInput: $('#<%=ModalMapLat.ClientID%>'),
                                        longitudeInput: $('#<%=ModalMapLong.ClientID%>'),
                                        locationNameInput: $('#<%=ModalMapaddress.ClientID%>')
                                    },
                                    onchanged: function (currentLocation, radius, isMarkerDropped) {
                                        $('#ubicacion').html($('#<%=ModalMapaddress.ClientID%>').val());
                                    }
                                });
                                
                                $('ModalMap').on('show.bs.modal', function () {
                                    $('#ModalMapPreview').locationpicker('autosize');                                    
                                });

                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
