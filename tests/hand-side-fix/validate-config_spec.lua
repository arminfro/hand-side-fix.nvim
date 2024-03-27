local validator = require("hand-side-fix.config-validator")
local default_config = require("hand-side-fix").config

local test_validator = function(config, valid_expectation, error_msg_expectation)
  local is_valid, error_msg = validator.validate(vim.tbl_deep_extend("force", default_config, config))
  if valid_expectation then
    assert(is_valid)
  else
    assert.is_false(is_valid)
  end

  assert.are.same(error_msg, error_msg_expectation)
  if error_msg ~= error_msg_expectation then
    print("error_msg:" .. error_msg)
    print("error_msg_expectation: " .. error_msg_expectation)
  end
end

describe("ValidateConfigModule", function()
  it("should pass on readme config and on no options at all", function()
    local valid_config = {
      layout = "us",
      excludes = { "fi" },
      custom_keywords = {
        {
          pattern = "*.md",
          keywords = { "the", "of" },
        },
      },
    }
    test_validator(valid_config, true, "")
    valid_config.excludes = nil
    test_validator(valid_config, true, "")
    valid_config.custom_keywords = nil
    test_validator(valid_config, true, "")
    valid_config.layout = nil
    test_validator(valid_config, true, "")
  end)

  it("should pass on valid layout", function()
    test_validator({ layout = "us" }, true, "")
    test_validator({ layout = "de" }, true, "")
  end)

  it("should fail with invalid layout", function()
    test_validator({ layout = "uus" }, false, validator.layout_value_error_msg("uus"))
    test_validator({ layout = 1 }, false, validator.layout_type_error_msg)
    test_validator({ layout = function() end }, false, validator.layout_type_error_msg)
  end)

  it("should pass on valid excludes", function()
    test_validator({ excludes = {} }, true, "")
    test_validator({ excludes = { "fi", "if" } }, true, "")
  end)

  it("should fail with invalid excludes", function()
    test_validator({ excludes = { {} } }, false, validator.excludes_error_msg)
    test_validator({ excludes = { 1, 2 } }, false, validator.excludes_error_msg)
    test_validator({ excludes = { function() end } }, false, validator.excludes_error_msg)
  end)

  it("should pass on valid custom_keywords", function()
    test_validator({ custom_keywords = {} }, true, "")
    test_validator({ custom_keywords = { {
      pattern = "*",
      keywords = { "if" },
    } } }, true, "")
  end)

  it("should pass with valid custom_keywords", function()
    it("and pattern", function()
      test_validator({ custom_keywords = { { pattern = "*", keywords = {} } } }, true, "")
      test_validator({ custom_keywords = { { pattern = { "*", "*.lua" }, keywords = { "if" } } } }, true, "")
    end)
    it("and keywords", function()
      test_validator({ custom_keywords = { { pattern = "*", keywords = {} } } }, true, "")
      test_validator({ custom_keywords = { { pattern = "*", keywords = {} } } }, true, "")
    end)
  end)

  it("should fail with invalid custom_keywords", function()
    test_validator(
      { custom_keywords = { pattern = "", keywords = {} } },
      false,
      validator.custom_keywords_array_error_msg
    )
    it("and pattern", function()
      local error_msg = table.concat({ validator.custom_keywords_error_msg(1), validator.pattern_error_msg }, ". ")
      test_validator({ custom_keywords = { { pattern = { 1, 2 }, keywords = {} } } }, false, error_msg)
      test_validator({ custom_keywords = { { pattern = function() end, keywords = {} } } }, false, error_msg)
    end)

    it("and keywords", function()
      local error_msg = table.concat({ validator.custom_keywords_error_msg(1), validator.keywords_error_msg }, ". ")
      test_validator({ custom_keywords = { { keywords = { 1, 2 }, pattern = "*" } } }, false, error_msg)
      test_validator({ custom_keywords = { { keywords = function() end, pattern = "*" } } }, false, error_msg)
    end)
  end)
end)
