- [-] api

  - [x] auth:
    - [x] register: form, gg,...
    - [x] login: jwt
  - [-] movie:
    - [-] (search): list movie: genre, name, actor, direct, runtime, imbd_score, year
    - [-] list suggest
    - [-] add Media (queues)
    - [-] watch by id (count viewed, save history)
    - [x] convert mp4 to m3u8
    - [x] stream video with HLS
  - [-] comment: socket
    - [x] list comment
    - [x] post comment
    - [x] typing comment
  - [-] home
    - [x] slide
    - [x] by tag
    - [x] by comming sooon

- Deploy:
  - socket: 2900
  - api: 3000
  - user: 3001
  - admin: 3002
  - postgres:
