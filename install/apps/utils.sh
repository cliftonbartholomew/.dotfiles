echo ""
echo ""
echo "###############################################"
echo "####### Installing some basic utilities #######"
echo "###############################################"
echo ""
echo ""
yes | sudo apt install curl # for downloading stuff
yes | sudo apt install ripgrep # telescope dependency
yes | sudo apt install fd-find # telescope dependency
yes | sudo apt install zip # for zipping files
yes | sudo apt install luarocks # lua package manager
yes | sudo apt install cmake # dependency for luaformatter

