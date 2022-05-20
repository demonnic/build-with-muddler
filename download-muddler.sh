VERSION=$1
cd /tmp
echo "Downloading muddler version: $VERSION"
curl -L "https://github.com/demonnic/muddler/releases/download/$VERSION/muddle-shadow-$VERSION.tar" --output muddler.tar
mkdir muddler-tmp
tar xf muddler.tar -C muddler-tmp
mv muddler-tmp/muddle-shadow-$VERSION muddler
rm -rf muddler-tmp muddler.tar
echo "Muddler downloaded successfully"