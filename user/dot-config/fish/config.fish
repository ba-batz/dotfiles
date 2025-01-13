set -U fish_greeting
set -U fish_user_paths $HOME/.local/bin
abbr mew 'kitty +kitten ssh admin@192.168.1.9'
abbr wol 'for i in (seq 200); wol --ipaddr=192.168.1.2 --port=9 --wait=3000 40:61:86:01:bc:38; end'
abbr vps 'kitty +kitten ssh batz@85.215.147.32'
abbr dit 'cd ~/.var/dotfile'
abbr psh 'git add . && git commit -a && git push'
abbr pul 'git pull'
abbr dlc 'sudo rm -r /var/cache && sudo rm -r ~/.cache'
abbr bup 'bluetoothctl connect E0:EB:40:41:9B:2B'
