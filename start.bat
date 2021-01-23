docker build -t web-engine:develop .
docker stop webber
docker rm webber
docker run -p 5000:5000 --name webber --volume "%cd%":/app web-engine:develop
