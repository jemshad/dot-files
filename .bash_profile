# .bash_profile

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# gcloud path file
gpath_file="/snap/google-cloud-sdk/current/path.bash.inc"
gcompletion_file="/snap/google-cloud-sdk/current/completion.bash.inc"
# The next line updates PATH for the Google Cloud SDK.
if [ -f "${gpath_file}" ]; then . "${gpath_file}"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${gcompletion_file}" ]; then . "${gcompletion_file}"; fi 


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


### SSH Agent
HN=$(hostname)
SESS_DIR=~/.ssh-agent
mkdir -p $SESS_DIR
SESS_FILE="${SESS_DIR}/agent-${HN}"
if [ -e $SESS_FILE ]
then
    echo -n "Using existing SSH "
    . $SESS_FILE
    if ! [ -d /proc/${SSH_AGENT_PID} ]
    then
        echo "Agent doesn't seem to exist. Cleaning up a bit."
        test -S $SSH_AUTH_SOCK && rm -f $SSH_AUTH_SOCK
        echo -n "Started new SSH "
        eval $(ssh-agent -s | tee ${SESS_FILE})
    fi
else
    echo -n "Started new SSH "
    eval $(ssh-agent -s | tee ${SESS_FILE})
fi
echo
### Agent identities
tput bold
ssh-add -L > /dev/null 2>&1 || echo "SSH key has not been unlocked"
tput sgr0

export CLOUDSDK_PYTHON="/c/Users/jo481y/AppData/Local/Programs/Python/Python311/python"

