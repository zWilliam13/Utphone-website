
$(document).ready(function () { 
   //cuando se escriba caracteres en la caja de texto  
    $(document).on('change','#txtnom',function(){ 
        let valor = $(this).val();
            listado(valor);  
    });  
    $('#txtnom').val('').trigger('change');
   function listado(valor) {  
        opc = "7";  
        $.get("control", {opc: opc, consulta:valor}, (response) => {  
            const misDatos = JSON.parse(response);//recuperar la informacion q envio el controlador  
            let template = "";  
             console.log(misDatos);  
           const vec=["","Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Set","Oct","Nov","Dic"];
           template += `  
           <div style="width: 60%; float: left">
             <table style="font-size: 12px">  
                                    <thead>  
                                        <tr>  
                                            <th>Mes</th>
                                                <th># Ventas</th>
                                                <th>Total</th>
                                           </tr>  
                                    </thead>  
                                    <tbody>`;    
            misDatos.forEach(midato => {  
                template += `  
                <tr style="font-size: 12px;">  
                <td>${vec[midato.mes]}</td>  
                    <td>${midato.cantidad}</td>  
                    <td>${midato.total}</td>   
                    </tr>`;              
                  
            })  
            template += `</tbody></table></div>`;  
            $("#tablares").html(template);  
  
        })  
    } //fin de listado 
     
})