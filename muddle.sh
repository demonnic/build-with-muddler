/tmp/muddler/bin/muddle
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
  echo "Muddler build failed with exit status: $EXIT_CODE"
fi
exit $EXIT_CODE
