# LaTeX environment
{ pkgs, ... }:

{
  # LaTeX-related packages
  home.packages = with pkgs; [
    # TeX Live distribution with recommended packages
    texlive.combined.scheme-full
    
    # Additional LaTeX tools
    latexmk      # Build tool
    texlab       # LaTeX language server
  ];
  
  # VSCode LaTeX Workshop settings
  programs.vscode.userSettings = {
    # LaTeX Workshop configuration
    "latex-workshop.latex.recipes" = [
      {
        "name" = "latexmk";
        "tools" = [ "latexmk" ];
      }
      {
        "name" = "pdflatex -> bibtex -> pdflatex x2";
        "tools" = [ "pdflatex" "bibtex" "pdflatex" "pdflatex" ];
      }
    ];
    
    # Ensure VSCode Server finds our LaTeX tools in Nix
    "latex-workshop.latex.path" = ""; # Use PATH to find LaTeX binaries
    
    "latex-workshop.latex.tools" = [
      {
        "name" = "latexmk";
        "command" = "latexmk";
        "args" = [
          "-synctex=1"
          "-interaction=nonstopmode"
          "-file-line-error"
          "-pdf"
          "%DOC%"
        ];
      }
      {
        "name" = "pdflatex";
        "command" = "pdflatex";
        "args" = [
          "-synctex=1"
          "-interaction=nonstopmode"
          "-file-line-error"
          "%DOC%"
        ];
      }
      {
        "name" = "bibtex";
        "command" = "bibtex";
        "args" = [
          "%DOCFILE%"
        ];
      }
    ];
    
    # Viewer settings
    "latex-workshop.view.pdf.viewer" = "tab";
    "latex-workshop.view.pdf.external.viewer.command" = "";
    "latex-workshop.view.pdf.external.viewer.args" = [];
    
    # Synctex support
    "latex-workshop.view.pdf.internal.synctex.keybinding" = "double-click";
    
    # Auto build on save
    "latex-workshop.latex.autoBuild.run" = "onSave";
    
    # Clean auxiliary files after build
    "latex-workshop.latex.autoClean.run" = "onBuilt";
    "latex-workshop.latex.clean.fileTypes" = [
      "*.aux" "*.bbl" "*.blg" "*.idx" "*.ind" "*.lof" "*.lot" "*.out" "*.toc" "*.acn" 
      "*.acr" "*.alg" "*.glg" "*.glo" "*.gls" "*.fls" "*.log" "*.fdb_latexmk" "*.snm" "*.nav" "*.vrb"
    ];
    
    # Enable hover preview and intellisense
    "latex-workshop.hover.preview.enabled" = true;
    "latex-workshop.intellisense.package.enabled" = true;
    "latex-workshop.texlab.path" = "texlab";
  };
}