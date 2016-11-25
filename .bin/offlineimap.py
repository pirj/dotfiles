import subprocess

def get_pass(account):
    return subprocess.check_output(["zsh", "--login", "-c", "gpg2 --decrypt --use-agent -quiet --batch --no-tty ~/.passwd/" + account + ".gpg"]).strip()
