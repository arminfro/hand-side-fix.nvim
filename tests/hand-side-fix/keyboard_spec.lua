local keyboards = require("hand-side-fix.keyboards")

describe("is_different_hand_side", function()
  it("should return true when previous and current characters are on different hand sides in the US layout", function()
    local layout = "us"

    local result1 = keyboards.is_different_hand_side(layout, "a", "h")
    assert.is_true(result1)

    local result2 = keyboards.is_different_hand_side(layout, "g", "i")
    assert.is_true(result2)
  end)

  it("should return false when previous or current characters are not letters", function()
    local layout = "us"

    local result1 = keyboards.is_different_hand_side(layout, "1", "h")
    assert.is_false(result1)

    local result2 = keyboards.is_different_hand_side(layout, "a", "!")
    assert.is_false(result2)

    local result3 = keyboards.is_different_hand_side(layout, "1", "!")
    assert.is_false(result3)
  end)

  it("should return false when letters are the same", function()
    local layout = "us"

    local result1 = keyboards.is_different_hand_side(layout, "h", "h")
    assert.is_false(result1)

    local result2 = keyboards.is_different_hand_side(layout, "a", "A")
    assert.is_false(result2)
  end)
end)
