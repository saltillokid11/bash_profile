# For more prompt coolness, check out Halloween Bash:
# http://xta.github.io/HalloweenBash/

# Environment Variables
# =====================
  # Library Paths

    # NODE_PATH
    export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"

  # Configurations

    # GIT_MERGE_AUTO_EDIT
    # This variable configures git to not require a message when you merge.
    export GIT_MERGE_AUTOEDIT='no'

    # Editors
    # Tells your shell that when a program requires various editors, use sublime.
    # The -w flag tells your shell to wait until sublime exits
    export VISUAL="subl -w"
    export SVN_EDITOR="subl -w"
    export GIT_EDITOR="subl -w"
    export EDITOR="subl -w"

    # Version
    # What version of the Flatiron School bash profile this is
    export FLATIRON_VERSION='1.1.1'
  # Paths

    export USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin"

    # Read http://blog.seldomatt.com/blog/2012/10/08/bash-and-the-one-true-path/ for more on that.
    export PATH="$USR_PATHS:$PATH"

    # If you go into your shell and type: echo $PATH you will see the output of your current path.
    # For example, mine is:
    # /Users/avi/.rvm/gems/ruby-1.9.3-p392/bin:/Users/avi/.rvm/gems/ruby-1.9.3-p392@global/bin:/Users/avi/.rvm/rubies/ruby-1.9.3-p392/bin:/Users/avi/.rvm/bin:/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/local/mysql/bin:/usr/local/share/python:/bin:/usr/sbin:/sbin:

# Helpful Functions
# =====================


makeBBP() {
   local blippName=$1;
   if [[ -z $blippName ]]; then
       blippName="main";
   fi
   mkdir -p $blippName/{assets/$blippName/_src/library,assets/$blippName/_src/exports,assets/$blippName/_src/includes,markers,xml,src};
   touch $blippName/assets/$blippName/_src/$blippName.blp;
   touch $blippName/assets/$blippName/_src/includes/actions.inc.blp;
   touch $blippName/assets/$blippName/_src/includes/animations.inc.blp;
   touch $blippName/assets/$blippName/_src/includes/classes.inc.blp;
   touch $blippName/assets/$blippName/_src/includes/functions.inc.blp;
   touch $blippName/assets/$blippName/_src/includes/lights.inc.blp;
   touch $blippName/assets/$blippName/_src/includes/materials.inc.blp;
   touch $blippName/assets/$blippName/_src/includes/models.inc.blp;
}

makeBlipp() {
   local blippName=$1;
   if [[ -z $blippName ]]; then
       blippName="main";
   fi
   mkdir -p $blippName/markers;
   mkdir -p $blippName/blipp/{assets,javascript};
   cp /Users/tanner/BLP_JS_TEMPLATE/package.json $blippName/blipp/javascript/package.json
   cp /Users/tanner/BLP_JS_TEMPLATE/main.js $blippName/blipp/javascript/main.js
   cp /Users/tanner/BLP_JS_TEMPLATE/utils.js $blippName/blipp/javascript/utils.js
}

boxx() {
	cd ~/Box\ Sync/Global\ Departments/Production/Dev\ Projects/tanner/
	pwd
}

tel() {
	local ipaddress=$1;
	if [[ -z $ipaddress ]]; then
       echo "empty address";
   	fi
   	telnet 10.135.140.$ipaddress 23
   	# echo ip is 10.135.140.$ipaddress
}


# A function to extract correctly any archive based on extension
# USE: extract imazip.zip
#      extract imatar.tar
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Aliases
# =====================
  # LS
  alias l='ls -lah'
  alias lsp='sudo lsof -i -n -P | grep LISTEN'
  alias ls='ls -G'
  export CLICOLOR=1
  export LSCOLORS=Gxfxcxdxbxegedabagacad

  # Git
  alias gcl="git clone"
  alias gst="git status"
  alias gl="git pull"
  alias gp="git push"
  alias gd="git diff | mate"
  alias gc="git commit -v"
  alias gca="git commit -v -a"
  alias gb="git branch"
  alias gba="git branch -a"
  alias gcam="git commit -am"
  alias gbb="git branch -b"
  
  alias speedtest='curl -o /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'

# Case-Insensitive Auto Completion
  bind "set completion-ignore-case on"

# Postgres
export PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH

# Final Configurations and Plugins
# =====================
  # Git Bash Completion
  # Will activate bash git completion if installed
  # via homebrew
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi


  # RVM
  # Mandatory loading of RVM into the shell
  # This must be the last line of your bash_profile always
  #SOLORIZED
  # Add Homebrew `/usr/local/bin` and User `~/bin` to the `$PATH`
  PATH=/usr/local/bin:$PATH
  PATH=$HOME/bin:$PATH
  export PATH

  # Load the shell dotfiles, and then some:
  # * ~/.path can be used to extend `$PATH`.
  # * ~/.extra can be used for other settings you don’t want to commit.
  for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && source "$file"
  done
  unset file
# export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
