# Development tools and configuration
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Development tools
    neovim
    opencode
    tmux
    lazygit
    
    # Languages and tools
    go
    python3
    uv
    nodejs
    
    # # LaTeX and document processing tools
    # # TeX Live with medium scheme and essential packages
    # (texlive.combine {
    #   inherit (texlive) scheme-medium
    #     collection-latexextra    # Most commonly used LaTeX packages
    #     collection-fontsrecommended
    #     collection-mathscience   # Math and science packages
    #     latexmk                  # Build tool for LaTeX documents
    #     latexdiff                # Tool for marking up differences between LaTeX files
    #     biber                    # BibTeX replacement
    #     biblatex                 # Sophisticated bibliographies
    #     minted                   # For syntax highlighting in code listings
    #   ;
    # })
    
    # # Supporting tools for LaTeX
    # python3Packages.pygments     # For minted package (code highlighting)
    # ghostscript                  # For PDF processing
    # pandoc                       # Universal document converter
    # texlab                       # LaTeX language server
  ];
  
  # Docker support moved to system/services/docker.nix
}