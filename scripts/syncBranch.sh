BASEDIR="$HOME/$1"

if [ $# -lt 2 ]; then
    echo "|> Please provide a branch name"
    exit 1
fi

echo "|> We are going to update all repositories to branch $2 in $BASEDIR"
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
echo "|> You chose to continue ($confirm)"

for d in $BASEDIR/* ; do
    [ -L "${d%/}" ] && continue
    cd $d
    echo "You are about to switch: $(basename `git rev-parse --show-toplevel`). Changes will be stashed for later use."

    BRANCHNAME=$2
    BASE=$(cat .git/config | grep -oE -m 1 "main|master")
    git stash
    git checkout $BASE
    git pull
    git checkout $BRANCHNAME
done

exit 0
