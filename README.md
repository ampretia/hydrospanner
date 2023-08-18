
```
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/ampretia/hydrospanner/main/makeme.sh | bash -s -- latex
```

docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t hydrospanner-latex .
docker run -it -v $(pwd):/home/me/workspace hydrospanner-latex