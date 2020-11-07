# Overview

このリポジトリは、alpineの最新(alpine 3.12.1 && tzdata 2020c-r0)を使った際にtimezoneの挙動がおかしい事象の調査結果になります。

- `make` => run with Dockerfile.success
- `make failure` => run with Dockerfile.failure
- `Dockerfile.success*` => dockerfiles which is succeed to convert tz
- `Dockerfile.failure*` => files which is failed to do

# Reference
[Alpine docker image上で、golangのタイムゾーン変換を行うと、JSTが+0000 +0000と変換されてしまう問題調査](https://qiita.com/developer-kikikaikai/items/2ad14a5c384e58ddac2f)
