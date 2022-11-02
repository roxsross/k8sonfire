# CHALLENGE Nº 9

## Despliegue y acceso de la Aplicación Lets-Chat


[Let's Chat](https://github.com/sdelements/lets-chat) es una aplicación web escrita en Node.js que utilizando una base de datos MongoDB nos posibilita la creación de salas de chats.

Vamos a realiza el despliegue y acceso a esta aplicación teniendo en cuenta los siguientes aspectos:

* La imagen docker que vamos a usar para el despliegue de Let's Chat es `sdelements/lets-chat` y para desplegar mongoDB utilizaremos la imagen `mongo`.
* Al crear el despliegue de Let's Chat podemos poner varias replicas, pero el despliegue de la base de datos, sólo creará una replica.
* El puerto en el que responde la aplicación es el 8080. La base de datos utiliza el puerto 27017.
* Vamos acceder desde el exterior a la aplicación. Sin embargo, no es necesario acceder desde el exterior a la base de datos.
* El nombre del Service para acceder a la base de datos debe ser `mongo` ya que por defecto la aplicación va a conectar a la base de datos usando ese nombre.
* Queremos acceder a la aplicación usando un nombre del tipo *www.chat-tunombre.org*.

Realiza los siguientes pasos:

1. Utilizando como modelos los archivos yaml de la actividad anterior, crea los archivos necesarios para crear los recursos en tu cluster de Kubernetes para desplegar esta aplicación.

Para superar el desafio deberás entregar en un unico repositorio de github en formato [markdown](https://docs.github.com/es/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax):

1. Los archivos yaml que has creado.
2. Una imagen donde se vea el acceso desde un navegador web a la aplicación usando la ip del nodo master y el puerto asignado al Service (**imagen1.jpg**).
3. Una imagen donde se vea el acceso desde un navegador web a la aplicación usando el nombre que hemos configurado en el recurso Ingress (**imagen2.jpg**).
