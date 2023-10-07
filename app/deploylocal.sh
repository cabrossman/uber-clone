cd frontend
npm run build:local
cd ..
docker-compose build
docker-compose up -d