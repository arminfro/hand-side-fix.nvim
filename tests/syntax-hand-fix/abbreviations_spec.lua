local abbreviations = require("syntax-hand-fix.abbreviations")

local function keymaps_find_abbreviation(tab, val)
  for _, keymap in pairs(tab) do
    if val == keymap.lhs then
      return keymap
    end
  end

  return nil
end

describe("AbbreviationsModule", function()
  it("should set keymaps correctly for language mixups", function()
    local language_mixups = {
      ["function"] = { "fucntion", "funciton" },
      ["return"] = { "retrun", "retunr" },
    }

    abbreviations.init(language_mixups)

    local keymaps = vim.api.nvim_buf_get_keymap(0, "ia")

    assert(keymaps_find_abbreviation(keymaps, "fucntion"))
    assert(keymaps_find_abbreviation(keymaps, "funciton"))
    assert(keymaps_find_abbreviation(keymaps, "retrun"))
    assert(keymaps_find_abbreviation(keymaps, "retunr"))
  end)
end)
