#!/bin/bash

# Скачиваем архив E-IMZO
curl -o E-IMZO-v3.41.tar.gz http://dls.yt.uz/E-IMZO-v3.41.tar.gz

# Разархивируем E-IMZO
tar -xzf E-IMZO-v*.tar.gz
mv ./E-IMZO/ ./tmp/

# Собираем образ
cd ./tmp/
javapackager -deploy -verbose -native image -outdir ../out/ -outfile E-IMZO -srcdir ./ -srcfiles E-IMZO.jar -appclass uz.yt.eimzo.websocket.server.Application -name "E-IMZO" -title "E-IMZO" -BappVersion=3.41 -Bicon=../e-imzo.icns -BclassPath=lib/ -BmainJar=E-IMZO.jar
cp -r lib/ ../out/E-IMZO.app/Contents/Java/lib/

# Удаляем временную папку и архив
cd ..
rm -rf ./tmp/ E-IMZO-v*.tar.gz
