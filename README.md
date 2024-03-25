# alpine-rclone
![Docker Pulls](https://img.shields.io/docker/pulls/forumi0721/alpine-rclone)
![Docker Stars](https://img.shields.io/docker/stars/forumi0721/alpine-rclone)

### x64
![Docker Image Size](https://img.shields.io/docker/image-size/forumi0721/alpine-rclone/x64)
### aarch64
![Docker Image Size](https://img.shields.io/docker/image-size/forumi0721/alpine-rclone/aarch64)



----------------------------------------
#### Description

* Distribution : [Alpine Linux](https://alpinelinux.org/)
* Architecture : x64,aarch64
* Appplication : [Rclone](https://rclone.org/)
    - Rclone is a command-line program to manage files on cloud storage. It is a feature-rich alternative to cloud vendors' web storage interfaces.



----------------------------------------
#### Run

```sh
docker run -d \
           forumi0721/alpine-rclone:[ARCH_TAG]
```



----------------------------------------
#### Usage

* Use specific client for connect.



----------------------------------------
#### Docker Options

| Option             | Description                                      |
|--------------------|--------------------------------------------------|
| -                  | -                                                |


#### Ports

| Port               | Description                                      |
|--------------------|--------------------------------------------------|
| 2121/tcp           | FTP Port                                         |
| 62100-62199/tcp    | FTP Passive Port                                 |
| 8000/tcp           | HTTP Port                                        |
| 2049/tcp           | NFS Port                                         |
| 2020/tcp           | SFTP Port                                        |
| 8080/tcp           | Webdav Port                                      |


#### Volumes

| Volume             | Description                                      |
|--------------------|--------------------------------------------------|
| /data              | Data Volume                                      |


#### Environment Variables

| ENV                | Description                                      |
|--------------------|--------------------------------------------------|
| RUN_USER_NAME      | Login user name (default:forumi0721)             |
| RUN_USER_UID       | Login user uid (default:1000)                    |
| RUN_USER_GID       | Login user gid (default:100)                     |
| USER_NAME          |                                                  |
| USER_PASSWD        |                                                  |
| USER_UID           |                                                  |
| USER_GID           |                                                  |
| USE_FTP            |                                                  |
| FTP_USER_NAME      |                                                  |
| FTP_USER_PASSWD    |                                                  |
| FTP_SHARE          |                                                  |
| FTP_ADDR           |                                                  |
| FTP_PASV_MIN_PORT  |                                                  |
| FTP_PASV_MAX_PORT  |                                                  |
| USE_HTTP           |                                                  |
| HTTP_USER_NAME     |                                                  |
| HTTP_USER_PASSWD   |                                                  |
| HTTP_SHARE         |                                                  |
| HTTP_ADDR          |                                                  |
| HTTP_BASEURL       |                                                  |
| USE_NFS            |                                                  |
| NFS_SHARE          |                                                  |
| NFS_ADDR           |                                                  |
| NFS_BASEURL        |                                                  |
| USE_SFTP           |                                                  |
| SFTP_USER_NAME     |                                                  |
| SFTP_USER_PASSWD   |                                                  |
| SFTP_SHARE         |                                                  |
| SFTP_ADDR          |                                                  |
| SFTP_AUTHORIZED_KEYS|                                                 |
| SFTP_KEYS          |                                                  |
| USE_WEBDAV         |                                                  |
| WEBDAV_USER_NAME   |                                                  |
| WEBDAV_USER_PASSWD |                                                  |
| WEBDAV_SHARE       |                                                  |
| WEBDAV_ADDR        |                                                  |
| WEBDAV_BASEURL     |                                                  |

