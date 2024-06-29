local ls = require("luasnip")
local extras = require("luasnip.extras")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = extras.rep
local f = ls.function_node
local l = extras.lambda
local dl = extras.dynamic_lambda

ls.add_snippets("all", {
  s("clg", fmt("console.log({});", { i(0) })),
  s("cld", fmt("console.log(\"{}:\", {});", { i(1), rep(1) })),
  s("cdr", fmt("console.dir({});", { i(0) })),
  s("cer", fmt("console.err({});", { i(0) })),
  s("fna", fmt("const {} = ({}){} => {{\n\t{}\n}};", { i(1), i(2), i(3), i(0) })),
  s("ust", fmt("const [{}, set{}] = useState<{}>({});", { i(1), f(function(var_name)
    return (string.gsub(var_name[1][1], "^%l", string.upper))
  end, { 1 }), i(2), i(0) })),
  s("uef", fmt("useEffect(() => {{\n\t{}\n}}, [{}]);", { i(0), i(1) })),
})

ls.add_snippets("typescriptreact", {
  s("rfce",
    fmt("const {} = () => {{\n\treturn (\n\t\t<div>{}</div>\n\t);\n}};\n\nexport default {};",
      { dl(1, l.TM_FILENAME:gsub(".tsx", "")), rep(1), rep(1) })),
  s("rfc",
    fmt("export const {} = () => {{\n\treturn (\n\t\t<div>{}</div>\n\t);\n}};",
      { dl(1, l.TM_FILENAME:gsub(".tsx", "")), rep(1) }))
})
