
$(document).ready(function () { 
   //cuando se escriba caracteres en la caja de texto  
    $(document).on('keyup','#txtnom',function(){ 
        let valor = $(this).val();
            listado(valor);  
    });  
    $('#txtnom').val('').trigger('keyup');
   function listado(valor) {  
        opc = "5";  
        $.get("controlEmpleado", {opc: opc, consulta:valor}, (response) => {  
            const misDatos = JSON.parse(response);//recuperar la informacion q envio el controlador  
            let template = "";  
             console.log(misDatos);  
           template += `  
             <table>  
                                    <thead>  
                                        <tr>  
                                            <th>ID Empleado</th>
                                                <th>ID Local</th>
                                                <th>Nombres</th>
                                                <th>Correo</th>
                                                <th>Tipo documento</th>
                                                <th>Número de documento</th>
                                           </tr>  
                                    </thead>  
                                    <tbody>`;    
            misDatos.forEach(midato => {
                let dato="";
                switch (midato.tipo_doc) {
                case 1: dato = "DNI"; break;
                case 2: dato = "Pasaporte"; break;
                    }
                template += `  
                <tr style="font-size: 12px;">  
                <td>${midato.idemp}</td>
                <td>${midato.idlocal}</td>  
                    <td style="width:  100px; font-size: 10px;">${midato.nombres}</td>
                    <td style="width:  100px; font-size: 10px;">${midato.correo}</td> 
               
                    <td>${dato}</td>
               <td>${midato.num_doc}</td>
                    <td>
                        <a href="controlEmpleado?opc=2&nro=${midato.idemp}"><i style="color: #1b1a1a" class="material-symbols-outlined">delete_forever
                                    </i></a>
                        <a href="controlEmpleado?opc=3&nro=${midato.idemp}"><i style="color: #1b1a1a" class="material-symbols-outlined"><i tyle="color: #1b1a1a" class="material-symbols-outlined">edit</i></a>
                    </td>           
                    </tr>`;              
                  
            })  
            template += `</tbody></table>`;  
            $("#tablares").html(template);  
  
        })  
    } //fin de listado 
     
})