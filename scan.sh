docker run -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/Library/Caches:/root/.cache/ aquasec/trivy:0.54.1 image --severity CRITICAL --exit-code 0 --light openjdk:8u151-jdk-alpine3.7

exit_code=$?
echo "exit code is = $exit_code"

if [ $exit_code == 1 ]
then
   echo "Image scanning failed, Image is not secure"
   exit 1
else
   echo "Image scaning passed, Image is secure"
fi
