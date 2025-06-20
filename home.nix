{
  # FIXME: uncomment the next line if you want to reference your GitHub/GitLab access tokens and other secrets
  secrets,
  pkgs,
  username,
  nix-index-database,
  inputs,
  ...
}: let
  unstable-packages = with pkgs.unstable; [
    # FIXME: select your core binaries that you always want on the bleeding-edge
    # bat
    #bottom
    amazon-q-cli
    coreutils
    curl
    du-dust
    fd
    findutils
    fx
    git
    git-crypt
    htop
    jq
    killall
    mosh
    mtr
    nmap
    procs
    ripgrep
    sd
    tree
    unzip
    vim
    wget
    zip
  ];

  stable-packages = with pkgs; [
    # FIXME: customize these stable packages to your liking for the languages that you use

    # FIXME: you can add plugins, change keymaps etc using (jeezyvim.nixvimExtend {})
    # https://github.com/LGUG2Z/JeezyVim#extending
    # jeezyvim
    # nix stuff
    nurl

    # key tools
    dig
    gh # for bootstrapping
    just
    openssl
    pinentry-tty
    traceroute

    # core languages
    go
    nodejs
    python3
    rustup

    # rust stuff
    cargo-cache
    cargo-expand

    # local dev stuf
    mkcert
    httpie

    # treesitter
    tree-sitter

    # language servers
    gopls
    nodePackages.vscode-langservers-extracted # html, css, json, eslint
    nodePackages.yaml-language-server
    nil # nix

    # formatters and linters
    alejandra # nix
    deadnix # nix
    golangci-lint
    nodePackages.prettier
    shellcheck
    shfmt
    statix # nix

    # fonts
    monaspace
    maple-mono.NF
  ];

  configs = import ./config { inherit pkgs; };

