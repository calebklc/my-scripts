# my-scripts

# Setup

```sh
cd ~
git clone git@github.com:calebklc/my-scripts.git .my-scripts
find . -type f -name "*.sh" -exec chmod +x {} \;
```

## Generate SSH key without clone

```sh
bash <(curl -s https://raw.githubusercontent.com/calebklc/my-scripts/main/gen_ssh_key.sh)
```