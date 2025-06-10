# Usando a imagem oficial da Evolution API
FROM atendai/evolution-api:v2.2.3

# Definindo as variáveis de ambiente
ENV AUTHENTICATION_API_KEY=${AUTHENTICATION_API_KEY} \
    AUTHENTICATION_API_KEY="SUA API"
    CACHE_LOCAL_ENABLED="false"
    CACHE_REDIS_ENABLED="true"
    CACHE_REDIS_PREFIX_KEY="evolution"
    CACHE_REDIS_SAVE_INSTANCES="false"
    CACHE_REDIS_URI="${{Redis.REDIS_URL}}"
    DATABASE_CONNECTION_CLIENT_NAME="evolution_exchange"
    DATABASE_CONNECTION_URI="${{Postgres.DATABASE_URL}}}"
    DATABASE_ENABLED="true"
    DATABASE_PROVIDER="postgresql"
    DATABASE_SAVE_DATA_CHATS="true"
    DATABASE_SAVE_DATA_CONTACTS="true"
    DATABASE_SAVE_DATA_HISTORIC="true"
    DATABASE_SAVE_DATA_INSTANCE="true"
    DATABASE_SAVE_DATA_LABELS="true"
    DATABASE_SAVE_DATA_NEW_MESSAGE="true"
    DATABASE_SAVE_MESSAGE_UPDATE="true"
    POSTGRES_DB="railway"
    POSTGRES_PASSWORD="${{PGPASSWORD}}"
    POSTGRES_USER="postgres"

# Expondo a porta da aplicação
EXPOSE 8080

# Comando para diagnóstico e execução
CMD ["sh", "-c", "redis-cli -u $CACHE_REDIS_URI ping && npm run start:prod"]
