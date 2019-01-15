#!/bin/bash
set -euxo pipefail

# TODO: fetch released version of swagger from maven

JAVA_OPTS="-XX:MaxPermSize=256M -Xmx1024M -Dlogback.configurationFile=$HOME/swagger-codegen/bin/logback.xml"

if [ ! -f swagger.yaml ] ; then
    echo "This script should be run from the root of the checkout."
    exit 1
fi

# We run the generator in the root of the repo, with common files ignored in .swagger-codegen-ignore
java $JAVA_OPTS                                                                             \
    -jar "$HOME/swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar" \
    "$@"                                                                                    \
    generate                                                                                \
    -i swagger.yaml                                                                         \
    -l haskell-servant                                                                      \
    -o .

