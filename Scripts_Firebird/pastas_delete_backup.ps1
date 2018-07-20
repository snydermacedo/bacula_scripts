#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

$dirScc         = "F:\SCCN"
$dirDocs        = "F:\DOCS"
$dirBacula      = "F:\bacula"
$arq7scc        = "scc.7z"
$arq7docs       = "docs.7z"

$file1 = $dirBacula + "\" + $arq7scc;
$file2 = $dirBacula + "\" + $arq7docs;
    
# Se existir o arquivo anterior, exclui o scc e o docs
if( Test-Path $file1){
    Remove-Item $file1
  }
if( Test-Path $file2){
    Remove-Item $file2
  }
Exit 0