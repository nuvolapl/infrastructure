```bash
git clone git@github.com:nuvolapl/infrastructure.git

cd ./infrastructure/

git clone git@github.com:nuvolapl/proxy.git ./apps/proxy
git clone git@github.com:nuvolapl/web.git ./apps/web
```

```bash
export GITHUB_TOKEN=

export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=

export CLOUDFLARE_EMAIL=
export CLOUDFLARE_TOKEN=

export DOCKER_ENVIRONMENT= # (prod / dev /macos)
```

```bash
cd ./.terraform/

terraform init
terraform validate
terraform apply

cd ./../
```

```bash
# TODO: output repositories urls via terraform (https://eu-west-1.console.aws.amazon.com/ecs/home?region=eu-west-1#/repositories)

export ECS_ECR_PROXY=
export ECS_ECR_WEB=
```

```bash
bin/compose up -d --build --force-recreate
```

```bash
$(aws ecr get-login --no-include-email --region ${AWS_DEFAULT_REGION})

DOCKER_ENVIRONMENT=prod bin/compose build --compress proxy
DOCKER_ENVIRONMENT=prod bin/compose push proxy
```

```bash
cd ./.terraform/

terraform destroy

cd ./../
```
