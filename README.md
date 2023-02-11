## Install
```sh
apt-get update
which docker || curl -fsSL https://get.docker.com -o get-docker.sh
which docker || sh get-docker.sh
docker pull approach0/docker-ss
```

## Run
### Server side
```sh
docker run -it approach0/docker-ss
```

### Client side
```
wget https://github.com/w32zhong/docker-ss/raw/master/ss.json
```
edit the file,
* change IP to the server IP
* change `/usr/local/bin/obfs-server` to `/usr/local/bin/obfs-local`

Finally, use some proxy tool such as Chrome "SwitchyOmega":
![image](https://user-images.githubusercontent.com/1407530/218239161-efa56586-1256-4bec-85ba-809a364d8a37.png)
