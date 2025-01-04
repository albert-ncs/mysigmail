about:
    node --version

install:
    npm install

run:
    npm run serve

push:
    git add .
    -git commit -m "feat: add tweaks"
    git push
    ssh ncs-01 bash -c 'pwd && cd /home/albert.le/ncs/mysigmail && just pull build deploy'

pull:
    git reset --hard HEAD
    git pull

build:
    npm run build

deploy:
    rsync -avz ./dist/ /var/www/signature.neurocriticalcarespecialists.com/


png-convert:
    cd src/assets/image/ && find . -type f -name "*.svg" -exec bash -c 'rsvg-convert -h 32 "$0" > "$0".png' {} \;
    mv src/assets/image/*.png public/icons/
    cd public/icons && rename 's/svg.png/png/' *
