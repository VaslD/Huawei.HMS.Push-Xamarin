@ECHO OFF
rd /s /q "NuGet" >NUL
md "NuGet"
nuget pack "%CD%\HMF.Tasks\HMF.Tasks.csproj" -Build -Properties Configuration=Release
nuget pack "%CD%\Network.Common\Network.Common.csproj" -Build -Properties Configuration=Release
nuget pack "%CD%\AGConnect.Core\AGConnect.Core.csproj" -Build -Properties Configuration=Release
nuget pack "%CD%\Network.GRS\Network.GRS.csproj" -Build -Properties Configuration=Release
nuget pack "%CD%\HMS.Base\HMS.Base.csproj" -Build -Properties Configuration=Release
nuget pack "%CD%\HMS.OpenDevice\HMS.OpenDevice.csproj" -Build -Properties Configuration=Release
nuget pack "%CD%\HMS.Push\HMS.Push.csproj" -Build -Properties Configuration=Release
move *.nupkg NuGet\
PAUSE >NUL
