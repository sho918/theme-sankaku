function _git_user_email
  echo (command git config --get user.email | cut -d@ -f1)
end

function _awsume_profile
  echo (if set -q AWSUME_PROFILE; echo $AWSUME_PROFILE; else; echo 'N/A'; end)
end

function fish_right_prompt
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l normal (set_color normal)

  set info $normal $blue(_git_user_email) $normal ' | ' $green(_awsume_profile)
  echo -n -s $info
end
