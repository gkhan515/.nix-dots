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
      indent-blankline.enable = true;

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

    # extraPlugins = with pkgs.vimPlugins; [
    #   # mini-base16 # needed for stylix
    # ];
    
    colorschemes.onedark.enable = true;
  };

  stylix.targets.nixvim.enable = false;
}
