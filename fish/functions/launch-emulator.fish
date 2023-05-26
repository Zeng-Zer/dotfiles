function emulator
  ~/Library/Android/sdk/emulator/emulator $argv
end

function launch-emulator
  if count $argv > /dev/null
    emulator -avd $argv[1]
  else
    set -l selected (emulator -list-avds | head -1)
    emulator -avd $selected
  end
end
