{ config, pkgs, ...}:

{
  programs.bash.shellAliases = {
    vim="nvim";
    yt-dlp="yt-dlp -format='bestvideo[height<=?1080][fps<=?30][vcodec!=?vp9]+bestaudio/best'";
    pf="peerflix --mpv --remove --list";
  };
}
