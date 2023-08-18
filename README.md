## HydroSpanner

To install say for Latex.

```
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/ampretia/hydrospanner/main/makeme.sh | bash -s -- latex
```

- Requires docker to be installed, but doesn't need root access
- This is assumes you have `~/.local/bin` in your path, to put a small binary there
- Docker image contains all the needed prereqs, and writes out files with your userid


Change to your article's directory and run the tool

```
hslatex build
```


