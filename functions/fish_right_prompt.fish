function _is_git_repo
  echo ([ -d .git ] && echo .git || git rev-parse --git-dir > /dev/null 2>&1)
end

function _git_user_email
  echo (command git config --get user.email)
end

function fish_right_prompt
  set -l blue (set_color blue)
  set -l normal (set_color normal)

  if [ (_is_git_repo) ]
    set git_user_email $blue(_git_user_email)
    echo -n -s $normal '<' $git_user_email $normal '>'
  end
end
