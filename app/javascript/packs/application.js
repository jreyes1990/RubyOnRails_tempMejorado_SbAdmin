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
import "datatables/media/js/jquery.dataTables";
import "startbootstrap-sb-admin-2/js/sb-admin-2";
 
document.addEventListener("turbolinks:load", () => {
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
    }
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


    $(document).ready(function() {    
        $('#example').DataTable({        
            language: {
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "zeroRecords": "No se encontraron resultados",
                    "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sSearch": "Buscar:",
                    "oPaginate": {
                        "sFirst": "Primero",
                        "sLast":"Último",
                        "sNext":"Siguiente",
                        "sPrevious": "Anterior"
                    },
                    "sProcessing":"Procesando...",
                },
            //para usar los botones   
            responsive: "true",
            dom: 'Bfrtilp',  
            lengthChange: true,  
            select: true,
            buttons:[ 
                {
                    extend: 'colvis',
                    collectionLayout: 'fixed columns',
                    collectionTitle: 'Column visibility control'
                },
                {
                    text:      '<i class="fas fa-file-excel"></i> ',
                    extend:    'csvHtml5',
                    fieldSeparator: '\t',
                    extension: '.tsv',
                    titleAttr: 'Exportar a CSV',
                    className: 'btn btn-warning'
                },
                {
                    extend:    'excelHtml5',
                    text:      '<i class="fas fa-file-excel"></i> ',
                    titleAttr: 'Exportar a Excel',
                    className: 'btn btn-success',
                    fieldSeparator: '\t',
                    extension: '.xlsx'
                },
                {
                    extend:    'pdfHtml5',
                    text:      '<i class="fas fa-file-pdf"></i> ',
                    titleAttr: 'Exportar a PDF',
                    className: 'btn btn-danger',
                    messageTop: 'PDF created by PDFMake with Buttons for DataTables.',
                    customize: function ( doc ) {
                        doc.content.splice( 1, 0, {
                            margin: [ 0, 0, 0, 12 ],
                            alignment: 'center'
                        } );
                    }
                },
                {
                    extend:    'print',
                    text:      '<i class="fa fa-print"></i> ',
                    titleAttr: 'Imprimir',
                    className: 'btn btn-info',
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    text: 'JSON',
                    action: function ( e, dt, button, config ) {
                        var data = dt.buttons.exportData();
     
                        $.fn.dataTable.fileSave(
                            new Blob( [ JSON.stringify( data ) ] ),
                            'Export.json'
                        );
                    }
                }
            ]      
        });   
        
    });

    /*
    $(document).ready(function() { 
        var tableFiltro = $('#example').DataTable({
            orderCellsTop:  true,
            fixedHeader:    true
        });
    
        //Creamos una fila en el head de la tabla y lo clonamos para cada columna
        $('#example thead tr').clone(true).appendTo('#example thead');
    
        $('#example thead tr:eq(1) th').each(function(i){
            var title = $(this).text(); //Es el nombre de la columna
            $(this).html('<input type="text" placeholder="Search...'+title+'"/>');
    
            $('input', this).on('keyup change',function(){
                if (tableFiltro.column(i).search() !== this.value){
                    tableFiltro
                                .column(i)
                                .search(this.value)
                                .draw();
                }
            });
        });
    });
    */


});