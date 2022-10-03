echo "Kill all the running PM2 actions"
sudo pm2 kill

echo "Jump to app folder"
cd /home/ubuntu/projects

echo "Create project if not existed"
if [ ! -d $DIR ]
then
  mkdir blogger &&
  git clone https://github.com/ShiedaKayn1975/BloggerServer.git blogger &&
  cd blogger &&
  npm i
else
  cd blogger
  echo "Update app from Git"
  git pull
fi

echo "Install app dependencies"
sudo rm -rf node_modules package-lock.json
sudo npm install

echo "Build your app"
sudo npm run build

echo "Run new PM2 action"
sudo cp /home/ubuntu/ecosystem.json ecosystem.json
sudo pm2 start ecosystem.json