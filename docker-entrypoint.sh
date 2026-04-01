#!/bin/bash
set -e

# Ejecutar migraciones automáticamente al arrancar
php bin/console doctrine:migrations:migrate --no-interaction

# Limpiar y calentar caché
php bin/console cache:clear --env=prod

# Iniciar Apache
apache2-foreground
