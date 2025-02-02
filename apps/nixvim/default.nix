{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    opts = {
      number = true;
      relativenumber = true;
    };

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
	  preselect = "none";
	  mapping = {
	    "<CR>" = "cmp.mapping.confirm({ select = true })";
	    "<C-e>" = "cmp.mapping.abort()";
	    "<Tab>" = ''
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
	    "<S-Tab>" = ''
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
    };

    extraPlugins = with pkgs.vimPlugins; [
      # mini-base16 # needed for stylix
    ];

    colorschemes.onedark.enable = true;
  };

  stylix.targets.nixvim.enable = false;
}
