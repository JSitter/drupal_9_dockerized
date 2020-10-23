#!/usr/bin/env bash
if [ -x "$(command -v docker)" ]; then
    ./package_files/unpacker.py drupal-9.0.7.tar.gz ../drupal-src -d -r
    cp ./drupal-src/sites/default/default.settings.php ./drupal-src/sites/default/settings.php
    chmod 755 ./drupal-src/sites/default/settings.php
    mv ./drupal-src/sites ./sites
    mv ./drupal-src/modules ./modules
    mv ./drupal-src/profiles ./profiles
    mv ./drupal-src/themes ./themes
    docker-compose build
else
    printf '%s\n' "Docker not found. Please install before continuing." >&2
    exit 1
fi
