# Minimal Linux GUI on Render

## Deployment Instructions
1. Push all files to a GitHub repo.
2. Go to Render → New Web Service.
3. Connect your repo.
4. Choose:
   - **Runtime:** Docker
   - **Port:** 8080
5. Add a Render Disk:
   - Name: persist
   - Mount Path: /persist

## Access GUI
Once deployed, open:

