
build_tokyocabinet() {
	cd tokyocabinet-1.4.48
	sh configure
	make
	cd ..
}

build_lua() {
	gcc lua-tokyocabinet.c -Itokyocabinet-1.4.48 -Ltokyocabinet-1.4.48 -ltokyocabinet $1 -shared -fPIC -o cabinet.so
}

case $1 in
	"tokyocabinet")
		build_tokyocabinet
		;;
	"lua")
		LUA_CFLAGS=-llua
		if [ -n "$2" ]; then
			LUA_CFLAGS=$2
		fi
		build_lua $LUA_CFLAGS
		;;
	*)
		build_tokyocabinet
		build_lua "-llua"
		;;
esac
