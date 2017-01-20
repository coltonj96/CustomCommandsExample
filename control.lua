--[[

Basic Function Setup:

function(data)
  local player = data[1]
  local args = data[2] or nil
  ...
    code
  ...
end

]]--
--Example Without arguments
function test_cmd1(data)
  local player = data[1]
  local args = data[2] or nil
  for _, player_x in pairs(game.players) do
    player_x.print("Hello World!")
  end
end

--Example With arguments
function test_cmd2(data)
  local player = data[1]
  local args = data[2] or nil
  if not args then
    player.print("This command requires at least one argument!")
  else
    local msg = ""
    for _, arg in pairs(args) do
      msg = msg .. " " .. arg
    end
    for _, player_x in pairs(game.players) do
      player_x.print("Testing arguments! "..msg)
    end
  end
end

--[[
Adding Commands

    Create a new LuaRemote Interface, preferably with 'cc_<mod_name>' as the naming convention to prevent duplicates causing errors
    The name used to call the remote function will be the name of the actual command, for example lets create an interface for
    my_function() with a command called mycmd
    
    remote.add_interface("cc_my_cool_mod_name", {mycmd = my_function})
    
    You only need one interface to register multiple commands, they are seperated by commas.
]]--

remote.add_interface("cc_test", {test1 = test_cmd1, test2 = test_cmd2})

--[[
Registering Commands

    For each command to be registered you must specify a remote call to the CustomCommands Api Mod,
    for example using the above example in adding commands
    
    remote.call("custom_commands", "register_command", "mycmd", "cc_My_Cool_Mod_Name")
    
    This must be done for each command you want to register in your mod
]]--

remote.call("custom_commands", "register_command", "test1", "cc_test")
remote.call("custom_commands", "register_command", "test2", "cc_test")