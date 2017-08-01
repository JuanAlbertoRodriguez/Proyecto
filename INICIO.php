<!--INICIO.PHP pwnwin-->
<?php
session_start();

require_once "CRUDS/Login-Proye/Conexion.php";
require_once "CRUDS/Login-Proye/Login.php";

if (isset($_GET['logout']=='ok'):
					Login::deslogar();
			endif;
	endif;

if isset($_SESSION['logado'])):
	?>
			BIENVENIDO<?php echo $_SESSION['administrador']; ?>
			<br />
			<a href="inicio.php?logout=ok">Salir del sistema</a>
<?php
else:
			echo "Usted no tiene permiso de acceso al sistema...";
endif;
