<?= $this->extend("layouts/authLayout")?>
<?= $this->section("contenido")?>


<div class="login__container">
    <div class="login__form-container">
        <div class="login__logo-container">
            <img src="<?= base_url("../img/gfp.png");?>" alt="logo_gfp">
        </div>

        <div class="login__title-container">
            <p class="login__title-text">Iniciar sesión</p>
            <span class="login__subtitle-text"> <strong>Fortalece tu bolsillo, controla tu futuro: ¡Gestiona tus
                    finanzas hoy!</strong> </span>
        </div>
        <br>
        <form id="formulario" method="POST" class="login__form" action="<?= base_url('AutenticarUsuario'); ?>">
                <!-- cuerpo  de formulario email -->
            <div class="formulario__grupo" id="grupo__email">
                  <label for="email" class="formulario__label" title="digite un correo electronico valido ">Correo Electronico </label>
                  <div class="login__input-container">
                  <input type="email" class="login__form-input-field" name="email" id="email" placeholder="ejemplocorreo@gmail.com" required>
                                  <img src="<?= base_url("icons/envelope-fill.svg")?>" class="login__form-icon"> 

                  </div>
                <p class="formulario__input-error_email">El correo no esta asociada a ninguna cuenta activa </p>
            </div>

            <div class="login__input-container">
                <label class="login__form-input-label" for="password">Contraseña: </label>
                <img src="<?= base_url("icons/person-fill-lock.svg")?>" class="login__form-icon">
                <input placeholder="Ej: **********" name="password" type="password" class="login__form-input-field"
                    id="password" required>
            </div>
            <div class="login__form-footer">

                <a href="<?= base_url("auth/Recuperar_Clave_Pagina")?>">
                    ¿Has olvidado tu contraseña?
                </a>

                <div class="contenedor">
                    <button class="btn_login" type="submit">Entrar</button>
                    
                </div>
            
                
            </div>

            <div class="login__form-register">
                <p><strong>¿No te has registrado aún?</strong></p>
                <a class="" href="<?php echo base_url('CrearCuenta'); ?>">Crear mi cuenta!</a>
            </div>
        </form>
    </div>
</div>

<script>
  // <--------------------------llamdo de  formulario para validar--------------------->

  const formulario = document.getElementById('formulario');
  const inputs = document.querySelectorAll('#formulario input');


// <--------------------------evalluacion de campos----------------------->
const validarfuncion = (e) =>{
  switch(e.target.name){
                        case "email":
                        verificarEmail( e );
                      }    
}


// <---------------------funcion ajax para consultar email--------------->

function verificarEmail( e ) {
  const valorEmail = e.target.value;
   
// console.log(e.target.value)
  if( valorEmail.includes('.')) {
          $.ajax({
                    url: "<?= base_url("auth/verificar_email")?>" + "/" + valorEmail,
                    type: "POST",
                    dataType: "JSON",
                    success: ( data ) => {
                        //  console.log(data)
                        if( data !== null ) {
                          console.log('email correcto')
                          // campos['email']= false;
                          document.querySelector('#grupo__email .formulario__input-error_email').classList.remove('formulario__input-error_email-activo');
                          document.getElementById('grupo__email').classList.remove('formulario__grupo-incorrecto');                          
                        }else{
                           document.getElementById('grupo__email').classList.add('formulario__grupo-incorrecto');
                             document.querySelector('#grupo__email .formulario__input-error_email').classList.add('formulario__input-error_email-activo')
                           document.getElementById('grupo__email' ).classList.remove('formulario__grupo-correcto');
                        // campos['email']= true;
                        // Swal.fire('Informacion', 'este email no esta registrado ', 'info', 'Aceptar');

                        }

                    }
                 }
     )
  }
}

// funtion validarcuenta =  (e)=> {
//   if( ){
//     $ajax({
//       url: "<?= base_url("auth/AutenticarUsuario")?>",
//       dataType: "JSON",
//       success:(data)=>{
//         if( data === 1 ){
//           console.log('por aqui')
//         }
//       }
//     })
//   }  

// }

  // <----------------------evaluacion de campos por clic y teclas---------------------->

inputs.forEach( (input)=>{
  input.addEventListener('blur', validarfuncion);
  input.addEventListener('keydown', validarfuncion);
});

</script>

<?= $this->endSection("contenido")?>


<!-- <scrip de odu> -->
/* 
function MostrarModal() {

Swal.fire({
  title: 'Restablecer Contraseña',
  input: 'email',
  inputLabel: 'Te enviaremos un enlace de restablecimiento de contraseña a tu correo electrónico para que puedas recuperar tu acceso a nuestra plataforma.',
  inputPlaceholder: 'Ej: name@example.com',
  heightAuto: false,
  customClass: {
    inputLabel: 'my-custom-class'
  },
  inputValidator: (value) => {
    if (!value) {
      return 'Por favor, ingresa el correo electrónico';
    } else if (!/\S+@\S+\.\S+/.test(value)) {
      return 'Correo electrónico inválido';
    }
  }
}).then((result) => {
  if (result.isConfirmed) {
    const email = result.value;
    Swal.fire(`El link de restablacimiento de contraseña llegara al correo: ${email}`);

    setTimeout(() => {
      window.location.href = 
    }, 1000)
  }
});

} */