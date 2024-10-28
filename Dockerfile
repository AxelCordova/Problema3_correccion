# Aqui le dicimos a Docker que use Ubuntu como base para construir todo para que no haya contenido basura
FROM ubuntu:20.04

# Aqui hacemos que Ubuntu no pida confirmación cuando actualiza el sistema ya que no queremos que nos pregunte cosas mientras se instala.
ENV DEBIAN_FRONTEND=noninteractive

# Aquí Docker actualiza el sistema operativo y el comando -y es para que instale todo de forma automatica y rapida
RUN apt-get update && apt-get upgrade -y

# Aqui instalamos Apache en Ubuntu como servidor wed para que sea visible en cualquier sitio web
RUN apt-get install -y apache2

# Aqui permitimos el acceso al contenedor para que los visitantes puedan ver el sitio web.
EXPOSE 80

# Aqui añadimos el archivo tu computadora a la carpeta donde Apache lo va a servir para su accceso remoto
COPY ./index.html /var/www/html/index.html

# Aqui iniciamos Apache cuando el contenedor se esta ejecutando correctamente, esto permite manejar apache y que siga funcionando para que la página esté siempre disponible
CMD ["apachectl", "-D", "FOREGROUND"]