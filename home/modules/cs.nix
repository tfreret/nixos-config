# C/C++ development environment
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang
    llvm
    lldb
    cmake
    ninja
    pkg-config
  ];
}
