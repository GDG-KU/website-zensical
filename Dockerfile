FROM python:3.11-slim AS builder

WORKDIR /app
RUN pip install --no-cache-dir zensical
COPY . .
RUN zensical build

FROM nginx:alpine
COPY --from=builder /app/site /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]