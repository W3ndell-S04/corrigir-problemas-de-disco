# Executar verificação de disco e corrigir automaticamente os erros encontrados
$disk = Get-WmiObject Win32_LogicalDisk -Filter "DriveType = 3"
foreach ($drive in $disk) {
    $driveLetter = $drive.DeviceID
    Write-Host "Verificando disco $driveLetter ..."
    Start-Process -FilePath "chkdsk.exe" -ArgumentList "/f /r /x $driveLetter" -NoNewWindow -Wait
    Write-Host "Verificação de disco concluída para $driveLetter."
}


#Este script faz o seguinte:

#Obtém uma lista de todos os discos lógicos no sistema.
#Itera sobre cada disco.
#Para cada disco, executa o chkdsk.exe (utilitário de verificação de disco do Windows) 
#com os argumentos:
# 1 - /f para corrigir erros
# 2 - /r para identificar setores defeituosos e recuperar informações legíveis
# 3 - /x para desmontar o volume antes de executar a verificação, e o identificador do disco.