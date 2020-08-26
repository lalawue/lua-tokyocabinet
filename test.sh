export LD_LIBRARY_PATH=$PWD/tokyocabinet-1.4.48
export DYLD_LIBRARY_PATH=$PWD/tokyocabinet-1.4.48
echo "-- test hash"
lua lua-example/exp_hash.lua
echo "-- test b+tree"
lua lua-example/exp_bplustree.lua
echo "-- test fix length"
lua lua-example/exp_fixlength.lua
echo "-- test table"
lua lua-example/exp_table.lua
echo "-- test abstract"
lua lua-example/exp_abstract.lua
echo "-- remove temp database"
rm -f casket.*
