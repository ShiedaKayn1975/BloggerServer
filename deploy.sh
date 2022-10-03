echo "Kill all the running PM2 actions"
pm2 delete all

echo "Jump to app folder"
cd /home/ubuntu/projects/blogger

echo "Update app from Git"
git pull

echo "Install app dependencies"
sudo rm -rf node_modules package-lock.json
sudo npm install

echo "Build your app"
sudo npm run build

echo "Run new PM2 action"
sudo cp /home/ubuntu/ecosystem.json ecosystem.json
sudo pm2 start ecosystem.json