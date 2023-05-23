#! /usr/bin/env bash

# Install Core
wp --allow-root core install --url=localhost --title="MyITSite" --admin_user=dmonakh --admin_password=monakh3108 --admin_email=den3108mon@gmail.com

# Download and install Neve theme
wp --allow-root theme install neve --activate

# Download and install Contact Form 7 Plugin
wp plugin install contact-form-7  --activate
