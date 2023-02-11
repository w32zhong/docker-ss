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
docker run --net=host -p 80:80 -it approach0/docker-ss
```
alternatively, as daemon
```sh
docker run --net=host -p 80:80 -d approach0/docker-ss
```

### Client side
```sh
wget https://github.com/w32zhong/docker-ss/raw/master/ss.json
```
edit the file,
* change IP to the server IP
* change `/usr/local/bin/obfs-server` to `/usr/local/bin/obfs-local`

run
```sh
docker run --net=host -p 3081:3081 -v `pwd`/ss.json:/root/ss.json \
    -it approach0/docker-ss /usr/local/bin/ss-local -c /root/ss.json
```

Finally, use some proxy tool such as Chrome "SwitchyOmega":
![image](https://user-images.githubusercontent.com/1407530/218239161-efa56586-1256-4bec-85ba-809a364d8a37.png)

## Test
Visit https://nordvpn.com/what-is-my-ip and check your IP.
