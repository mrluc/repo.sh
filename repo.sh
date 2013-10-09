
function repo(){
  if [ -z $GH_UN ]; then
    echo "github username:"
    read -s GH_UN
  fi
  
  if [ -z $GH_PW ]; then
    echo "github password:"
    read -s GH_PW
  fi
  
  echo "Calling github api ..."
  curl -u "$GH_UN:$GH_PW" https://api.github.com/user/repos -d "{\"name\":\"$1\"}"

  echo "Removing remote (if there was one) ..."
  git remote rm origin

  echo "Adding remote ..."
  git remote add origin git@github.com:$GH_UN/$1.git
  
  echo "Pushing to remote."
  git push origin master
}
