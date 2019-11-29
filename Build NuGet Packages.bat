@ECHO OFF
rd /s /q "NuGet" >NUL
md "NuGet"
nuget pack "%CD%\HMF.Tasks\HMF.Tasks.nuspec" -Build -Properties Configuration=Release
nuget pack "%CD%\Network.Common\Network.Common.nuspec" -Build -Properties Configuration=Release
nuget pack "%CD%\AGConnect.Core\AGConnect.Core.nuspec" -Build -Properties Configuration=Releas
nuget pack "%CD%\Network.GRS\Network.GRS.nuspec" -Build -Properties Configuration=Release
nuget pack "%CD%\HMS.Base\HMS.Base.nuspec" -Build -Properties Configuration=Release
nuget pack "%CD%\HMS.OpenDevice\HMS.OpenDevice.nuspec" -Build -Properties Configuration=Release
nuget pack "%CD%\HMS.Push\HMS.Push.nuspec" -Build -Properties Configuration=Release
move *.nupkg NuGet\
PAUSE >NUL
