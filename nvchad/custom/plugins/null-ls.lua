local present, null_ls = pcall(require, "null-ls")


if not present then
  return
end


local b = null_ls.builtins


local sources = {

  -- python
  b.diagnostics.pylint.with({
    diagnostics_postprocess = function(diagnostic)
      diagnostic.code = diagnostic.message_id
    end,
  }),
  b.diagnostics.flake8,
  b.diagnostics.pyproject_flake8,
  b.formatting.isort,
  b.formatting.black,

  -- markdown and config
  b.diagnostics.markdownlint,
  b.diagnostics.rstcheck,
  b.formatting.taplo,

  -- Lua
  b.diagnostics.luacheck,
  b.formatting.stylua,

  -- webdev stuff
  b.formatting.deno_fmt, -- deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- c & cpp
  b.diagnostics.clang_check,
  b.formatting.clang_format,

  -- shell script
  b.diagnostics.fish,
  b.diagnostics.shellcheck,

}


null_ls.setup {
  debug = true,
  sources = sources,
}
