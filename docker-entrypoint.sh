#!/bin/bash
set -e

# Migraciones
php bin/console doctrine:migrations:migrate --no-interaction || echo "⚠️ Migraciones fallaron, continuando..."

# Cargar fixtures SOLO si la tabla membre está vacía
USER_COUNT=$(php bin/console dbal:run-sql "SELECT COUNT(*) FROM membre" --no-interaction 2>/dev/null | grep -o '[0-9]*' | tail -1 || echo "0")

if [ "$USER_COUNT" = "0" ]; then
    echo "➡️ No hay usuarios, cargando fixtures..."
    php bin/console doctrine:fixtures:load --no-interaction || echo "⚠️ Fixtures fallaron"
else
    echo "✅ Ya hay $USER_COUNT usuarios, omitiendo fixtures"
fi

# Caché
php bin/console cache:clear --env=prod || echo "⚠️ Cache clear falló"

# Iniciar Apache
apache2-foreground
