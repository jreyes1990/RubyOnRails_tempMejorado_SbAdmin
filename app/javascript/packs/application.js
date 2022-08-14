// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "startbootstrap-sb-admin-2/vendor/jquery/jquery";
import "@popperjs/core/dist/umd/popper";
import "startbootstrap-sb-admin-2/vendor/bootstrap/js/bootstrap.bundle";
import "startbootstrap-sb-admin-2/vendor/jquery-easing/jquery.easing";
import "startbootstrap-sb-admin-2/js/sb-admin-2";
import "datatables/media/js/jquery.dataTables";
import "datatables.net-bs4/js/dataTables.bootstrap4";
import "datatables.net-buttons/js/dataTables.buttons";
import "datatables.net-buttons-bs4/js/buttons.bootstrap4";
import "datatables.net-buttons/js/buttons.html5";
import "datatables.net-buttons/js/buttons.print";
import "datatables.net-buttons/js/buttons.colVis";
import "jszip/dist/jszip";
import "pdfmake/build/pdfmake";
import "pdfmake/build/vfs_fonts";

var pdfMake = require('pdfmake/build/pdfmake.js');
var pdfFonts = require('pdfmake/build/vfs_fonts.js');
pdfMake.vfs = pdfFonts.pdfMake.vfs;
 
document.addEventListener("turbolinks:load", () => {
    /* *******************************************************
      * Configuracion para dataTables
      * ******************************************************** */
    var espaniol = {
        "lengthMenu": "Mostrar _MENU_ Entradas",
        "zeroRecords": "No se encontraron resultados",
        "info": "Mostrando _END_ registros, de un total de _TOTAL_ registros",
        "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
        "infoFiltered": "(filtrado de un total de _MAX_ registros)",
        "sSearch": "Buscar:",
        "oPaginate": {
            "sFirst": "Inicio",
            "sLast":"Último",
            "sNext":"Siguiente",
            "sPrevious": "Anterior"
        },
        "sProcessing":"Procesando...",
    }

    var var_dom = "<'row'<'col-sm-3'l><'col-sm-5'B><'col-sm-4'f>>" +
        "<'row'<'col-sm-12'tr>>" +
        "<'row'<'col-sm-4'i><'col-sm-3 text-center'p>>";

    $(document).ajaxSend(function (e, xhr, options){
        var token = $("meta[name='csrf-token']").attr("content");
        xhr.setRequestHeader("X-CSRF-Token", token);
    });

    $('#example').DataTable({
        fixedHeader: true,
        stateSave: true,
        stateDuration: 1200,
        responsive: "true",
        dom: var_dom,
        language: espaniol,
        lengthChange: true,
        select: true,
        order: [0, 'asc'],
        buttons:[
            {
                text:      'CSV <i class="fas fa-file-csv"></i> ',
                extend:    'csvHtml5',
                fieldSeparator: '\t',
                extension: '.csv',
                titleAttr: 'Si desea exportar el archivo, Dar click en CSV',
                className: 'btn btn-warning'
            },
            {
                text:      'Excel <i class="fas fa-file-excel"></i> ',
                extend:     'csvHtml5',
                fieldSeparator: '\t',
                extension: '.xlsx',
                titleAttr: 'Si desea exportar el archivo, Dar click en EXCEL',
                className: 'btn btn-success',
                messageTop: 'La exportación excel, se ha realizado correctamente'
            },
            {
                text:      'PDF <i class="fas fa-file-pdf"></i> ',
                extend:    'pdfHtml5',
                titleAttr: 'Si desea exportar el archivo, Dar click en PDF',
                className: 'btn btn-danger',
                messageTop: 'PDF created by PDFMake with Buttons for DataTables.'
            },
            {
                text:      'Print <i class="fas fa-print"></i> ',
                extend:    'print',
                titleAttr: 'Si desea imprimr, Dar click en PRINT',
                className: 'btn btn-info',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                text: 'JSON',
                titleAttr: 'Si desea exportar el archivo, Dar click en JSON',
                className: 'btn btn-danger',
                action: function ( e, dt, button, config ) {
                    var data = dt.buttons.exportData();

                    $.fn.dataTable.fileSave(
                        new Blob( [ JSON.stringify( data ) ] ),
                        'Export.json'
                    );
                }
            },
        ],
        pagingType: "simple_numbers"
    });

    /* *******************************************************
      * Para controlar el sidebar en posición cerrado o abierto
      * ******************************************************** */
    let sidebarState = sessionStorage.getItem('sidebar');
    $(".sidebar").toggleClass(sidebarState);

    $("#sidebarToggle, #sidebarToggleTop").on('click', function (e) {
        $("body").toggleClass("sidebar-toggled");
        $(".sidebar").toggleClass("toggled");
        if ($(".sidebar").hasClass("toggled")) {
            sessionStorage.setItem('sidebar', 'toggled');
            $('.sidebar .collapse').collapse('hide');
        } else {
            sessionStorage.setItem('sidebar', '');
        };
    });

    // Cierre cualquier acordeón de menú abierto cuando la ventana cambie de tamaño a continuación 768px

    if ($(window).width() < 768) {
        $('.sidebar .collapse').collapse('hide');
    };

    // Cierre cualquier acordeón de menú abierto cuando la ventana cambie de tamaño a continuación 480px
    if ($(window).width() < 480 && !$(".sidebar").hasClass("toggled")) {
        $("body").addClass("sidebar-toggled");
        $(".sidebar").addClass("toggled");
        $('.sidebar .collapse').collapse('hide');
    };

    if (sidebarState === 'toggled') {
        $(".menu_sb").addClass("collapsed");
        $(".opcion_sb").removeClass("show");
    };

    /* *******************************************************
     * Fin para controlar el sidebar en posición cerrado o abierto
     * ******************************************************** */

    // Configuracion de Scroll Top Button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 40) {
            $('#topBtn').fadeIn();
        } else {
            $('#topBtn').fadeOut();
        }

    });

    $("#topBtn").click(function () {
        $('html ,body').animate({
            scrollTop: 0
        }, 800)
    });

    //control de los tiempos de los flash
    setTimeout(function() {
        $(".alert").fadeTo(4000, 500).slideUp(500, function () {
            $(".alert").slideUp(4000);
        });
    });


});