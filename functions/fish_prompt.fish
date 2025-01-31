function _git_branch_name
    echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
    set -l blue (set_color blue)
    set -l green (set_color green)
    set -l red (set_color red)
    set -l normal (set_color normal)

    if [ (_git_branch_name) ]
        set git_info $green(_git_branch_name)
        set git_info ":$git_info"

        if [ (_is_git_dirty) ]
            set git_info $red(_git_branch_name)
            set git_info ":$git_info*"
        end
    end

    echo -n -s $blue(prompt_pwd) $git_info $normal ' ▹ '
end