in {
  imports = [
    nix-index-database.hmModules.nix-index
    inputs.nix4nvchad.homeManagerModule
  ];

  home.stateVersion = "25.05";

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    sessionVariables.EDITOR = "nvim";
    # FIXME: set your preferred $SHELL
    sessionVariables.SHELL = "/etc/profiles/per-user/${username}/bin/fish";
  };

  home.packages =
    stable-packages
    ++ unstable-packages
    ++
    # FIXME: you can add anything else that doesn't fit into the above two lists in here
    [
      # pkgs.some-package
      # pkgs.unstable.some-other-package
    ];
  
  catppuccin = {
    enable = true;
    flavor = "mocha";
    helix = {
      enable = true;
      useItalics = true;
    };
    starship = {
      enable = false;
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      enableFishIntegration = true;
      pinentry = {
        program = "pinentry-tty";
        package = pkgs.pinentry-tty;
      };
    };
  };

  programs = {
    home-manager = {
      enable = true;
    };

    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };

    nix-index-database.comma.enable = true;

    nvchad = {
      enable = true;
      backup = false;
      neovim = pkgs.unstable.neovim;
      chadrcConfig = ''
        local M = {}
        M.base46 = {
          theme = "catppuccin"
        }
        M.nvdash = { load_on_startup = true }
        return M
      '';
    };

    qutebrowser = {
      enable = true;
    };

    brave = {
      enable = true;
    };

    ghostty = {
      enable = true;
    };

    kitty = {
      enable = true;
    };

    waveterm = {
      enable = true;
    };

    zathura = {
      enable = true;
    };

    zed-editor = {
      enable = true;
    };

    starship.enable = true;
    starship.settings = builtins.fromTOML (builtins.readFile "${configs.starship}/config/starship.toml");
    # starship.settings = {
    #   aws.disabled = true;
    #   gcloud.disabled = true;
    #   kubernetes.disabled = false;
    #   # git_branch.style = "242";
    #   directory.style = "blue";
    #   directory.truncate_to_repo = false;
    #   directory.truncation_length = 8;
    #   python.disabled = true;
    #   ruby.disabled = true;
    #   # hostname.ssh_only = false;
    #   hostname.style = "bold green";
    # };

    fzf = {
      enable = true;
      enableFishIntegration = true;
      # colors = {
      #   "bg+" = "#313244";
      #   "bg" = "#1E1E2E";
      #   "spinner" = "#F5E0DC";
      #   "hl" = "#F38BA8";
      #   "fg" = "#CDD6F4";
      #   "header" = "#F38BA8";
      #   "info" = "#CBA6F7";
      #   "pointer" = "#F5E0DC";
      #   "marker" = "#B4BEFE";
      #   "fg+" = "#CDD6F4";
      #   "prompt" = "#CBA6F7";
      #   "hl+" = "#F38BA8";
      #   "selected-bg" = "#45475A";
      #   "border" = "#313244";
      #   "label" = "#CDD6F4";
      # };
    };

    lsd = {
      enable = true;
      enableFishIntegration = true;
    };

    atuin = {
      enable = true;
      enableFishIntegration = true;
    };

    btop = {
      enable = true;
    };

    bottom = {
      enable = true;
    };

    helix = {
      enable = true;
      package = pkgs.unstable.helix;
    };

    zellij = {
      enable = true;
      enableFishIntegration = true;
      exitShellOnExit = true;
    };

    bat = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = ["--cmd cd"];
    };

    broot = {
      enable = true;
      enableFishIntegration = true;
    };

    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };

    navi = {
      enable = true;
      enableFishIntegration = true;
      package = pkgs.unstable.navi;
    };

    yazi = {
      enable = true;
      enableFishIntegration = true;
    };

    television = {
      enable = true;
      enableFishIntegration = true;
    };

    mise = {
      enable = true;
      enableFishIntegration = true;
    };

    mods = {
      enable = true;
      enableFishIntegration = true;
      package = pkgs.unstable.mods;
    };

    pay-respects = {
      enable = true;
      enableFishIntegration = true;
      package = pkgs.unstable.pay-respects;
    };

    tmux = {
      enable = true;
    };

    gh = {
      enable = true;
      gitCredentialHelper = { enable = true; };
    };

    lazygit = {
      enable = true;
    };

    gitui = {
      enable = true;
    };

    gpg = {
      enable = true;
    };

    git = {
      enable = true;
      package = pkgs.unstable.git;
      delta.enable = true;
      delta.options = {
        line-numbers = true;
        side-by-side = true;
        navigate = true;
      };
      userEmail = "jrogers@databank.com"; # FIXME: set your git email
      userName = "jrogersdb"; #FIXME: set your git username
      extraConfig = {
        # FIXME: uncomment the next lines if you want to be able to clone private https repos
        url = {
          "https://oauth2:${secrets.github_token}@github.com" = {
            insteadOf = "https://github.com";
          };
          # "https://oauth2:${secrets.gitlab_token}@gitlab.com" = {
          #   insteadOf = "https://gitlab.com";
          # };
        };
        push = {
          default = "current";
          autoSetupRemote = true;
        };
        merge = {
          conflictstyle = "diff3";
        };
        diff = {
          colorMoved = "default";
        };
      };
    };

    carapace = {
      enable = true;
      enableFishIntegration = true;
    };

    nushell = {
      enable = true;
    };

    # FIXME: This is my fish config - you can fiddle with it if you want
    fish = {
      enable = true;
      package = pkgs.unstable.fish;
      # FIXME: run 'scoop install win32yank' on Windows, then add this line with your Windows username to the bottom of interactiveShellInit
      # fish_add_path --append /mnt/c/Users/<Your Windows Username>/scoop/apps/win32yank/0.1.1
      # 
        # ${pkgs.lib.strings.fileContents (pkgs.fetchFromGitHub {
        #     owner = "rebelot";
        #     repo = "kanagawa.nvim";
        #     rev = "de7fb5f5de25ab45ec6039e33c80aeecc891dd92";
        #     sha256 = "sha256-f/CUR0vhMJ1sZgztmVTPvmsAgp0kjFov843Mabdzvqo=";
        #   }
        #   + "/extras/kanagawa.fish")}
      interactiveShellInit = ''
        ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-right | source

        set -U fish_greeting
      '';
      functions = {
        refresh = "source $HOME/.config/fish/config.fish";
        take = ''mkdir -p -- "$1" && cd -- "$1"'';
        ttake = "cd $(mktemp -d)";
        show_path = "echo $PATH | tr ' ' '\n'";
        posix-source = ''
          for i in (cat $argv)
            set arr (echo $i |tr = \n)
            set -gx $arr[1] $arr[2]
          end
        '';
      };
      shellAbbrs =
        {
          gc = "nix-collect-garbage --delete-old";
        }
        # navigation shortcuts
        // {
          ".." = "cd ..";
          "..." = "cd ../../";
          "...." = "cd ../../../";
          "....." = "cd ../../../../";
        }
        # git shortcuts
        // {
          gapa = "git add --patch";
          grpa = "git reset --patch";
          gst = "git status";
          gdh = "git diff HEAD";
          gp = "git push";
          gph = "git push -u origin HEAD";
          gco = "git checkout";
          gcob = "git checkout -b";
          gcm = "git checkout master";
          gcd = "git checkout develop";
          gsp = "git stash push -m";
          gsa = "git stash apply stash^{/";
          gsl = "git stash list";
        };
      shellAliases = {
        jvim = "nvim";
        lvim = "nvim";
        pbcopy = "/mnt/c/Windows/System32/clip.exe";
        pbpaste = "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -command 'Get-Clipboard'";
        explorer = "/mnt/c/Windows/explorer.exe";
        
        # To use code as the command, uncomment the line below. Be sure to replace [my-user] with your username. 
        # If your code binary is located elsewhere, adjust the path as needed.
        # code = "/mnt/c/Users/[my-user]/AppData/Local/Programs/'Microsoft VS Code'/bin/code";
      };
      plugins = [
        {
          inherit (pkgs.fishPlugins.autopair) src;
          name = "autopair";
        }
        {
          inherit (pkgs.fishPlugins.done) src;
          name = "done";
        }
        {
          inherit (pkgs.fishPlugins.sponge) src;
          name = "sponge";
        }
        {
          name = "fish-completions";
          src = pkgs.fetchFromGitHub {
            owner = "kidonng";
            repo = "completions.fish";
            rev = "a473ef6d03d8b8c11228c701f11600cd13a018b7";
            hash = "sha256-iDBbxX4SOX08xb121cbJqUwdJVIIgbVH38LywRCPAYg=";
          };
        }
      ];
    };
  };
}
