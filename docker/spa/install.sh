
#!/bin/bash
set -e


echo -ne 'n\n' | ng new spartacus --style=scss --skip-git

cd spartacus
ng add @spartacus/schematics@$SPA_VERSION --skip-confirmation --interactive=false \
--base-url https://localhost:9002/ \
--base-site $BASE_SITE \
--currency=$CURRENCY \
--language=$LANGUAGE \
--urlParameters=$URL_PARAMETERS



if [ "$IS_B2B" = "true" ]; then
    echo "Install B2B ($IS_B2B)"
    ng add @spartacus/organization --skip-confirmation --interactive=false
else
    echo "Skip install B2B ($IS_B2B)"
fi


yarn install
