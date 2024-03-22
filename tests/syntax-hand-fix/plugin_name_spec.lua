local plugin = require("syntax-hand-fix")

describe("setup", function()
  it("works with default opts", function()
    assert(plugin.setup({ layout = "us" }) == nil)
    assert(plugin.init("lua") == nil)
  end)

  it("does not work with default opts", function()
    local myfunction = function()
      return plugin.setup({ layout = "uus" })
    end
    local ends_with = function(str, suffix)
      return str:sub(-#suffix) == suffix
    end

    xpcall(myfunction, function(err)
      assert(ends_with(err, " not supported"))
      -- assert() == some_how_expressing_it_errors)
    end)
  end)
end)
