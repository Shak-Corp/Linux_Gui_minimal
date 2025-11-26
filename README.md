# Browser GUI Linux on Render Free

## Features
- Ubuntu 22.04 + XFCE
- VNC + noVNC (browser GUI)
- Git-based persistence (no paid disk required)
- Port: 8080

## Deploy Steps
1. Push this repo to GitHub.
2. Go to Render → New Web Service.
3. Runtime: Docker, Port: 8080
4. Deploy.

## Git-based persistence
- Create a separate GitHub repo: `linux-gui-persist`.
- Put any files/tools/scripts you want to persist there.
- On container startup, `/persist` will sync automatically.
- Inside container, push changes to GitHub to save updates.

## Access GUI
- Visit your service URL in browser to see XFCE desktop.

## Default User
- username: `user`
- password: `user`
