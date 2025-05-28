aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 905418102296.dkr.ecr.eu-west-1.amazonaws.com



docker build -t uno ./uno
# docker buildx build --platform=linux/amd64 -t uno ./uno        !!In case you use apple m1 chip use this command instead of the first!!
docker tag uno 905418102296.dkr.ecr.eu-west-1.amazonaws.com/sta-uno:v1
docker push 905418102296.dkr.ecr.eu-west-1.amazonaws.com/sta-uno:v1

aws ecs update-service --cluster sta_ecs_cluster --service sta_uno_td_service --force-new-deployment



docker build -t due ./due
# docker buildx build --platform=linux/amd64 -t due ./due        !!In case you use apple m1 chip use this command instead of the first!!
docker tag due 905418102296.dkr.ecr.eu-west-1.amazonaws.com/sta-due:v1
docker push 905418102296.dkr.ecr.eu-west-1.amazonaws.com/sta-due:v1

aws ecs update-service --cluster sta_ecs_cluster --service sta_due_td_service --force-new-deployment



docker build -t tre ./tre
# docker buildx build --platform=linux/amd64 -t tre ./tre        !!In case you use apple m1 chip use this command instead of the first!!
docker tag tre 905418102296.dkr.ecr.eu-west-1.amazonaws.com/sta-tre:v1
docker push 905418102296.dkr.ecr.eu-west-1.amazonaws.com/sta-tre:v1

aws ecs update-service --cluster sta_ecs_cluster --service sta_tre_td_service --force-new-deployment


