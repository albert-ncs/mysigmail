set dotenv-load

help:
    just --list --list-submodules

    echo "VUE_APP_AWS_S3_URL = $VUE_APP_AWS_S3_URL"

# Run `npm install`
install:
    npm install

# Run `npm run serve`
run:
    npm run serve

# Push changes to server
push:
    git add .
    -git commit -m "feat: add tweaks"
    git push
    ssh ncs-01 bash -c 'pwd && cd /home/albert.le/ncs/mysigmail && just pull build deploy'


# Build the services
build:
    npm run build

deploy:
    rsync -avz ./dist/ /var/www/signature.neurocriticalcarespecialists.com/


png-convert:
    cd src/assets/image/ && find . -type f -name "*.svg" -exec bash -c 'rsvg-convert -h 32 "$0" > "$0".png' {} \;
    mv src/assets/image/*.png public/icons/
    cd public/icons && rename 's/svg.png/png/' *
