local utils = require("hand-side-fix.utils")

describe("UtilsModule", function()
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

  describe("every", function()
    it("should return true if all elements in the table pass the callback function", function()
      local tab = { 1, 2, 3, 4, 5 }
      local callback = function(value)
        return value > 0
      end
      local result = utils.every(tab, callback)
      assert(result)
    end)

    it("should return false if any element in the table fails the callback function", function()
      local tab = { 1, 2, 3, 4, -5 }
      local callback = function(value)
        return value > 0
      end
      local result = utils.every(tab, callback)
      assert.is_false(result)
    end)
  end)

  describe("is_type", function()
    it("should return true if the value is of the specified type", function()
      assert(utils.is_type(10, "number"))
    end)

    it("should return false if the value is not of the specified type", function()
      assert.is_false(utils.is_type("hello", "number"))
    end)
  end)

  describe("filter", function()
    it("should return an empty table if input table is empty", function()
      assert.are.same({}, utils.filter({}))
    end)

    it("should return the same table if all values are not nil", function()
      local input = { 1, "hello", true }
      local output = utils.filter(input)
      assert.are.same(input, output)
    end)

    it("should filter out nil values from the table", function()
      local input = { 1, nil, "hello", nil, true }
      local output = utils.filter(input)
      assert.are.same({ 1, "hello", true }, output)
    end)
  end)
end)
