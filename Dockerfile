# Build stage
FROM node:18.17.1-alpine AS builder
ENV NODE_ENV production
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

# Runtime stage
FROM nginx:1.24.0-alpine AS production

# Copy nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy static site
COPY --from=builder /app/build /usr/share/nginx/html

# Copy runtime env template + entrypoint script
COPY public/env.template.js /usr/share/nginx/html/env.template.js
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use our entrypoint that generates env.js
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 80

