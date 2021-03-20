cd $GITHUB_WORKSPACE
echo "Using Muddler version: $1"
curl -L https://github.com/demonnic/muddler/releases/download/$1/muddle-shadow-$1.tar --output muddler.tar &&\
mkdir muddler-tmp &&\
tar xf muddler.tar -C muddler-tmp &&\
mv muddler-tmp/muddle-shadow-$1 muddler &&\
rm -rf muddler-tmp muddler.tar &&\
muddler/bin/muddle &&\
rm -rf muddler
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
  echo "Muddler build failed with exit status: $EXIT_CODE"
fi
exit $EXIT_CODE
