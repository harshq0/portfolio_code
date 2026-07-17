flutter build web --base-href /portfolio_host/ --release
cd build/web
git init
git add .
git commit -m "Comment"
git remote add origin https://github.com/harshq0/portfolio_host.git  
git branch -M main
git push -u origin main --force
