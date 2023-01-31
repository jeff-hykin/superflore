# if git doesnt exist
if [ -z "$(command -v "git")" ]
then
    echo "not even sure how you got this code without git, please install git"
    exit
fi

# if python3 doesnt exist
if [ -z "$(command -v "python3")" ]
then
    echo "please install python3"
    exit
fi

# if nix doesnt exist
if [ -z "$(command -v "nix")" ]
then
    echo "please install nix"
    exit
fi

# if nix-prefetch doesnt exist
if [ -z "$(command -v "nix-prefetch")" ]
then
    nix-env -iA nixpkgs.nix-prefetch -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/aa0e8072a57e879073cee969a780e586dbe57997.tar.gz
fi


# 
# actual setup
# 
# if superflore-gen-nix doesnt exist
if [ -z "$(command -v "superflore-gen-nix")" ]
then
    sudo python3 ./setup.py install
    sudo rosdep init
    rosdep update
fi

# 
# actual run
# 
sudo python3 ./setup.py install
superflore-gen-nix --dry-run