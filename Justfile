about:
    node --version

install:
    npm install

run:
    npm run serve

push:
    git add .
    git commit -m "feat: add tweaks"
    git push
    ssh ncs-01 bash -c 'cd ~/ncs/mysigmail && git pull'

build:
    npm run build

deploy:
    rsync -avz ./dist/ /var/www/signature.neurocriticalcarespecialists.com/
