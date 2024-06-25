#!/bin/sh

export DOCKER_BUILDKIT=1

rm -f app1/code app2/code
touch -d 01010101 app1/code app2/code
cat > app1/code <<EOF
#!/bin/sh
echo app1 output
EOF
cat > app2/code <<EOF
#!/bin/sh
echo app2 output
EOF
touch -d 01010101 app1/code app2/code

docker build --no-cache -f ./Dockerfile ./app1 --tag localhost/app1:latest
docker build --no-cache -f ./Dockerfile ./app2 --tag localhost/app2:latest

docker run localhost/app1:latest
docker run localhost/app2:latest
