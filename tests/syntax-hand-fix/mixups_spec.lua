local mixups_mod = require("syntax-hand-fix.mixups")
local utils = require("syntax-hand-fix.utils")
require("syntax-hand-fix.utils")

local expected_mixups = require("tests.syntax-hand-fix.expected_mixups")

describe("mixups_mod.get", function()
  it("should return mixups for keywords based on hand sides, the layout and the language", function()
    for layout, expected_mixups_per_layout in pairs(expected_mixups) do
      for language, expected_mixups_per_lang in pairs(expected_mixups_per_layout) do
        local mixups = mixups_mod.get(layout, language)
        for keyword, expected_mixups_list in pairs(expected_mixups_per_lang) do
          if #expected_mixups_list > 0 then
            local is_keyword_present = mixups[keyword] ~= nil
            assert.is_true(is_keyword_present)
            local allPresent = is_keyword_present
            for _, mixup in ipairs(expected_mixups_list) do
              allPresent = allPresent and utils.has_value(mixups[keyword], mixup)
              if not allPresent then
                print("Failing mixups for " .. language .. " in layout " .. layout .. "=" .. vim.inspect(mixups))
              end
              assert.is_true(utils.has_value(mixups[keyword], mixup))
            end
          else
            assert.is_true(mixups[keyword] == nil)
          end
        end
      end
    end
  end)
end)
