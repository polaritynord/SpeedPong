local ui = {
    menuSelection = 1;
    menuButtons = {"New Game", "How to Play", "Quit"};
    finalScores = {0, 0};
}

function love.keypressed(key)
    -- Move selection
    if GameState == "menu" then
        if key == "down" then
            ui.menuSelection = ui.menuSelection + 1
        elseif key == "up" then
            ui.menuSelection = ui.menuSelection - 1
        end
    end
    -- Z key
    if key == "z" then
        if GameState == "menu" then
            ui.selectEvent(ui.menuButtons[ui.menuSelection])
        elseif GameState == "howtoplay" or GameState == "winner" then
            GameState = "menu"
        end
    end

    if ui.menuSelection > #ui.menuButtons then
        ui.menuSelection = 1
    elseif ui.menuSelection < 1 then
        ui.menuSelection = #ui.menuButtons
    end
end

function ui.selectEvent(selection)
    if selection == "New Game" then
        GameTerminate()
        GameState = "game"
        GameSetup()
    elseif selection == "How to Play" then
        GameState = "howtoplay"
    elseif selection == "Quit" then
        love.event.quit()
    end
end

function ui.draw()
    if GameState == "game" then
        love.graphics.setNewFont("fonts/DTM-Mono.ttf", 45)
        -- Paddle 1
        love.graphics.printf(tostring(Paddle1.score), 25, 25, 1000, "left")
        -- Paddle 2
        love.graphics.printf(tostring(Paddle2.score), -70, 25, 1000, "right")
        -- Speed multipler
        love.graphics.setNewFont("fonts/DTM-Mono.ttf", 24)
        love.graphics.printf(string.sub(tostring(SpeedMultiplier), 1, 4) .. "x", -15, 0, 1000, "center")
    elseif GameState == "menu" then
        -- Draw title
        love.graphics.setNewFont("fonts/DTM-Mono.ttf", 64)
        love.graphics.printf("Speed Pong", -26, 50, 1000, "center")
        -- Draw selections
        love.graphics.setNewFont("fonts/DTM-Mono.ttf", 32)
        for i, v in ipairs(ui.menuButtons) do
            local text = v
            if ui.menuSelection == i then text = "* " .. v end
            love.graphics.printf(text, -35, (i-1)*45+250, 1000, "center")
        end
        -- Draw "z to begin"
        love.graphics.setNewFont("fonts/DTM-Mono.ttf", 24)
        love.graphics.setColor(1, 1, 1, 0.5)
        love.graphics.print("Use arrow keys to move, press Z to select.", 0, 516)
        love.graphics.setColor(1, 1, 1, 1)
    elseif GameState == "howtoplay" then
        love.graphics.setNewFont("fonts/DTM-Mono.ttf", 28)
        -- Paddle1 info
        love.graphics.printf("* Use the keys W and S to move to move the blue paddle.", 20, 85, 1000, "left")
        -- Paddle2 info
        love.graphics.printf("* Use the keys UP and DOWN to move to move the red paddle.", 20, 120, 960, "left")
        -- Score info
        love.graphics.printf("* First player to reach 5 points wins.", 20, 174, 1000, "left")
        -- Return text
        love.graphics.setNewFont("fonts/DTM-Mono.ttf", 24)
        love.graphics.setColor(1, 1, 1, 0.5)
        love.graphics.print("press Z to return to menu.", 0, 516)
        love.graphics.setColor(1, 1, 1, 1)
    elseif GameState == "winner" then
        -- Winner text
        love.graphics.setNewFont("fonts/DTM-Mono.ttf", 48)
        if ui.finalScores[1] > ui.finalScores[2] then
            love.graphics.printf("Blue Won!", 0, 270, 1000, "center")
        else
            love.graphics.printf("Red Won!", 0, 270, 1000, "center")
        end
        -- Menu text
        love.graphics.setNewFont("fonts/DTM-Mono.ttf", 24)
        love.graphics.setColor(1, 1, 1, 0.5)
        love.graphics.print("press Z to return to menu.", 0, 516)
        love.graphics.setColor(1, 1, 1, 1)
    end
end

return ui