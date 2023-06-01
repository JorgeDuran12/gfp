<?= $this->extend("layouts/authLayout")?>

<?= $this->section("contenido")?>

<div class="rg_container">


    <form id="formulario" class="form_container" action="<?=base_url('Registrar');?>" method="POST">

        <div class="logo_container">
            <img src="<?= base_url("../img/gfp.png");?>" alt="logo_gfp">
        </div>


        <div class="title_container">
            <p class="title"> <?= $tituloPagina?> </p>
            <span class="subtitle"> <strong>Fortalece tu bolsillo, controla tu futuro:
                    Gestiona tus finanzas hoy</strong> </span>
        </div>
        <!-- <-----------------------valifacion de login super bonito------------------------------->

        <div class="formulario__grupo" id="grupo__nombre">
            <label for="nombre" class="formulario__label">Nombre</label>
            <div class="formulario__grupo-input">
                <input type="text" class="formulario__input" name="nombre" id="nombre" placeholder="santiago" required>

                <svg xmlns="http://www.w3.org/2000/svg" class="formulario__validacion-estado" width="16" height="16"
                    fill="currentColor" class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                        d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
                </svg>

            </div>
            <p class="formulario__input-error">El nombre no debe llevar numeros ni simbolos</p>
        </div>
        <!-- cuerpo  de formulario apellido -->
        <div class="formulario__grupo" id="grupo__apellido">
            <label for="apellido" class="formulario__label">Apellido</label>
            <div class="formulario__grupo-input">
                <input type="text" class="formulario__input" name="apellido" id="apellido" placeholder="guerrero"
                    required>

                <svg xmlns="http://www.w3.org/2000/svg" class="formulario__validacion-estado" width="16" height="16"
                    fill="currentColor" class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                        d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
                </svg>

            </div>
            <p class="formulario__input-error">El apellido no debe llevar numeros ni simbolos</p>
        </div>
        <!-- cuerpo  de formulario usuario -->
        <div class="formulario__grupo " id="grupo__usuario">
            <label for="usuario" class="formulario__label">Usuario</label>
            <div class="formulario__grupo-input">
                <input type="text" class="formulario__input" name="usuario" id="usuario" placeholder="santo" required>

                <svg xmlns="http://www.w3.org/2000/svg" class="formulario__validacion-estado" width="16" height="16"
                    fill="currentColor" class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                        d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
                </svg>

            </div>
            <p class="formulario__input-error">El usuario tiene que ser de 4 a 16 digitos y solo puede contener numeros,
                letras y guion bajo </p>
        </div>


        <!-- cuerpo  de formulario email -->
        <div class="formulario__grupo" id="grupo__email">
            <label for="email" class="formulario__label" title="digite un correo electronico valido ">Correo Electronico
            </label>
            <div class="formulario__grupo-input">
                <input type="email" class="formulario__input" name="email" id="email"
                    placeholder="ejemplocorreo@gmail.com" required>

                <svg xmlns="http://www.w3.org/2000/svg" class="formulario__validacion-estado" width="16" height="16"
                    fill="currentColor" class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                        d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
                </svg>

            </div>
            <p class="formulario__input-error">El correo solo debe contener letras, numeros, guiones y gion bajo</p>
            <p class="formulario__input-error_email">este correo ya esta asociado ha otra cuenta </p>
        </div>
        
        <!-- <---------------cuerpo de tipo de documento------------->
        <div class="formulario__grupo" id="grupo__tipo_documento">
            <label for="email" class="formulario__label">Tipo de documento</label>
            <div class="formulario__grupo-input">
                <select class="formulario__input" name="tipo_documento" id="tipo_documento"
                aria-label="Default select example" required>
                <?php foreach ($parametros as $data) {?>
                    <option value="<?php echo $data["id_parametro_det"]; ?>"><?php echo $data["nombre"];?></option>
                    <?php } ?>
                </select>
                

                <svg xmlns="http://www.w3.org/2000/svg" class="formulario__validacion-estado" width="16" height="16"
                fill="currentColor" class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                        d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
                    </svg>
            </div>
            <p class="formulario__input-error">El telefono solo puede contener numeros y el maximo es 14</p>
        </div>
        

        <!-- cuerpo de  num documento -->
        <div class="formulario__grupo" id="grupo__documento">
            <label for="email" class="formulario__label">Numero de documento</label>
            <div class="formulario__grupo-input">
                <input type="number" class="formulario__input" name="documento" id="documento" placeholder="10021023659"
                required>
                
                <svg xmlns="http://www.w3.org/2000/svg" class="formulario__validacion-estado" width="16" height="16"
                fill="currentColor" class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                        d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
                    </svg>
                    
                </div>
                <p class="formulario__input-error">El documento solo puede contener numero y el maximo es de 14 </p>
        </div>
        
        
        
        <!-- cuerpo  de formulario contraseña -->
        <div class="formulario__grupo" id="grupo__pass">
            <label for="pass" class="formulario__label">Contraseña</label>
            <div class="formulario__grupo-input">
                <input type="password" class="formulario__input" name="pass" id="pass" placeholder="digite contraseña"
                required>
                
                <svg xmlns="http://www.w3.org/2000/svg" class="formulario__validacion-estado" width="16" height="16"
                fill="currentColor" class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                    d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
                </svg>
                
            </div>
            <p class="formulario__input-error">La contraeña debe ser de 4 a 16 digitos para ser segura </p>
        </div>
        <!-- cuerpo  de formulario contraseña -->
        <div class="formulario__grupo" id="grupo__pass2">
            <label for="pass2" class="formulario__label">Confirmar Contraseña</label>
            <div class="formulario__grupo-input">
                <input type="password" class="formulario__input" name="pass2" id="pass2" placeholder="contraseña"
                required>
                
                <svg xmlns="http://www.w3.org/2000/svg" class="formulario__validacion-estado" width="16" height="16"
                fill="currentColor" class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                    d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
                </svg>
                
            </div>
            <p class="formulario__input-error">Las contraseñas deben ser igual </p>
        </div>
        <!-- cuerpo de telefono -->
        <div class="formulario__grupo" id="grupo__telefono">
            <label for="email" class="formulario__label">Telefono</label>
            <div class="formulario__grupo-input">
                <input type="text" class="formulario__input" name="telefono" id="telefono" placeholder="3222222"
                    required>
        
                <svg xmlns="http://www.w3.org/2000/svg" class="formulario__validacion-estado" width="16" height="16"
                    fill="currentColor" class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                        d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
                </svg>
            </div>
            <p class="formulario__input-error">El telefono solo puede contener numeros y el maximo es 14</p>
        </div>
        <div class="btn_container">
            <button type="submit" class="bnkl">
                <span>Crear cuenta</span>
            </button>
            <div class="cuenta_register">
                <p><strong>¿Ya tienes cuenta?</strong> <a href="<?php echo base_url("/")?>">Iniciar sesión</a></p>
            </div>
        </div>
    </form>
