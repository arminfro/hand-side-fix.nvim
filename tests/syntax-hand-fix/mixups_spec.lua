local mixups_mod = require("syntax-hand-fix.mixups")
local utils = require("syntax-hand-fix.utils")
require("syntax-hand-fix.utils")

local expected_mixups = require("tests.syntax-hand-fix.expected_mixups")

describe("MixupsModule", function()
  for layout, expected_mixups_per_layout in pairs(expected_mixups) do
    for language, expected_mixups_per_lang in pairs(expected_mixups_per_layout) do
      it("should return expected_mixups based on hand sides for " .. language .. " in " .. layout, function()
        local mixups = mixups_mod.get(layout, language)
        for keyword, expected_mixups_list in pairs(expected_mixups_per_lang) do
          if #expected_mixups_list > 0 then
            local is_keyword_present = mixups[keyword] ~= nil
            assert.is_true(is_keyword_present)
            local allPresent = is_keyword_present
            for _, mixup in ipairs(expected_mixups_list) do
              local isValuePresent = utils.has_value(mixups[keyword], mixup)
              allPresent = allPresent and isValuePresent
              if not allPresent then
                print("Failing mixups for " .. language .. " in layout " .. layout .. "=" .. vim.inspect(mixups))
              end
              assert.is_true(isValuePresent)
            end
          else
            assert.is_true(mixups[keyword] == nil)
          end
        end
      end)
    end
  end
end)
