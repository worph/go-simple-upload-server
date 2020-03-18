IF [%1] == [] GOTO error


docker login
call build.bat

rem RUN DOCKER TO PUBLISH
docker tag go-upload-server:latest registry.aptero.co/go-upload-server:latest
docker push registry.aptero.co/go-upload-server:latest

docker tag go-upload-server:latest registry.aptero.co/go-upload-server:%1
docker push registry.aptero.co/go-upload-server:%1


GOTO :EOF
:error
ECHO incorrect_parameters