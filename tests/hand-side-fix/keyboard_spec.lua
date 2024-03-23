local keyboards = require("hand-side-fix.keyboards")

describe("is_different_hand_side", function()
  it("should return true when previous and current characters are on different hand sides in the US layout", function()
    local layout = "us"

    -- Test case where 'a' and 'h' are on different hand sides
    local result1 = keyboards.is_different_hand_side(layout, "a", "h")
    assert.is_true(result1)

    -- Test case where 'g' and 'i' are on different hand side
    local result2 = keyboards.is_different_hand_side(layout, "g", "i")
    assert.is_true(result2)
  end)

  it("should return false when previous or current characters are not letters", function()
    local layout = "us"

    -- Test case where previous character is not a letter
    local result1 = keyboards.is_different_hand_side(layout, "1", "h")
    assert.is_false(result1)

    -- Test case where current character is not a letter
    local result2 = keyboards.is_different_hand_side(layout, "a", "!")
    assert.is_false(result2)

    -- Test case where both previous and current characters are not letters
    local result3 = keyboards.is_different_hand_side(layout, "1", "!")
    assert.is_false(result3)
  end)
end)
