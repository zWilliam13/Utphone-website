
$(document).ready(function () { 
   //cuando se escriba caracteres en la caja de texto  
    $(document).on('keyup','#txtnom',function(){ 
        let valor = $(this).val();
            listado(valor);  
    });  
    $('#txtnom').val('').trigger('keyup');
   function listado(valor) {  
        opc = "5";  
        $.get("controlAdmin", {opc: opc, consulta:valor}, (response) => {  
            const misDatos = JSON.parse(response);//recuperar la informacion q envio el controlador  
            let template = "";  
             console.log(misDatos);  
             
           template += `  
             <table>  
                                    <thead>  
                                        <tr>  
                                            <th>ID Usuario</th>
                                                <th>Nombre</th>
                                                <th>Correo</th>
                                                <th>Teléfono</th>
                                           </tr>  
                                    </thead>  
                                    <tbody>`;    
            misDatos.forEach(midato => {  
                template += `  
                <tr style="font-size: 12px;">  
                <td>${midato.id}</td>  
                    <td>${midato.nombre}</td>  
                    <td style="width:  100px; font-size: 10px;">${midato.correo}</td> 
                    <td>${midato.telefono}</td>
                    <td>
                        <a href="controlAdmin?opc=2&nro=${midato.id}"><i style="color: #1b1a1a" class="material-symbols-outlined">delete_forever
                                    </i></a>
                        <a href="controlAdmin?opc=3&nro=${midato.id}"><i style="color: #1b1a1a" class="material-symbols-outlined"><i tyle="color: #1b1a1a" class="material-symbols-outlined">edit</i></a>
                    </td>           
                    </tr>`;              
                  
            })  
            template += `</tbody></table>`;  
            $("#tablares").html(template);  
  
        })  
    } //fin de listado 
     
})