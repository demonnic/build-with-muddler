if [[ "$1" == "LATEST" ]]; then
  VERSION=`curl --silent "https://api.github.com/repos/demonnic/muddler/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")'`
else
  VERSION="$1"
fi

echo "Using muddler version: $VERSION"

echo "MUDDLER_VERSION=$VERSION" >> $GITHUB_ENV
