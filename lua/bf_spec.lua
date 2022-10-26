require("busted.runner")()

describe("Test Bf", function()
  it("outputs 'Hello World!", function()
    stub(_G, "print")

    local bf = require("bf")
    bf.setup([==[+++++++++[>++++++++>+++++++++++>+++++<<<-]>.>++.+++++++..+++.>-.------------.<++++++++.--------.+++.------.--------.>+.]==])
    bf.exec()

    assert.stub(_G.print).was.called_with("Hello, world!")
  end)
end)
