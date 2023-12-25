local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("all", {
  s("clg", fmt("console.log({});", { i(0) })),
  s("cdr", fmt("console.dir({});", { i(0) })),
  s("cer", fmt("console.err({});", { i(0) })),
  s("ust", fmt("const [{}, set{}] = useState<{}>({});", { i(1), rep(1), i(2), i(0) })),
  s("uef", fmt("useEffect(() => {{\n\t{}\n}}, [{}]);", { i(0), i(1) })),
})
