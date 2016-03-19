local Justice = lukkit.addPlugin("Justice", "v1.0-alpha",
    function(plugin)
        
        plugin.onEnable(
            function()
                plugin.print("Created by Lord_Cuddles for @CuddlesMCServer")
                plugin.print("Enabled version "..plugin.version)
                
                plugin.config.setDefault("config.accepted", "rules.accepted")
                plugin.config.setDefault("config.theme", "blue")
                plugin.config.save()
                
                if plugin.config.get("config.theme") == "blue" then
                    s = { "§9", "§b", "§f", }
                elseif plugin.config.get("config.theme") == "red" then
                    s = { "§4", "§c", "§f", }
                elseif plugin.config.get("config.theme") == "green" then
                    s = { "§2", "§a", "§f", }
                elseif plugin.config.get("config.theme") == "yellow" then
                    s = { "§6", "§e", "§f", }
                else
                    s = { "§8", "§7", "§f", }
                end
                
            end
        )
        
        plugin.onDisable(
            function()
                plugin.warn("Plugin was disabled! Use vanilla banning.")
            end
        )
        
        plugin.addCommand("justice", "Show information about the justice plugin", "/justice",
            function(sender, args)
                sender:sendMessage(s[1].."==========[ "..s[2].."Justice - Help"..s[1].." ]==========")
                sender:sendMessage(s[2].."Version: "..s[3]..plugin.version )
                sender:sendMessage(s[2].."/rules")
                sender:sendMessage(s[2].."/punishments")
                sender:sendMessage(s[2].."/punish")
                sender:sendMessage(s[2].."/punishlevel")
            end
        )
        
        plugin.addCommand("irules", "You must agree to the rules to play!", "/irules",
            function(sender, args)
                if args[1] == "agree" then
                    if sender:hasPermission(plugin.config.get("config.accepted")) == false then
                        server:dispatchCommand(server:getConsoleSender(), "pex user "..sender:getName().." add "..plugin.config.get("config.accepted"))
                        broadcast("§aThe player "..sender:getDisplayName().." §ahas accepted the rules!")
                    else
                        sender:sendMessage(s[2].."You have already accepted the rules.")
                    end
                elseif args[1] == "disagree" then
                    server:dispatchCommand(server:getConsoleSender(), "pex user "..sender:getName().." remove "..plugin.config.get("config.accepted"))
                    server:dispatchCommand(server:getConsoleSender(), "minecraft:kick "..sender:getName().." §cYou must accept the rules to play!")
                    broadcast("§cThe player "..sender:getDisplayName().." §ahas declined the rules!")
                elseif args[1] == "betrayal" then
                    sender:sendMessage(s[1].."==========[ "..s[2].."Rules - Betrayal "..s[1].."]==========")
                    sender:sendMessage(s[2].."1. Don't manipulate players into revealing personal info")
                    sender:sendMessage(s[2].."2. Don't join a faction to grief or steal")
                    sender:sendMessage(s[2].."3. Honor trade agreements made")
                    sender:sendMessage(s[2].."Type "..s[3].."/rules spamming"..s[2].." for the next rule")
                elseif args[1] == "spamming" then
                    sender:sendMessage(s[1].."==========[ "..s[2].."Rules - Spamming "..s[1].."]==========")
                    sender:sendMessage(s[2].."1. Don't overuse punctuation or capitalisation")
                    sender:sendMessage(s[2].."2. Don't post each letter of a word as single messages")
                    sender:sendMessage(s[2].."3. Don't post each word of a sentence as single messages")
                    sender:sendMessage(s[2].."4. Don't post random letters or words in chat")
                    sender:sendMessage(s[2].."5. Use British English in global and ally chat")
                    sender:sendMessage(s[2].."6. All languages are allowed in faction and public chat")
                    sender:sendMessage(s[2].."7. Don't advertise anything outside the game without consent")
                    sender:sendMessage(s[2].."Type "..s[3].."/rules cheating"..s[2].." for the next rule")
                elseif args[1] == "cheating" then
                    sender:sendMessage(s[1].."==========[ "..s[2].."Rules - Cheating "..s[1].."]==========")
                    sender:sendMessage(s[2].."1. Don't install or use hacked clients")
                    sender:sendMessage(s[2].."2. Don't use xray texture packs or mods")
                    sender:sendMessage(s[2].."3. Don't install client mods without staff consent")
                    sender:sendMessage(s[2].."4. Don't install mods to assist you in combat")
                    sender:sendMessage(s[2].."5. Don't bypass faction protection with pistons or liquids")
                    sender:sendMessage(s[2].."6. Don't abuse plugin glitches or problems")
                    sender:sendMessage(s[2].."7. Don't use alternative accounts as power boosts")
                    sender:sendMessage(s[2].."Type "..s[3].."/rules bigotry"..s[2].." for the next rule")
                elseif args[1] == "bigotry" then
                    sender:sendMessage(s[1].."==========[ "..s[2].."Rules - Bigotry "..s[1].."]==========")
                    sender:sendMessage(s[2].."1. Don't discriminate someone because of their race")
                    sender:sendMessage(s[2].."2. Don't discriminate someone because of their gender")
                    sender:sendMessage(s[2].."3. Don't discriminate someone because of their beliefs")
                    sender:sendMessage(s[2].."4. Don't discriminate someone because of their sexuality")
                    sender:sendMessage(s[2].."6. Avoid using language associated with discrimination")
                    sender:sendMessage(s[2].."Type "..s[3].."/rules more"..s[2].." for additional rules")
                elseif args[1] == "more" then
                    sender:sendMessage(s[1].."==========[ "..s[2].."Rules - More "..s[1].."]==========")
                    sender:sendMessage(s[2].."1. Staff member's decision is final")
                    sender:sendMessage(s[2].."2. The server map is not available for download")
                    sender:sendMessage(s[2].."3. The map seed is not available")
                    sender:sendMessage(s[2].."4. Dispute bans at http://cuddl.es/ and type /auth")
                    sender:sendMessage(s[2].."5. Don't try and get around bans with second accounts")
                    sender:sendMessage(s[2].."6. Don't be a smart alec with the rules")
                    if sender:hasPermission(plugin.config.get("config.accepted")) == true then
                        sender:sendMessage(s[3].."You have already accepted the rules.")
                    elseif sender:hasPermission(plugin.config.get("config.accepted")) == false then
                        sender:sendMessage(s[3].."Do you agree to follow the rules and their clauses?")
                        sender:sendMessage(s[3].."Type "..s[2].."/rules agree"..s[3].." or "..s[2].."/rules disagree")
                    end
                elseif args[1] == nil then
                    sender:sendMessage(s[1].."==========[ "..s[2].."Rules - Summary "..s[1].."]==========")
                    sender:sendMessage(s[2].."1. No Betrayal - Type /rules betrayal")
                    sender:sendMessage(s[2].."2. No Spamming - Type /rules spamming")
                    sender:sendMessage(s[2].."3. No Cheating - Type /rules cheating")
                    sender:sendMessage(s[2].."4. No Bigotry - Type /rules bigotry")
                    sender:sendMessage(s[2].."5. More Rules - Type /rules more")
                    if sender:hasPermission(plugin.config.get("config.accepted")) == true then
                        sender:sendMessage(s[3].."You have already accepted the rules.")
                    elseif sender:hasPermission(plugin.config.get("config.accepted")) == false then
                        sender:sendMessage(s[3].."Do you agree to follow the rules and their clauses?")
                        sender:sendMessage(s[3].."Type "..s[2].."/rules agree"..s[3].." or "..s[2].."/rules disagree")
                    end
                else
                    sender:sendMessage(s[1].."Error: "..s[2].."Unknown rule. Type /rules to list them")
                end
            end
        )
        
        events.add("playerJoin", 
            function(event)
                local player = event:getPlayer()
                -- Punishments
                -- Justice
                if player:hasPermission(plugin.config.get("config.accepted")) == false then
                    plugin.print("The user "..player:getName().." has not yet accepted the rules.")
                    server:broadcast("§7§o"..player:getName().." has not yet accepted the rules.", "rules.notify")
                    player:sendMessage(s[1].."###################################")
                    player:sendMessage(s[2].."You must accept the rules before playing!")
                    player:sendMessage(s[1].."###################################")
                end
            end
        )
        
        events.add("playerQuit",
            function(event)
                local player = event:getPlayer()
                if player:hasPermission(plugin.config.get("config.accepted")) == false then
                    plugin.print("The user "..player:getName().." did not accept the rules.")
                    server:broadcast("§7§o"..player:getName().." did not accept the rules.", "rules.notify")
                end
            end
        )
        
        events.add("asyncPlayerChat",
            function(event)
                local player = event:getPlayer()
                if player:hasPermission(plugin.config.get("config.accepted")) == false then
                    server:broadcast("§7[Default] §8"..player:getName().."§7: §m"..event:getMessage(), "rules.notify")
                    player:sendMessage(s[1].."Error: "..s[2].."You must accept the rules before playing!")
                    event:setCancelled(true)
                end
            end
        )
        
        events.add("playerInteract",
            function(event)
                local player = event:getPlayer()
                if player:hasPermission(plugin.config.get("config.accepted")) == false then
                    player:sendMessage(s[1].."Error: "..s[2].."You must accept the rules before playing!")
                    event:setCancelled(true)
                end
            end
        )
        
    end
)