</div>

<!---------------------scrip---------------------------------->

<script>
    // <--------------------------llamdo de  formulario para validar--------------------->
    
    const formulario = document.getElementById('formulario');
    const inputs = document.querySelectorAll('#formulario input');
    
    const expresiones = {
    usuario: /^[a-zA-Z0-9\_\-]{4,16}$/, // Letras, numeros, guion y guion_bajo
    nombre: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, // Letras y espacios, pueden llevar acentos.
    apellido: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, // Letras y espacios, pueden llevar acentos.
    password: /^.{4,12}$/, // 4 a 12 digitos.
    email: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
    telefono: /^\d{7,14}$/ // 7 a 14 numeros.
}


// <-------------estado de inptus para manipular el envio ------------------------->
const campos = {
    usuario: false,
    nombre: false,
    apellido: false,
    pass: false,
    email: false,
    telefono: false,
    documento: false,

}



const validarfuncion = (e) => {
    switch (e.target.name) {
        case "usuario":
            validarcampo(expresiones.usuario, e.target, 'usuario');

            break;
        case "nombre":
            validarcampo(expresiones.nombre, e.target, 'nombre');

            break;
        case "documento":
            validarcampo(expresiones.telefono, e.target, 'documento');

            break;
        case "apellido":
            validarcampo(expresiones.nombre, e.target, 'apellido');

            break;
        case "email":
            validarcampo(expresiones.email, e.target, 'email');
            verificarEmail(e);

            break;
        case "telefono":
            validarcampo(expresiones.telefono, e.target, 'telefono');

            break;
        case "pass":
            validarcampo(expresiones.password, e.target, 'pass');
            validarpass2();
            break;
        case "pass2":
            validarpass2();
            break;
    }
}

