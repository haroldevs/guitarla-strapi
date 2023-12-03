# Usa la imagen base de Node.js v20
FROM node:20

# Descarga e instala Yarn usando el script de instalación oficial
RUN curl -o- -L https://yarnpkg.com/install.sh | bash

# Agrega el directorio de Yarn a la variable de entorno PATH
ENV PATH="/root/.yarn/bin:$PATH"

# Establece el directorio de trabajo en la carpeta del proyecto Strapi
WORKDIR /usr/src/app

# Copia los archivos de tu proyecto Strapi al contenedor
COPY . /usr/src/app

# Establece el directorio de trabajo en el directorio de tu proyecto
WORKDIR /usr/src/app/guitarla-strapi

# Instala las dependencias del proyecto Strapi usando Yarn
RUN yarn install

# Expone el puerto en el que corre tu aplicación Strapi
EXPOSE 1337

# Comando para iniciar tu aplicación Strapi usando yarn develop
CMD ["yarn", "develop"]
