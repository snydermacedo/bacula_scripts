###################################################################################
# Autor: Wanderlei H:ttel
###################################################################################

###################################################################################
# Definiç:o e Inicializaç:o de Vari:veis
###################################################################################

    $dirRaiz           = "F:\SISTRD"                        # Diret:rio do banco de dados
    $dirBackup         = $dirRaiz + "\" + "bacula"          # Diret:rio raiz da pasta questor
    $dirBaseFDB        = $dirRaiz			                # Diret:rio raiz da pasta questord
    $arqBancoDados     = "SISTRD.FDB"                       # Nome do arquivo da basequente questor
    $arqBancoBackup    = "SISTRD.FBK"                       # Nome do arquivo da base de backup
    $arqBancoLog       = "SISTRD.log"                       # Nome do arquivo de log do backup
    $fbUser            = "sysdba"                           # Usu:rio Firebird
    $fbPassword        = "masterkey"                        # Senha Firebird
	                                                        
	$file1 = $dirBackup + "\" + $arqBancoBackup;           # Dump do Firebird
	$file2 = $dirBackup + "\" + $arqBancoLog;              # Log do Dump do Firebird
	
	if( Test-Path $file1){
	  Remove-Item $file1
	  write-host "Arquivo $file1 excluido com sucesso!"
	}
	if( Test-Path $file2){
	  Remove-Item $file2
	  write-host "Arquivo $file2 excluido com sucesso!"
	}	
    Exit 0