local abbreviations = require("hand-side-fix.abbreviations")

local function keymaps_find_abbreviation(tab, val)
  for _, keymap in pairs(tab) do
    if val == keymap.lhs then
      return keymap
    end
  end

  return nil
end

describe("AbbreviationsModule", function()
  local expected_mixups = require("tests.hand-side-fix.expected-mixups")

  for layout, layout_mixups in pairs(expected_mixups) do
    for language, language_mixups in pairs(layout_mixups) do
      it("should set expected keymaps for " .. language .. " in " .. layout, function()
        abbreviations.init(language_mixups)
        local keymaps = vim.api.nvim_buf_get_keymap(0, "ia")
        for _, wrong_words in pairs(language_mixups) do
          for _, wrong_word in pairs(wrong_words) do
            assert(keymaps_find_abbreviation(keymaps, wrong_word))
          end
        end
      end)
    end
  end
end)
