# build-with-muddler

A github action to build your Mudlet project with muddler

## Inputs

Name | Description | Default
--- | --- | ---
muddlerVersion | the version of Muddler to use | LATEST

## Usage Example

The following example is setup as one might setup for CI to create and upload the mpackage as an artifact.
It will be a .zip file, due to limitations on github's end.
Also:

* Replace MyCoolPackageName with something more appropriate to your project
* I include muddlerVersion only to show *how* to include it. It will default to the latest stable release of muddler.
  * If you want to explicitly call out that you are using the latest version in your action, use "LATEST" for the version.
* If the main/default branch of your repository is something other than `main` you should change that on the branches lines below

```yaml
name: Build project using muddler and upload artifact

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2

      - name: Muddle
        uses: demonnic/build-with-muddler@main
        with:
          muddlerVersion: 0.5
      
      - name: Upload Artifact
        uses: actions/upload-artifact@v2
        with:
          name: MyCoolPackageName
          path: build/tmp/

```

## TO-DO

* The shell script doesn't do nearly enough (read: any) exit code checking, so your action may report success if you specify an invalid muddler version
  * This can be resolved by not specifying a version unless absolutely necessary, but I also intend to add some checks into the script
