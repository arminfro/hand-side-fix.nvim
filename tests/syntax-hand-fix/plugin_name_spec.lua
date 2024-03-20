local plugin = require("syntax-hand-fix")

describe("setup", function()
  it("works with default", function()
    assert(plugin.init() == "Hello!", "my first function with param = Hello!")
  end)

  it("works with custom var", function()
    plugin.setup({ opt = "custom" })
    assert(plugin.init() == "custom", "my first function with param = custom")
  end)
end)
