# Docker

`docker run -p 8080:80 -e API_ADDR=10.90.250.16 -e API_PORT=8080 ghcr.io/svinson1121/eupf-ui:latest`

replace API_ADDR and API_PORT with the IP and PORT of youe eUPF API 

# run in nginx
`git clone https://github.com/svinson1121/eupf-ui.git`

cd eupf-ui


`npm run build`

cd build 

create env.js 

`window.env = {
  API_ADDR: '10.90.250.16',
  API_PORT: '8080'
};`

copy -R * /var/www/html
