# yarn-deploy
A minimal alpine docker container with nodejs, yarn and rsync
Used for deployment from GitLab CI or Bitbucket Pipelines


# Example how to set up automatic deployment from develop branch to own host using Bitbucket Pipelines

```
image:
  name: zfmaster/yarn-deploy

pipelines:
  branches:
    develop:
      - step:
          script:
            - yarn && yarn build
            - ssh $SSH_USER@$SSH_ADDRESS "mkdir $DEVELOP_PATH/releases/$BITBUCKET_BUILD_NUMBER"
            - rsync -a dist/* $SSH_USER@$SSH_ADDRESS:$DEVELOP_PATH/releases/$BITBUCKET_BUILD_NUMBER
            - ssh $SSH_USER@$SSH_ADDRESS "chmod -R g+rw $DEVELOP_PATH/releases/$BITBUCKET_BUILD_NUMBER"
            - ssh $SSH_USER@$SSH_ADDRESS "rm -f $DEVELOP_PATH/current && ln -s $DEVELOP_PATH/releases/$BITBUCKET_BUILD_NUMBER $DEVELOP_PATH/current"
```

[![docker](https://dockeri.co/image/zfmaster/yarn-deploy)](https://dockeri.co/image/zfmaster/yarn-deploy)