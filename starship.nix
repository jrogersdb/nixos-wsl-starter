{
  # Basic settings
  format = ''
    [╭](fg:current_line)\
    $os\
    $status\
    $directory\
    $git_branch\
    $git_status\
    $fill\
    $golang\
    $nodejs\
    $bun\
    $deno\
    $python\
    $java\
    $zig\
    $rust\
    $c\
    $cmd_duration\
    $time\
    $username\
    $line_break\
    $character\
  '';

  add_newline = true;

  # Module configurations
  os = {
    format = "(fg:current_line)[](fg:red)[](fg:primary bg:red)[](fg:red)(fg:current_line)[](fg:red)[](fg:primary bg:red)[](fg:red)";
    disabled = false;
  };

  status = {
    format = "[─](fg:current_line)[](fg:status)[](fg:primary bg:status)[](fg:status bg:box)[ $status](fg:foreground bg:box)[](fg:box)[─](fg:current_line)[](fg:status)[](fg:primary bg:status)[](fg:status bg:box)[ $status](fg:foreground bg:box)[](fg:box)";
    pipestatus = true;
    pipestatus_separator = "-";
    pipestatus_segment_format = "$status";
    pipestatus_format = "[─](fg:current_line)[](fg:status)[](fg:primary bg:status)[](fg:status bg:box)[ $pipestatus](fg:foreground bg:box)[](fg:box)";
    disabled = false;
  };

  directory = {
    format = "[─](fg:current_line)[](fg:pink)[󰷏](fg:primary bg:pink)[](fg:pink bg:box)[ $read_only$truncation_symbol$path](fg:foreground bg:box)[](fg:box)[─](fg:current_line)[](fg:pink)[󰷏](fg:primary bg:pink)[](fg:pink bg:box)[ $read_only$truncation_symbol$path](fg:foreground bg:box)[](fg:box)";
    home_symbol = " ~/";
    truncation_symbol = "  ";
    truncation_length = 2;
    read_only = "󱧵 ";
    read_only_style = "";
  };

  git_branch = {
    format = "[─](fg:current_line)[](fg:green)[$symbol](fg:primary bg:green)[](fg:green bg:box)[ $branch](fg:foreground bg:box)";
    symbol = "";
  };

  git_status = {
    format = "[$all_status](fg:green bg:box)[](fg:box)";
    conflicted = " =";
    up_to_date = "";
    untracked = " ?$\{count}";
    stashed = " $";
    modified = " !$\{count}";
    staged = " +";
    renamed = " »";
    deleted = " ✘";
    ahead = " ⇡$\{count}";
    diverged = " ⇕⇡$\{ahead_count}⇣$\{behind_count}";
    behind = " ⇣$\{count}";
  };

  nodejs = {
    format = "[─](fg:current_line)[](fg:green)[$symbol](fg:primary bg:green)[](fg:green bg:box)[ $version](fg:foreground bg:box)[](fg:box)[─](fg:current_line)[](fg:green)[$symbol](fg:primary bg:green)[](fg:green bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
    symbol = "󰎙 Node.js";
  };

  bun = {
    format = "[─](fg:current_line)[](fg:green)[$symbol](fg:primary bg:green)[](fg:green bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
    symbol = " Bun";
  };

  deno = {
    format = "[─](fg:current_line)[](fg:purple)[$symbol](fg:primary bg:purple)[](fg:purple bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
    symbol = "🦕 Deno";
  };

  zig = {
    format = "[─](fg:current_line)[](fg:blue)[$symbol](fg:primary bg:blue)[](fg:blue bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
    symbol = "⚡️ Zig";
  };

  rust = {
    format = "[─](fg:current_line)[](fg:yellow)[$symbol](fg:primary bg:yellow)[](fg:yellow bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
    symbol = " Rust";
  };

  python = {
    format = "[─](fg:current_line)[](fg:green)[$symbol](fg:primary bg:green)[](fg:green bg:box)[ (${version} )(\($virtualenv\) )](fg:foreground bg:box)[](fg:box)";
    symbol = " python";
  };

  java = {
    format = "[─](fg:current_line)[](fg:red)[$symbol](fg:primary bg:red)[](fg:red bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
    symbol = " Java";
  };

  golang = {
    format = "[─](fg:current_line)[](fg:red)[$symbol](fg:primary bg:red)[](fg:red bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
    symbol = "󰑮 Go";
  };

  c = {
    format = "[─](fg:current_line)[](fg:blue)[$symbol](fg:primary bg:blue)[](fg:blue bg:box)[ $version](fg:foreground bg:box)[](fg:box)";
    symbol = " C";
  };

  fill = {
    symbol = "─";
    style = "fg:current_line";
  };

  cmd_duration = {
    min_time = 500;
    format = "[─](fg:current_line)[](fg:orange)[](fg:primary bg:orange)[](fg:orange bg:box)[ $duration](fg:foreground bg:box)[](fg:box)";
  };

  time = {
    format = "[─](fg:current_line)[](fg:purple)[󰦖](fg:primary bg:purple)[](fg:purple bg:box)[ $time](fg:foreground bg:box)[](fg:box)";
    time_format = "%H:%M";
    disabled = false;
  };

  username = {
    format = "[─](fg:current_line)[](fg:yellow)[$symbol](fg:primary bg:yellow)[](fg:yellow bg:box)[ $user](fg:foreground bg:box)[](fg:box)";
    symbol = "󰇼";
    show_always = true;
  };

  character = {
    format = "\n[╰─$symbol](fg:current_line) ";
    success_symbol = "[](fg:bold white)";
    error_symbol = "[×](fg:bold red)";
  };

  profiles.transient = "$character";
}