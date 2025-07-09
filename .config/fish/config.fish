# Fish configuration
#
# Copyright(C) OctHe
#
# Plugin manager is fisher.
# Install fisher:
#   curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

if status is-interactive
    if test -e $__fish_config_dir/functions/fisher.fish
        if not test -e $__fish_config_dir/conf.d/done.fish
            fisher install franciscolourenco/done
        end
        if not test -e $__fish_config_dir/functions/spark.fish
            fisher install jorgebucaran/fish-spark
        end
        if not test -e $__fish_config_dir/functions/fishtape.fish
            fisher install jorgebucaran/fish-tape
        end
        if not test -e $__fish_config_dir/functions/mock.fish
            fisher install matchai/fish-mock
        end
        if not test -e $__fish_config_dir/functions/bass.fish
            fisher install edc/bass
        end
        if not test -e $__fish_config_dir/conf.d/plugin-bang-bang.fish
            fisher install oh-my-fish/plugin-bang-bang
        end
    end
end

alias ice "/usr/bin/git --git-dir=$HOME/.ice/ --work-tree=$HOME"
alias slim "vim -u ~/.config/slim/vimrc"
