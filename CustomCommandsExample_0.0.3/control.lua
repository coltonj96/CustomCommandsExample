--[[

Basic Function Setup:

function(player, args) -- args is an array and can be empty
  ...
  -- do stuff
  ...
end
]]--
--Example Without arguments
function test_cmd1(player, args)
  for _, player_x in pairs(game.players) do
    player_x.print("Hello from " .. player.surface.name .. "!")
  end
end

--Example With arguments
function test_cmd2(player, args)
  if #args == 0 then
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

    Create a new LuaRemote Interface, required with 'cc_<mod_name>' as the naming convention to prevent duplicates causing errors and ensure
    the api detects the commands
    The name used to call the remote function will be the name of the actual command, for example lets create an interface for
    my_function() with a command called mycmd
    
    remote.add_interface("cc_my_cool_mod_name", {mycmd = my_function})
    
    You only need one interface to register all your commands, they are separated by commas.
]]--

remote.add_interface("cc_test", {test1 = test_cmd1, test2 = test_cmd2})

--[[
Adding Command Descriptions (completely optional)

    To add command descriptions create a function without any parameters that returns a table with the set-up shown below
    
    function my_function()
      local tble = {
        cc_<mod_name> = {
          {
            command = "<my command>",
            description = "<my description>"
          },
          {
            command = "<my command>",
            description = "<my description>"
          }
          ... etc ...
        }
      }
    return tble
    end
    
    Then create a new interface with "ccd_<mod_name>" as the naming convention to ensure its detection and no errors occur
    The call function name must be called 'descriptions' or it will not work (as shown below)
    
    remote.add_interface("ccd_<mod_name>", {descriptions = example_descriptions})
 --]]
 
function example_descriptions()
  local tble = {
    cc_test = {
      {
        command = "test1",
        description = "An example command without any arguments"
      },
      {
        command = "test2",
        description = "An example command with arguments"
      }
    }
  }
  return tble
end
 
remote.add_interface("ccd_test", {descriptions = example_descriptions})