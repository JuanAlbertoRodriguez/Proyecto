<!-- INDEX.PHP -->
<?php
session_start();

require_once "cruds/Conexion.php";
require_once "cruds/Login.php";
	
			if (isset($POST['ok'])):
				$Login = filter_input(INPUT_POST,"Login",FILTER_SANITIZE_MAGIC_QUOTES);
				$Senha = filter_input(INPUT_POST, "senha",FILTER_SANITIZE_MAGIC_QUOTES);

				$| = new Login;
				$|-> setLogin($login);
				$|-> setSenha($senha);

				if ($|->inicio()):
						header("Location:inicio.php");
					else:
						$erro = "Error para iniciar...";
					endif;
			endif;
?>
<html>
<head>
		<title>Login Con PHPOO</title>>
		<link rel="stylesheet" type="text/css" href=".../css/styles.css"/>
</head>
<body>
<div id="login">
			<form action="" method="POST" id="form_login">
			<!--labels-->
			<label for="login">Login:</label>
			<input type="text" name="login" class="input" id="input_login"/>

			<label for="senha">Senha:</label>
			<input type="text" name="senha" class="input" id="input_senha"/>
			
			<label for="submit"></label>
			<input type="submit" name="ok" id="bt_inicio" value="inicio"
			class="input_button"/>
						</form>
						<?php echo isset($erro) ? $erro:;?>
			</div>>
			</body>
			</html>