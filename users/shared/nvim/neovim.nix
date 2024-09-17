{pkgs, ...}:
{

  programs.neovim = let
    toLua = str: "lua << EOF\n${str}\nEOF\n"; 
    luaFile = file: "lua << EOF\n${pkgs.lib.readFile file}\nEOF\n"; 

  in {
	enable = true;
	defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
            #nvim-treesitter.withAllGrammars
            nvim-cmp
	     cmp-nvim-lsp
	     rust-tools-nvim
	     nvim-comment
            {
                plugin = headlines-nvim;
                config = toLua ''require("headlines").setup()'';
            }
            {
                plugin = neo-tree-nvim;
                config = toLua ''require("neo-tree").setup()'';
            }
        	{
               plugin =  nvim-lspconfig;
               config = luaFile ./plugin/lsp.lua;
            }
          #  nvim-treesitter.withAllGrammars
            {
                plugin = (nvim-treesitter.withPlugins(p:[

                    p.tree-sitter-nix
                    p.tree-sitter-lua
                    p.tree-sitter-bash
                    p.tree-sitter-rust
                    p.tree-sitter-vimdoc
                   # nvim-treesitter.withAllGrammars
                ]));
                config = luaFile ./plugin/treesitter.lua;
            }
            {
               plugin = comment-nvim;
               config = toLua ''require("nvim_comment").setup()'';
            }
            {
                plugin = telescope-nvim;
                config = luaFile ./plugin/telescope.lua;
            }
            {
               plugin = lualine-nvim;
               config = toLua ''require("lualine").setup()'';
            }

            dracula-nvim
            nvim-snippy
            nvim-dap
            nvim-dap-ui
            plenary-nvim
            {
                plugin = harpoon;
                config = luaFile ./plugin/harpoon.lua;
            }
          #  telescope-fzf-native-nvim
            luasnip
         #   friendly-snippets
        #    vim-nix
            

    ];
    extraPackages = with pkgs; [
        xclip
        wl-clipboard
        luajitPackages.lua-lsp
        nixd

   ];
   extraLuaConfig =''

     ${pkgs.lib.readFile ./lua/nick/remap.lua  } 
     ${pkgs.lib.readFile ./lua/nick/set.lua  } 
     ${pkgs.lib.readFile ./lua/nick/colors.lua  } 
   '';
	#configure = {
	#  packages.myVimPackage = with pkgs.vimPlugins; {
     # 		start = [
	#	      plenary-nvim
	#	      gruvbox-material
	#	      mini-nvim
	#		];
	 #       };
	#};
    };
}
