# My Blog
http://blog.auska.win

## Usage

```
docker create --name=verysync \
-v <path to downloads>:/media \
-v <path to verysync>:/config \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 8886:8886 -p 22330:22330 \
auska/docker-verysync
```

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Versions

+ **0.0.1:** Rebase to alpine linux 3.8.
+ **1.0.4:** Update VerySync 1.0.4.
+ **1.0.5:** Update VerySync 1.0.5.
+ **2.1.1:** Update VerySync 2.1.1.