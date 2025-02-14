print("[1] = -+/*")
print("[2] = sin")
print("[3] = cos")
print("[4] = tan")
print("[5] = Random Number Generator")
print()

function InputLoop()
    local pi = 3.141592653589793238462643383279502884197
    local input = io.read()

    if input == "1" then
        print("Enter a math expression (or type 'exit' to quit):")
        local input2 = io.read()
        local func, err = load("return " .. input2)
    
        if func then
            local success, result = pcall(func)
            if success then
                print("Result: " .. result)
                print("Do you want the answer to be floored? (yes or no)")
                local answer = io.read()
                if answer == "yes" then
                    print("Result: " .. math.floor(result))
                    InputLoop()
                elseif answer == "no" then
                    InputLoop()
                end
            else
                print("Error evaluating expression!")
                InputLoop()
            end
        else
            print("Invalid input! Please enter a valid math expression.")
        end
    elseif input == "2" then
        print("Enter a number")
        local answer = io.read()
        print("Result: " .. math.sin(answer))
    elseif input == "3" then
        print("Enter a number")
        local answer = io.read()
        print("Result: " .. math.cos(answer))
    elseif input == "4" then
        print("Enter a number")
        local answer = io.read()
        print("Result: " .. math.tan(answer))
    elseif input == "5" then
        print("Enter minimum")
        local answer1 = io.read()
        print("Enter maximum")
        local answer2 = io.read()
    
        print("Result: " .. math.random(answer1, answer2))
    end
end

InputLoop()
