-- General purpose linters
return {
  'mfussenegger/nvim-lint',
  event = 'BufWritePost',
  config = function ()
    require('lint').linters_by_ft = {
      python = {
        'pylint',
      }
    }

    -- Automatically run linters after saving.
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      -- Only run linter for the following extensions
      pattern = { "*.py", "*.ts", "*.js", "*.tsx", "*.jsx" },
      callback = function()
        require("lint").try_lint()
      end,
    })
  end
}
