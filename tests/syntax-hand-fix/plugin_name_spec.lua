local plugin = require("syntax-hand-fix")

describe("setup", function()
  it("works with default opts", function()
    assert(plugin.setup({ layout = "us" }) == nil)
    assert(plugin.init("lua") == nil)
  end)

  it("does not work with unsuppoted layout opts", function()
    local setup_function = function()
      return plugin.setup({ layout = "uus" })
    end

    local ends_with = function(str, suffix)
      return str:sub(-#suffix) == suffix
    end

    xpcall(setup_function, function(err)
      assert(ends_with(err, " not supported"))
    end)
  end)
end)
