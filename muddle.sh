cd $GITHUB_WORKSPACE
if [[ "$1" == "LATEST" ]]; then
  VERSION=`curl --silent "https://api.github.com/repos/demonnic/muddler/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")'`
else
  VERSION="$1"
fi
echo "Using Muddler version: $VERSION"
curl -L https://github.com/demonnic/muddler/releases/download/$VERSION/muddle-shadow-$VERSION.tar --output muddler.tar &&\
mkdir muddler-tmp &&\
tar xf muddler.tar -C muddler-tmp &&\
mv muddler-tmp/muddle-shadow-$VERSION muddler &&\
rm -rf muddler-tmp muddler.tar &&\
muddler/bin/muddle &&\
rm -rf muddler
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
  echo "Muddler build failed with exit status: $EXIT_CODE"
fi
exit $EXIT_CODE
