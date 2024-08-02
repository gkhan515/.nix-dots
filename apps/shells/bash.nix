{ config, pkgs, ...}:

{
  programs.bash = {

    enable = true;

    shellAliases = {
      vim="nvim";
      yt-dlp="yt-dlp -f \"bestvideo[height<=?1080][fps<=?30][vcodec!=vp9]+bestaudio\"";
      pf="peerflix --mpv --remove --list";
    };
  };
}
