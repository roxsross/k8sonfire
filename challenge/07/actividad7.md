# CHALLENGE Nº 7

# Despliegue de la aplicación GuestBook


Vamos a desplegar una aplicación web que requiere de dos servicios para su ejecución. La aplicación se llama GuestBook y necesita los siguientes servicios:

* La aplicación Guestbook es una aplicación web desarrollada en python que es servida en el puerto 5000/tcp. Utilizaremos la imagen `roxsross12/guestbook`.
* Esta aplicación guarda la información en una base de datos no relacional redis, que utiliza el puerto 6379/tcp para recibir las conexiones. Usaremos la imagen `redis`.

Por lo tanto si tenemos dos servicios distintos, tendremos dos archivos yaml para crear dos recursos Deployment, uno para cada servicio. Con esta manera de trabajar podemos obtener las siguientes características:

1. Cada conjunto de Pods creado en cada despliegue ejecutarán un solo proceso para ofrecer el servicio.
2. Cada conjunto de Pods se puede escalar de manera independiente. Esto es importante, si identificamos que al acceder a alguno de los servicios se crea un cuello de botella, podemos escalarlo para tener más Pods ejecutando el servicio.
3. Las actualizaciones de los distintos servicios no interfieren en el resto.
4. Lo estudiaremos en un módulo posterior, pero podremos gestionar el almacenamiento de cada servicio de forma independiente.

Por lo tanto para desplegar la aplicaciones tendremos dos archivos.yaml:

* [guestbook-deployment.yaml](../../build/guestbook/files/guestbook-deployment.yaml)
* [redis-deployment.yaml](../../build/guestbook/files/redis-deployment.yaml)

Para realizar el despliegue realiza los siguientes pasos:

1. Usando los archivos anteriores crea los dos Deployments.
2. Comprueba que los recursos que se han creado: Deployment, ReplicaSet y Pods.
3. Crea una redirección utilizando el `port-forward` para acceder a la aplicación, sabiendo que la aplicación ofrece el servicio en el puerto 5000, y accede a la aplicación con un navegador web.

¿Qué aparece en la página principal de la aplicación?. Aparece el siguiente mensaje: **Waiting for database connection...**. Por lo tanto podemos indicar varias conclusiones:

1. Hasta ahora no estamos accediendo de forma "normal" a las aplicaciones. El uso de la opción `port-forward` es un mecanismo que realmente nos posibilita acceder a la aplicación, pero utilizando un proxy. Deberíamos acceder a las aplicaciones usando una ip y un puerto determinado.
2. Parece que tampoco hay acceso entre los Pods de los distintos despliegues. Parece que los Pods de la aplicación guestbook no pueden acceder al Pod donde se está ejecutando la base de datos redis.

En el siguiente módulo estudiaremos los recursos que nos ofrece la API de Kubernetes para permitirnos el acceso a las aplicaciones desde el exterior, y para que los distintos Pods de los despliegues puedan acceder entre ellos.

Para superar el desafio deberás entregar en un unico repositorio de github en formato [markdown](https://docs.github.com/es/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax):

1. imagen donde se comprueba los recursos que se han creado (**imagen1.jpg**).
2. imagen donde se vea el acceso desde un navegador web a la aplicación usando el `port-forward`, y se vea el mensaje de error al no poder acceder a la base de datos (**imagen2.jpg**).

### Si se animan a construir sus propias imagenes acá les dejo la fuente:

[`Dockerfile guestbook`](../../build/guestbook/Dockerfile)





