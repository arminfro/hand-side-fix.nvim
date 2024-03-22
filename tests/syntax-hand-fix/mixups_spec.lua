local mixupsModule = require("syntax-hand-fix.mixups")
local utils = require("syntax-hand-fix.utils")
require("syntax-hand-fix.utils")

local expectedMixups = {
  us = {
    lua = {
      ["and"] = { "nad", "adn" },
      ["break"] = { "breka" },
      ["do"] = { "od" },
      ["else"] = { "lese", "esle" },
      ["elseif"] = { "leseif", "esleif", "elsief", "elsefi" },
      ["end"] = { "ned", "edn" },
      ["false"] = { "flase", "fasle" },
      ["for"] = { "ofr", "fro" },
      ["function"] = { "ufnction", "fucntion", "funtcion" },
      ["if"] = { "fi" },
      ["local"] = { "lcoal", "locla" },
      ["or"] = { "ro" },
      ["repeat"] = { "rpeeat", "reepat", "repeta" },
      ["return"] = { "rteurn", "retrun", "retunr" },
      ["then"] = { "tehn", "thne" },
      ["true"] = { "rtue", "ture", "treu" },
      ["while"] = { "hwile", "whiel" },
    },
  },
}

describe("get", function()
  it("should return mixups for keywords based on hand sides, the layout and the language", function()
    for layout, expectedMixupsPerLayout in pairs(expectedMixups) do
      for language, expectedMixupsPerLang in pairs(expectedMixupsPerLayout) do
        local mixups = mixupsModule.get(layout, language)

        for keyword, expectedMixupsList in pairs(expectedMixupsPerLang) do
          if #expectedMixupsList > 0 then
            assert.is_true(mixups[keyword] ~= nil)
            for _, mixup in ipairs(expectedMixupsList) do
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
