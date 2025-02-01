{ pkgs, ... }:
let 
  hostOS = if pkgs.stdenv.isLinux then "linux"
           else if pkgs.stdenv.isDarwin then "darwin"
           else "something else";
in
{
  os = hostOS;

  homeDirectory = if hostOS == "linux" then "/home/gkhan" 
                  else if hostOS == "darwin" then "/Users/gkhan"
	          else "Something else";
}
