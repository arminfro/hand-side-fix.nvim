local utils = require("syntax-hand-fix.utils")

describe("KeywordsModule", function()
  describe("has_value", function()
    it("should return true if value is found in table", function()
      local tab = { 1, 2, 3, 4, 5 }
      local val = 3
      assert.is_true(utils.has_value(tab, val))
    end)

    it("should return false if value is not found in table", function()
      local tab = { 1, 2, 3, 4, 5 }
      local val = 6
      assert.is_false(utils.has_value(tab, val))
    end)
  end)

  describe("is_letter", function()
    it("should return true if input is a letter 'a'", function()
      local char = "a"
      assert.is_true(utils.is_letter(char))
    end)

    it("should return false if input is not a letter 'a'", function()
      local char = "!"
      assert.is_false(utils.is_letter(char))
    end)
  end)
end)
