#!/bin/bash
set -e

# Crear directorios necesarios con permisos correctos
mkdir -p var/cache var/log /tmp/symfony/sessions
chmod -R 777 var/ /tmp/symfony/sessions

# Migraciones
php bin/console doctrine:migrations:migrate --no-interaction || echo "⚠️ Migraciones fallaron, continuando..."

# Fixtures si no hay usuarios
USER_COUNT=$(php bin/console dbal:run-sql "SELECT COUNT(*) FROM membre" --no-interaction 2>/dev/null | grep -o '[0-9]*' | tail -1 || echo "0")
if [ "$USER_COUNT" = "0" ]; then
    echo "➡️ Cargando fixtures..."
    php bin/console doctrine:fixtures:load --no-interaction || echo "⚠️ Fixtures fallaron"
else
    echo "✅ Ya hay $USER_COUNT usuarios"
fi

# Caché
php bin/console cache:clear --env=prod || echo "⚠️ Cache clear falló"
php bin/console cache:warmup --env=prod || echo "⚠️ Cache warmup falló"

apache2-foreground
