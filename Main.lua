-- This file is provided as a free-to-use template for educational and development purposes.
-- It can serve as a foundation for further work, modifications, and enhancements.
-- No credit is required, and you are free to use, distribute, and build upon this file without restrictions.
-- Check Licence on github for more information.
--
-- Contacts:
-- Discord: noahtjee
-- github: mrnonoah0

local function factorial(n)
    if n == 0 then return 1 end
    local result = 1
    for i = 2, n do
        result = result * i
    end
    return result
end

local function gcd(a, b)
    while b ~= 0 do
        a, b = b, a % b
    end
    return a
end

local function displayMenu()
    local menu = {
        "[1] Basic Operations (-+/*)",
        "[2] Sine (sin)",
        "[3] Cosine (cos)",
        "[4] Tangent (tan)",
        "[5] Random Number Generator",
        "[6] Square Root (sqrt)",
        "[7] Power (base^exp)",
        "[8] Logarithm (log)",
        "[9] Absolute Value (abs)",
        "[10] Rounding (floor/ceil)",
        "[11] Factorial (!)",
        "[12] Modulus (%)",
        "[13] Greatest Common Divisor (GCD)",
        "[0] Exit"
    }
    for _, line in ipairs(menu) do print(line) end
end

local function inputNumber(prompt)
    io.write(prompt .. ": ")
    return tonumber(io.read())
end

local function basicOperations()
    io.write("Enter a math expression: ")
    local expression = io.read()
    local func, err = load("return " .. expression)
    if func then
        local success, result = pcall(func)
        if success then
            print("Result: " .. result)
            io.write("Do you want the answer to be floored? (yes/no): ")
            if io.read():lower() == "yes" then
                print("Result: " .. math.floor(result))
            end
        else
            print("Error evaluating expression!")
        end
    else
        print("Invalid input!")
    end
end

local actions = {
    [1] = basicOperations,
    [2] = function() print("Result: " .. math.sin(inputNumber("Enter a number"))) end,
    [3] = function() print("Result: " .. math.cos(inputNumber("Enter a number"))) end,
    [4] = function() print("Result: " .. math.tan(inputNumber("Enter a number"))) end,
    [5] = function() print("Result: " .. math.random(inputNumber("Enter min"), inputNumber("Enter max"))) end,
    [6] = function() print("Result: " .. math.sqrt(inputNumber("Enter a number"))) end,
    [7] = function() print("Result: " .. math.pow(x, y)(inputNumber("Enter base"), inputNumber("Enter exponent"))) end,
    [8] = function() print("Result: " .. math.log(inputNumber("Enter a number"))) end,
    [9] = function() print("Result: " .. math.abs(inputNumber("Enter a number"))) end,
    [10] = function() 
        local num = inputNumber("Enter a number")
        print("Floor: " .. math.floor(num) .. ", Ceil: " .. math.ceil(num))
    end,
    [11] = function() print("Result: " .. factorial(inputNumber("Enter a number"))) end,
    [12] = function() print("Result: " .. (inputNumber("Enter first number") % inputNumber("Enter second number"))) end,
    [13] = function() print("Result: " .. gcd(inputNumber("Enter first number"), inputNumber("Enter second number"))) end
}

local function main()
    while true do
        displayMenu()
        local choice = inputNumber("Choose an option")
        if choice == 0 then break end
        if actions[choice] then
            actions[choice]()
        else
            print("Invalid choice, try again.")
        end
        print()
    end
    print("Goodbye!")
end

main()
