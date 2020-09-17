
build_tokyocabinet() {
	cd tokyocabinet-1.4.48
	sh configure
	make
	cd ..
}

build_lua() {
	echo "gcc lua-tokyocabinet.c -Itokyocabinet-1.4.48 -Ltokyocabinet-1.4.48 -ltokyocabinet $1 $2 $3 -shared -fPIC -o cabinet.so"
	gcc lua-tokyocabinet.c -Itokyocabinet-1.4.48 -Ltokyocabinet-1.4.48 -ltokyocabinet $1 $2 $3 -shared -fPIC -o cabinet.so
}

case $1 in
	"tokyocabinet")
		build_tokyocabinet
		;;
	"lua")
		LUA_INC_DIR=-I/usr/local/include
		LUA_LIB_DIR=-L/usr/local/lib
		LUA_LIB_NAME=-llua
		if [ -n "$2" ]; then
			LUA_INC_DIR=$2
		fi
		if [ -n "$3" ]; then
			LUA_LIB_DIR=$3
		fi
		if [ -n "$4" ]; then
			LUA_LIB_NAME=$4
		fi
		build_lua $LUA_INC_DIR $LUA_LIB_DIR $LUA_LIB_NAME
		;;
	*)
		build_tokyocabinet
		build_lua "-llua"
		;;
esac
