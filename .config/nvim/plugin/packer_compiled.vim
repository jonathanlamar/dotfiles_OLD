" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/jon/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/jon/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/jon/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/jon/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/jon/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  ["java-syntax.vim"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/java-syntax.vim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/nerdtree-git-plugin"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["python-snippets"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/python-snippets"
  },
  ["python-syntax"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/python-syntax"
  },
  tagbar = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-airline-themes"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-pydocstring"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-pydocstring"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-scala"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-scala"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-speeddating"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vscode-python-snippet-pack"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/vscode-python-snippet-pack"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/jon/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time("Defining packer_plugins", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
