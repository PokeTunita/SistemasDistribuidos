let expresionfecha = /^(\d{4})(\/|-)(\d{1,2})(\/|-)(\d{1,2})$/;

function iniciars(){
    var nombre = document.iniciar.nombre.value;
    var pass = document.iniciar.pass.value;
    if(nombre == "" || pass == ""){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Todos los Campos son Obligatorios'
        });
    }else{
        document.iniciar.submit();
    }
}

function registrarse(){
    var nombre = document.registrar.nom.value;
    var pass = document.registrar.pass.value;
    var confpass = document.registrar.confpass.value;
    if(pass != confpass){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Las contraseñas no coinciden'
        });
    }else if(nombre == "" || pass == ""){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Todos los Campos son Obligatorios'
        });
    }else{
        document.registrar.submit();
    }
}

function agregartarea(){
    var nombre = document.tarea.nombre.value;
    var fecha = document.tarea.fecha.value;
    if(nombre == "" ||!expresionfecha.test(fecha)){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Todos los Campos son Obligatorios'
        });
    }else{
        document.tarea.submit();
    }
}




