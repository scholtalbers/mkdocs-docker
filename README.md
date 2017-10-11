# mkdocs in docker

An image with [MkDocs](http://www.mkdocs.org/) installed.

Tools included are git and rsync to easily build your site in the container
and copy over the result to your remote server.

## Gitlab ci example

```yaml
image: jelle/mkdocs:0.16

build_and_deploy:
  stage: deploy
  script:
    - mkdocs build --clean
    - rsync -avz --delete ${CI_PROJECT_DIR}/site/ remote-host:/var/www/html/mkdocs-site
  only:
    - master
  environment:
    name: deployment
    url: https://remote-host/mkdocs-site/
  variables:
    GIT_SUBMODULE_STRATEGY: recursive
  before_script:
    - mkdir -p ~/.ssh && echo $SSH_PRIVATE_KEY | base64 -d > ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa
    - echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
```
