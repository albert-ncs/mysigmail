set dotenv-load
set export

@help:
    just --list --list-submodules
    echo "VUE_APP_AWS_S3_URL = $VUE_APP_AWS_S3_URL"

# Run `npm install`
install:
    npm install

# Run `npm run serve`
run:
    npm run serve

commit:
    git add .
    -git commit -m "feat: add tweaks"
    git push


# Push changes to server
push: commit
    ssh ncs-01 bash -c 'pwd && cd /home/albert.le/ncs/mysigmail && just pull'


# Push changes to server and deploy
push-deploy: commit
    ssh ncs-01 bash -c 'pwd && cd /home/albert.le/ncs/mysigmail && just pull build deploy'


pull:
    git reset --hard HEAD
    git pull


# Build the services
build:
    npm run build

deploy:
    rsync -avz ./dist/ /var/www/signature.neurocriticalcarespecialists.com/


png-convert:
    cd src/assets/image/ && find . -type f -name "*.svg" -exec bash -c 'rsvg-convert -h 32 "$0" > "$0".png' {} \;
    mv src/assets/image/*.png public/icons/
    cd public/icons && rename 's/svg.png/png/' *
