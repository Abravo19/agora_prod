#!/bin/bash
set -e

# Ejecutar migraciones (si falla, solo avisa pero no detiene el arranque)
php bin/console doctrine:migrations:migrate --no-interaction || echo "⚠️ Migraciones fallaron, continuando..."

# Limpiar caché
php bin/console cache:clear --env=prod || echo "⚠️ Cache clear falló, continuando..."

# Iniciar Apache siempre
apache2-foreground
