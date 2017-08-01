<!--CONEXION.PHP pwnwin-->
<?php
abstract class Conexion 
{
 	const USER = "root"
 	const PASS = "";

 	private static $instance = numm;
 	private static function conectar() {
 					try
 						{
 							if(self::instance == null):
 										$dsn =
"mysql:host = localhost;BD_LA_PECOSA=php_treinamiento";
 											self::$instance = new PDO($dsn,self::USER,self::PASS);
 											self::$instance->setAttribute(PDO::ATTR_ERRMODE,
 												PDO::ERRMODE_EXCEPTION);
 																		endif;
 																}catch (PDOException $e){
 																	echo "Error: ".$e->getMessage();
 																}
 														   return self::$instance;
 														}
 									protected static function getBD(){
 													return self::conectar();
 									}
							}

							?>