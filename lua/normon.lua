function ExactSearch(query)
    query = vim.fn.substitute(query, "\\", "\\\\\\\\", "g")
    query = vim.fn.substitute(query, "/", "\\\\/", "g")
    return "\\C\\V" .. query
end

function NormOnSelection()
    local zRegister = vim.fn.getreg("z")
    vim.cmd.norm("\"zy")
    local selection = vim.fn.getreg("z")
    vim.fn.setreg("z", zRegister)
    local search = ExactSearch(selection)
    vim.fn.setreg("/", search)
    vim.o.hlsearch = true
end

function NormOnWord()
    vim.cmd.norm("\"_yiw")
    local word = vim.fn.expand("<cword>")
    local search = "\\C\\V\\<" .. word .. "\\>"
    vim.fn.setreg("/", search)
    vim.o.hlsearch = true
end

function NormOn(callback, command, opts)
    callback()

    if opts.backward then
        vim.cmd.let("v:searchforward = 0")
    else
        vim.cmd.let("v:searchforward = 1")
    end

    vim.fn.feedkeys(command)

    if opts.clearSearch then
        vim.fn.feedkeys(":echon\n")
    end
end

return function(key, command, opts)
    if opts == nil then opts = {} end
    vim.keymap.set("v", key, function()
        NormOn(NormOnSelection, command, opts)
    end)
    vim.keymap.set("n", key, function()
        NormOn(NormOnWord, command, opts)
    end)
end

