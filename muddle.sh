cd $GITHUB_WORKSPACE
curl -L https://github.com/demonnic/muddler/releases/download/0.5/muddle-shadow-$INPUT_MUDDLERVERSION.tar --output muddler.tar
mkdir muddler-tmp
tar xf muddler.tar -C muddler-tmp
mv muddler-tmp/muddle-shadow-$INPUT_MUDDLERVERSION muddler
rm -rf muddler-tmp muddler.tar
muddler/bin/muddle
rm -rf muddler
cd -
