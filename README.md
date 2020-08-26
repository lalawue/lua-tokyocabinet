
# About

Tokyo Cabinet from [Tokyo Cabinet: a modern implementation of DBM](https://dbmx.net/tokyocabinet/), version 1.4.48, with Lua binding from [slact/lua-tokyocabinet-static](https://github.com/slact/lua-tokyocabinet-static).

Origin Lua binding export tokyocabinet to global ENV, I modified this, make it return table.



# Build

please modify build.sh for Lua/LuaJIT library path.

```sh
$ ./build.sh tokyocabinet # build tokyocabinet DBM
$ ./build.sh lua "-L/usr/local/lib -lluajit" # build lua library
```

and run test
```sh
$ sh test.sh
```


# Usage

refers to lua-example, build.sh it and run test.sh to get a glance.

