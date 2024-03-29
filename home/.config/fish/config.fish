if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr ssh 'kitty +kitten ssh'
abbr mew 'kitty +kitten ssh admin@192.168.1.2'
abbr wol 'for i in (seq 200); wol --ipaddr=192.168.1.2 --port=9 --wait=3000 40:61:86:01:bc:38; end'
abbr vps 'kitty +kitten ssh batz@85.215.147.32'
abbr dit 'cd ~/.var/dotfile'
abbr psh 'git add . && git commit -a && git push'
abbr pul 'git pull'
