## yEarn GitBot

### Abstract

Registered GitHub account for CI/CD proccesses inorder to keep automated processes out of `git blame`


### Usage

```bash
#!/bin/bash
set -e

TASK=<SOME TASK>

script_dir=$(dirname "$0")
GIT_COMMITTER_NAME="yEarn Bot" GIT_COMMITTER_EMAIL="git@yfinance.dev" \
  git commit --author="yEarn Bot <git@yfinance.dev>" \
  --all --message="bot: $TASK " --no-verify

sleep 1

git tag auto/$TASK
git push origin auto/pre-prettier auto/$TASK master
"$script_dir"/get-branches.sh | xargs -n 100 "$script_dir"/upgrade-branches.sh

exit 0 
```


### Support or Contact

Security issues please contact [yearn-security](https://github.com/iearn-finance/yearn-security)
