<p align="center">
  <img src="../images/docker-logo.png" />
</p>



# Install Docker on Ubuntu 22.04

## Install Instant
```bash
sh docs/docker/install.sh
```

## Install Steps

Update system

```bash
sudo apt update
```

Install prerequsites

```bash
sudo apt install ca-certificates curl gnupg lsb-release
```

Make folder for GPG keys

```bash
sudo mkdir -p /etc/apt/keyrings
```

Add Docker’s official GPG key

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

To add Doker Repository to the Ubuntu system

```bash
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Update system

```bash
sudo apt update
```

Install Doker

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

Verify that the Docker Engine installation is successful by running the `hello-world` image

```bash
sudo docker run hello-world
```

more details https://docs.docker.com/engine/install/ubuntu/