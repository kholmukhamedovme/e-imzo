#!/bin/bash

# Скачиваем архив E-IMZO
curl -o E-IMZO-v3.41.tar.gz http://dls.yt.uz/E-IMZO-v3.41.tar.gz

# Разархивируем E-IMZO
tar -xzf E-IMZO-v*.tar.gz
mv ./E-IMZO/ ./tmp/

# Собираем образ
cd ./tmp/
jpackage --input ./ --name E-IMZO --main-class uz.yt.eimzo.websocket.server.Application --main-jar E-IMZO.jar --icon ../e-imzo.$
mv E-IMZO-1.0.dmg ../

# Удаляем временную папку и архив
cd ..
rm -rf ./tmp/ E-IMZO-v*.tar.gz
