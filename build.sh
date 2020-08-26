cd tokyocabinet-1.4.48
sh configure
make
cd ..
gcc lua-tokyocabinet.c -Itokyocabinet-1.4.48 -Ltokyocabinet-1.4.48 -ltokyocabinet -lluajit -shared -fPIC -o cabinet.so
sh test.sh
