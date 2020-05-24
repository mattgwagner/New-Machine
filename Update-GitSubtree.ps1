# Reference https://www.sourcefield.nl/post/git-subtree-survival-tips/

param {
    $Ref = "master"; # branch or tag; defaults to 'master' if parameter 1 not present
    $Remote = "some-remote"; # just a name to identify the remote
    $Repo = " https://github.com/actions/virtual-environments.git"; # replace this with your repository URL
    $Folder = ".github-actions" # where to mount the subtree
}

git remote add $REMOTE --no-tags $REPO

if(Test-Path $Folder) # update the existing subtree
{
    git subtree pull $REMOTE $REF --prefix=$FOLDER --squash -m "Merging '$REF' into '$FOLDER'"
} 
else # add the subtree
{
    git subtree add  $REMOTE $REF --prefix=$FOLDER --squash -m "Merging '$REF' into '$FOLDER'"
}

git remote remove $REMOTE

# git subtree add --prefix .github-actions https://github.com/actions/virtual-environments.git master --squash

# git subtree pull --prefix .github-actions https://github.com/actions/virtual-environments.git master --squash