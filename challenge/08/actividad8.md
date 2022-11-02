# CHALLENGE Nº 8

## Despliegue y acceso de la aplicación GuestBook

Una vez que tenemos creado el despliegue de la aplicación, que realizamos en la [Challenge 7: Despliegue de la aplicación GuestBook](../07/actividad7.md), vamos a crear los Services correspondientes para acceder a ella:

### Service para acceder a la aplicación

El primer Service que vamos a crear nos va a permitir acceder a la aplicación GuestBook desde el exterior, para ello crea un archivo yaml con la definición del Service a partir de la siguiente plantilla:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: guestbook
  labels:
    app: guestbook
    tier: frontend
spec:
  type: 
  ports:
  - port: 
    targetPort: 
  selector:
    app: guestbook
    tier: frontend
```

Tienes que poner el tipo del Service, el puerto del servicio será el 80 y el nombre del puerto de la aplicación que hemos asignado en el Deployment es `http-server`.

Realiza los siguientes pasos:

1. Elabora el archivo yaml con la definición del Service, y créalo.
2. Comprueba el puerto que le han asignado al Service para acceder desde el exterior.
3. Accede a la ip del nodo master y al puerto asignado desde un navegador web para ver la aplicación.
4. Responde la siguiente pregunta: ¿Por qué aparece el mensaje de error: **Waiting for database connection...**?

### Service para acceder a la base de datos

A continuación vamos a crear el Service para acceder a la base de datos. Vamos a crear el archivo yaml para su definición a partir de la siguiente plantilla:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: redis
  labels:
    app: redis
    tier: backend
spec:
  type: 
  ports:
  - port: 
    targetPort: 
  selector:
    app: redis
    tier: backend
```
Tienes que poner el tipo del Service, el puerto del servicio será el 6379 y el nombre del puerto de la base de datos que hemos asignado en el Deployment es `redis-server`. **Nota: No cambies el nombre del Service, ya que la aplicación guestbook va a acceder por defecto a la base de datos usando el nombre `redis`**.

Realiza los siguientes pasos:

1. Elabora el archivo yaml con la definición del Service, y créalo.
2. Lista los Services que has creado.
3. Accede a la ip del nodo master y al puerto asignado desde un navegador web para ver la aplicación. Comprueba que funciona sin ningún problema.

### Acceso a la aplicación usando Ingress **soloMinikube

Vamos a crear el archivo yaml de definición del recurso Ingress para acceder a la aplicación a partir de la siguiente plantilla:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: guestbook
spec:
  rules:
  - host: 
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: 
            port:
              number: 80
```
Indica un host del tipo *www.tunombre.org*, indica el nombre del Service que creaste para acceder a la aplicación guestbook y ten en cuenta que el puerto de dicho servicio era el 80.

Realiza los siguientes pasos:

1. Activa el *addon* ingress en minikube para instalar el Ingress Controller.
2. Crea La definición del recurso Ingress con los datos sugeridos, y crea el recurso Ingress.
3. Modifica el archivo `/etc/hosts` de tu ordenador para configurar la resolución estática.
3. Accede a la aplicación usando el nombre que has asignado.

Para superar el desafio deberás entregar en un unico repositorio de github en formato [markdown](https://docs.github.com/es/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax):

1. imagen donde se vea el acceso desde un navegador web a la aplicación cuando sólo tenemos el servicio para acceder a la aplicación (tiene que aparecer el mensaje de error) (**imagen1.jpg**).
2. imagen donde se vea el acceso desde un navegador web a la aplicación usando la ip del nodo master y el puerto asignado al Service (**imagen2.jpg**).
3. imagen donde se vea el acceso desde un navegador web a la aplicación usando el nombre que hemos configurado en el recurso Ingress (**imagen3.jpg**).






