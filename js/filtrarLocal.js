
$(document).ready(function () { 
   //cuando se escriba caracteres en la caja de texto  
    $(document).on('keyup','#txtnom',function(){ 
        let valor = $(this).val();
            listado(valor);  
    });  
    $('#txtnom').val('').trigger('keyup');
   function listado(valor) {  
        opc = "5";  
        $.get("controlLocal", {opc: opc, consulta:valor}, (response) => {  
            const misDatos = JSON.parse(response);//recuperar la informacion q envio el controlador  
            let template = "";  
             console.log(misDatos);  
           template += `  
             <table>  
                                    <thead>  
                                        <tr>  
                                            <th>ID Local</th>
                                                <th>Ciudad</th>
                                                <th>Departamento</th>
                                                <th>Dirección</th>
                                                <th>Teléfono</th>
                                           </tr>  
                                    </thead>  
                                    <tbody>`;    
            misDatos.forEach(midato => {
                template += `  
                <tr style="font-size: 12px;">  
                <td>${midato.id}</td>
                <td>${midato.ciudad}</td>
                <td>${midato.departamento}</td>
                    <td style="width:  100px; font-size: 10px;">${midato.direccion}</td> 
               <td>${midato.telefono}</td>
                    <td>
                        <a href="controlLocal?opc=2&nro=${midato.id}"><i style="color: #1b1a1a" class="material-symbols-outlined">delete_forever
                                    </i></a>
                        <a href="controlLocal?opc=3&nro=${midato.id}"><i style="color: #1b1a1a" class="material-symbols-outlined">edit</i></a>
                    </td>           
                    </tr>`;              
                  
            })  
            template += `</tbody></table>`;  
            $("#tablares").html(template);  
  
        })  
    } //fin de listado 
     
})