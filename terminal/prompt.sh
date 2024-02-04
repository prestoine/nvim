# ~/.config/nvim/terminal/prompt.sh

# Function to customize command prompt
get_prompt_path() {
  # Get the current working directory
  local cwd=$(pwd)
  # Use 'basename' to get the current folder name
  local current_folder=$(basename "$cwd")
  # Use 'dirname' and 'basename' to get the parent folder name
  local parent_folder=$(basename "$(dirname "$cwd")")

  # Combine the parent folder and current folder names
  # Check if we're in the home directory to avoid displaying '~' as the parent folder
  if [ "$parent_folder" = "~" ] || [ "$parent_folder" = "/" ]; then
    echo "$current_folder"
  else
    echo "$parent_folder/$current_folder"
  fi
}

# Customize the command prompt
export PS1="
\[$(tput bold)\]\[$(tput setaf 2)\][\A]\[$(tput sgr0)\] "  # Time in green
export PS1+="\[$(tput setaf 6)\]\u@\h\[$(tput sgr0)\] "    # Username and host in cyan
export PS1+="\[$(tput setaf 5)\]\$(get_prompt_path)\[$(tput sgr0)\] "  # Directory path in purple
export PS1+="\n\[$(tput setaf 3)\]😜 \[$(tput sgr0)\]"    # Winking emoji on new line in yellow
export PS1+="\[$(tput setaf 4)\]>\[$(tput sgr0)\] "       # Prompt symbol '>' in blue

