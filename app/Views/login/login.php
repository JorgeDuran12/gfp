<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link rel="stylesheet" href="<?= base_url("/css/login/login.css")?>">
</head>

<body>
    <div class="all">


        <div class="form">
            <div class="cont-form">
                <h5 class="card-title">Login</h5>
                <p class="card-text">
                <form method="POST" action="<?=base_url('login');?>" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="usu">Usuario</label>
                        <input id="usu" class="form-control" type="text" name="usu" required>
                    </div>
                    <div class="form-group">
                        <label for="pass">Contraseña</label>
                        <input id="pass" class="form-control" type="password" name="pass" required>
                    </div>
                    <button class="btn btn-success" type="submit">Iniciar sesión</button>
                </form>
                </p>
            </div>
        </div>
    </div>
    </div>
</body>

</html>