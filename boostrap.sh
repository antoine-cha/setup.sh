# Bootstrapping script for local machine: git + pyenv + ansible
set -euxo pipefail

function setup_pyenv() {
    sudo apt-get update;
    sudo apt-get install make build-essential libssl-dev zlib1g-dev \
            libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
            libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
            git

    curl https://pyenv.run | bash

    # .bashrc setup
    cat <<'EOT' >> ~/.bashrc
# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
EOT

    # Final setup for the user
    # TODO: install VERSION directly in this script
    set +x
    echo "**************************"
    echo "--------------------"
    echo "To finalize install:"
    echo "--------------------"
    echo "exec $SHELL"
    echo "pyenv --version"
    echo "--------------------"
    echo "Setup global python:"
    echo "--------------------"
    echo "pyenv install 3.10"
    echo "pyenv global 3.10"
    echo "python --version && which python"
    echo "**************************"
}

function setup_ansible() {
    # Bins will be at ~/.local/bin
    pip install --user ansible
    which ansible && ansible --version
}


source utils/colors.sh
source utils/display.sh
#setup_pyenv

echo -e "$BG_YELLOW $(announce Setting up Ansible) $CLEAR"
setup_ansible
echo -e "$BG_GREEN $(announce [DONE] Set up Ansible) $CLEAR"
