#Descripción
#Nombre: Fernández_Hidalgo_Cristian_ISO_Tarea_Extensiones.ps1
#Autor: Cristian Fernández Hidalgo
#Fecha: 24/11/2019
#Version: 1.0
#Limpiar pantalla
clear
#Título
Write-Host "Extensiones de los archivos"
#Obtención de datos
$ruta= Read-Host "Escriba la ruta absoluta"
ls $ruta -File
$respuesta= Read-Host "¿Tienen extensión los archivos que desea cambiar?(si o no)"
#Si la respuesta es sí, el Script cambia la extensión.
if ($respuesta -eq "si")
{
$extension= Read-Host "Extensiones de los archivos que queremos cambiar(sin punto)"
$extension2= Read-Host "Nueva extension para los archivos(sin punto)"
dir *.$extension | ren -NewName { [io.path]::ChangeExtension($_.name, "$extension2") }
ls -file |ft -AutoSize
Pause
}
#Si la respuesta es no, el Script cambia el nombre y da una extensión a los archivos.
elseif ($respuesta -eq "no")
{
$extension= Read-Host "Extension en la que quieres los archivos(sin punto)"
ls $ruta -File |%{ren $_ -NewName "$_.$extension"}
ls $ruta -File|ft -AutoSize
Pause
}
else
#Si la respuesta no es si o no, el Script te dice que lo ejecutes de nuevo.
{
Write-Host "Ha introducido mal la respuesta a la pregunta.Ejecute de nuevo el Script"
Pause
}