// <-------funcion creada para verificar email------>
function verificarEmail(e) {
    const valorEmail = e.target.value;


    if (valorEmail.includes('@')) { //condicion para evaluar desde el @

        $.ajax({
            url: "<?= base_url("auth/verificar_email")?>" + "/" + valorEmail,
            type: "POST",
            dataType: "JSON",
            success: (data) => {
                // console.log(data)
                if (data !== null) {
                    // Swal.fire('Informacion', 'Ya existe un usuario con ese email registrado', 'info', 'Aceptar');
                    document.getElementById('grupo__email').classList.add('formulario__grupo-incorrecto');
                    document.querySelector('#grupo__email .formulario__input-error_email').classList.add(
                        'formulario__input-error_email-activo')
                    document.getElementById('grupo__email').classList.remove('formulario__grupo-correcto');
                    campos['email'] = false;

                } else {
                    document.querySelector('#grupo__email .formulario__input-error_email').classList.remove(
                        'formulario__input-error_email-activo')
                    campos['email'] = true;
                }

            }
        })
    }


}

// <----------------------------validar campos y renderizado de  respuestas ---------------------->

const validarcampo = (expresion, input, campo) => {
    if (expresion.test(input.value)) {
        document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-incorrecto');
        document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-correcto');
        document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.remove(
            'formulario__input-error-activo')
        campos[campo] = true;
    } else {
        document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-incorrecto');
        document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.add(
            'formulario__input-error-activo')
        document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-correcto');
        campos[campo] = false;
    }
}


// <-----------------------validar contraseña y renderzado de respueestas-------------------->

const validarpass2 = () => {
    const inputpass1 = document.getElementById('pass');

    const inputpass2 = document.getElementById('pass2');

    if (inputpass1.value !== inputpass2.value) {
        document.getElementById(`grupo__pass2`).classList.add('formulario__grupo-incorrecto');
        document.querySelector(`#grupo__pass2 .formulario__input-error`).classList.add(
            'formulario__input-error-activo');
        document.getElementById('grupo__pass2').classList.remove('formulario__grupo-correcto');
        campos['pass'] = false;

    } else {
        document.getElementById(`grupo__pass2`).classList.remove('formulario__grupo-incorrecto');
        document.querySelector(`#grupo__pass2 .formulario__input-error`).classList.remove(
            'formulario__input-error-activo');
        document.getElementById('grupo__pass2').classList.add('formulario__grupo-correcto');
        campos['pass'] = true;
    }

}
// <----------------------evaluacion de campos por clic y teclas---------------------->


inputs.forEach((input) => {
    input.addEventListener('blur', validarfuncion);
    input.addEventListener('keydown', validarfuncion);
});


// <---------------------control de envio de formulario--------------->

formulario.addEventListener('submit', (e) => {


    if (campos.usuario && campos.apellido && campos.nombre && campos.email && campos.pass && campos.telefono &&
        campos.documento) {

            Swal.fire({
                title: 'Bienvenido!',
                text: 'La cuenta fue creada correctamente',
                icon: 'success',
                confirmButtonText: 'Ok'
            });

    } else {
        e.preventDefault();

        Swal.fire({
            title: 'Error!',
            text: 'Los campos no estan  digitados correctamente',
            icon: 'error',
            confirmButtonText: 'Ok'
        })
    }

});
</script>


<?= $this->endSection("contenido")?>