{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    globals = {
      mapleader = " ";
    };

    opts = {
      guicursor = "";

      number = true;
      relativenumber = true;

      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>.";
        action.__raw = "require('telescope.builtin').find_files";
        options = {
          desc = "Find files";
          silent = true;
        };
      }
    ];

    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = true;
	      settings = {
          sources = [
            { name = "buffer"; }
            { name = "luasnip"; }
            { name = "nvim_lsp"; }
            { name = "path"; }
	        ];
	        snippet.expand = ''
            function (args)
              require('luasnip').lsp_expand(args.body)
	          end
	        '';
          preselect = "\"none\"";
          mapping = {
            "<CR>".__raw =''
              cmp.mapping({
                i = function(fallback)
                  if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                  else
                    fallback()
                  end
                end,
                s = cmp.mapping.confirm({ select = true }),
                c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
              })
            '';
            "<Tab>".__raw = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                  require("luasnip").expand_or_jump()
                else
                  fallback()
                end
              end, {'i', 's'})
            '';
            "<S-Tab>".__raw = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif require("luasnip").expand_or_jumpable() then
                  require("luasnip").jump(-1)
                else
                  fallback()
                end 
              end, {'i', 's'})
            '';
            "<C-e>".__raw = "cmp.mapping.abort()";
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      luasnip.enable = true;
      cmp_luasnip.enable = true;
      # friendly-snippets.enable = true;

      indent-blankline.enable = true;

      lsp = {
        enable = true;
	      servers = {
          clangd.enable = true;    # C
          jdtls.enable = true;     # Java
          ts_ls.enable = true;     # Javascript/Typescript
          lua_ls.enable = true;    # Lua
          nil_ls.enable = true;    # Nix
          pyright.enable = true;   # Python
        };
      };

      lualine.enable = true;

      # mini = {
      #   enable = true;
      #   modules = {
      #     base16 = {};
      #   };
      # };

      telescope = {
        enable = true;
      };

      treesitter = {
        enable = true;
        settings = {
          auto_install = true;
          highlight = {
            enable = true;
            additional_vim_regex_highlighting = false;
          };
        };
      };

      web-devicons.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      # mini-base16 # needed for stylix
    ];

    colorschemes.onedark.enable = true;
  };

  stylix.targets.nixvim.enable = false;
}
