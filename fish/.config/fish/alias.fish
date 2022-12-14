# apps... but better
alias vim=nvim
alias ls=exa
alias cat=bat
alias update-nvim-nightly="asdf uninstall neovim nightly && asdf install neovim nightly"
alias update-nvim-stable='asdf uninstall neovim stable && asdf install neovim stable'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

abbr -a reload exec fish

abbr -a v nvim
abbr -a l ls -la
abbr -a tree exa --tree
abbr -a h helix

# git
abbr -a gs  git status -sb
abbr -a ga  git add
abbr -a gc  git commit
abbr -a gcm git commit -m
abbr -a gca git commit --amend
abbr -a gcl git clone
abbr -a gco git checkout
abbr -a gp  git push
abbr -a gpl git pull
abbr -a gl  git l
abbr -a gd  git diff
abbr -a gds git diff --staged
abbr -a gr  git rebase -i HEAD~15
abbr -a gf  git fetch
abbr -a gfc git findcommit
abbr -a gfm git findmessage
abbr -a gco git checkout

function mkcd
	mkdir $argv[1]
	cd $argv[1]
end
