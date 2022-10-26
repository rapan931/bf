require("busted.runner")()

describe("Test Bf", function()
  it("outputs 'Hello World!", function()
    local real_stdout = io.stdout
    local file = io.open ('stdout.log', 'w')

    if not file then
      error("io error")
    end

    io.stdout = file

    local bf = require("bf")
    bf.setup([==[+++++++++[>++++++++>+++++++++++>+++++<<<-]>.>++.+++++++..+++.>-.------------.<++++++++.--------.+++.------.--------.>+.]==])
    bf.exec()
    file:close()
    io.stdout = real_stdout


    local file2 = io.open ('stdout.log', 'r')
    if not file2 then
      error("io error")
    end

    assert.is_same("Hello, world!\n", file2:read("*a"))

    file2:close()
    os.remove("stdout.log")
  end)
end)

-- local file = io.open("stdout.log", "r")
-- print(file:read("*a"))
