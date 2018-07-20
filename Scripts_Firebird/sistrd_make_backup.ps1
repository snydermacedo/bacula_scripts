###################################################################################
# Autor: Wanderlei H:ttel
###################################################################################

###################################################################################
# Aliases de Programas (configurar o caminho completo do gbak)
###################################################################################
#    Set-Alias -Name gbak -Value "C:\Program Files\Firebird\Firebird_2_5\bin\gbak.exe"
#    Set-Alias -Name gbak -Value "C:\Program Files (x86)\Firebird\Firebird_2_5\bin\gbak.exe"
     Set-Alias -Name gbak -Value "C:\Arquivos de programas\Firebird\Firebird_2_5\bin\gbak.exe"
     
###################################################################################
# Definiç:o e Inicializaç:o de Vari:veis
###################################################################################

    $dataHoraInicial   = Get-Date -f "dd/MM/yyyy HH:mm:ss"  # Obter a data atual
    $dirRaiz           = "F:\SISTRD"                        # Diret:rio do banco de dados
    $dirBackup         = $dirRaiz + "\" + "bacula"          # Diret:rio raiz da pasta questor
    $dirBaseFDB        = $dirRaiz                           # Diret:rio raiz da pasta questord
    $arqBancoDados     = "SISTRD.FDB"                       # Nome do arquivo da basequente questor
    $arqBancoBackup    = "SISTRD.FBK"                       # Nome do arquivo da base de backup
    $arqBancoLog       = "SISTRD.log"                       # Nome do arquivo de log do backup
    $fbUser            = "sysdba"                           # Usu:rio Firebird
    $fbPassword        = "masterkey"                        # Senha Firebird
    
    $file1 = $dirBackup + "\" + $arqBancoBackup;            # Dump do Firebird
    $file2 = $dirBackup + "\" + $arqBancoLog;               # Log do Dump do Firebird
    
    # Se existir o backup anterior, exclui o backup e o log
    if( Test-Path $file1){
        Remove-Item $file1
    }
    if( Test-Path $file2){
        Remove-Item $file2
    }

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# Backup do Banco Firebird
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    write-host "Dump do banco iniciado em $dataHoraInicial ..."
    write-host "gbak -B $dirBaseFDB\$arqBancoDados $dirBackup\$arqBancoBackup -Y $dirBackup\$arqBancoLog -user $fbUser -pass $fbPassword"
    gbak -B $dirBaseFDB\$arqBancoDados $dirBackup\$arqBancoBackup -Y $dirBackup\$arqBancoLog -user $fbUser -pass $fbPassword
    $dataHoraFinal  = Get-Date -f "dd/MM/yyyy HH:mm:ss"
    write-host "Dump do banco finalizado em $dataHoraFinal"
    Exit 0
                        