BASEDIR="$HOME/$1"

if [ $# -lt 1 ]; then
    echo "|> Please provide a project (fe, be, qa)"
    exit 1
fi

echo "|> We are going to update all repositories in $BASEDIR"
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
echo "|> You chose to continue ($confirm)"

for d in $BASEDIR/* ; do
    [ -L "${d%/}" ] && continue
    cd $d
    echo "You are about to update: $(basename `git rev-parse --show-toplevel`). Changes will be stashed for later use."

    BRANCHNAME=$(cat .git/config | grep -oE -m 1 "main|master")
    git checkout $BRANCHNAME
    git stash
    git pull origin $BRANCHNAME
done

exit 0
