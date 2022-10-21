# CHALLENGE Nº 3

## Trabajando con un Pod multicontenedor

En este desafio vamos a profundizar en los Pods multicontenedor,
un Pod puede estar formado por varios contenedores y por volúmenes (para permitir que los
contenedores del Pod puedan compartir almacenamiento).

* **Nota 1:** Estudiaremos más en profundidad los volúmenes en una unidad posterior.
* **Nota 2:** Veremos también que los Pods son efímeros, es decir, que
  se pierde la información cuando el Pod se elimina.

Veamos dos ejemplos concretos:

1. Un servidor web junto con un programa auxiliar que sondea un
   repositorio Git en busca de nuevas actualizaciones.
2. Un  servidor  web con un servidor de aplicaciones PHP-FPM, lo
   podemos implementar  en un Pod, y cada servicio en un
   contenedor. Además tendría un volumen interno que se montaría en el
   *DocumentRoot* para que el servidor web y el servidor de
   aplicaciones puedan acceder a la aplicación.

Veamos un pequeño ejemplo de un Pod multicontenedor:

Tenemos la definición del Pod en  [`pod-multicontenedor.yaml`](../files/pod-multicontenedor.yaml):

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-multicontenedor
spec:
  volumes:
  - name: html
    emptyDir: {}
  containers:
  - name: contenedor1
    image: nginx
    volumeMounts:
    - name: html
      mountPath: /usr/share/nginx/html
  - name: contenedor2
    image: debian
    volumeMounts:
    - name: html
      mountPath: /html
    command: ["/bin/sh", "-c"]
    args:
      - while true; do
          date >> /html/index.html;
          sleep 1;
        done
```

Estudiemos la definición del Pod:

![pod_multicontenedor](../../assets/pod_multicontenedor.png)

Para realizar el desafio realiza los siguientes pasos:

1. Crea el Pod.
2. Muestra la información del Pod, y fíjate que el Pod está formado por un volumen y dos contenedores.
3. Muestra el contenido del archivo `index.html` en el primer contenedor, ejecutando:

        kubectl exec pod-multicontenedor -c contenedor1 -- /bin/cat /usr/share/nginx/html/index.html

    En esta ocasión hay que indicar el contenedor (opción `-c`) para indicar en que contenedor vamos a ejecutar la instrucción.
4. Muestra el contenido del archivo `index.html` en el segundo contenedor, ejecutando:

        kubectl exec pod-multicontenedor -c contenedor2 -- /bin/cat /html/index.html
5. Ejecuta un "port forward" para acceder al Pod en el puerto 8081 de localhost, sabiendo que el servicio usa el puerto 80.
6. Accede desde un navegador para ver el resultado. Refresca la página para observar cómo va cambiando el archivo `index.html`.

Para superar el desafio deberás entregar en un unico repositorio de github en formato [markdown](https://docs.github.com/es/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax):

1. Imagen donde se muestre la información del Pod y se vean la definición del pod y se vea que contiene dos contenedores (**imagen1.jpg**).
2. Imagen donde se vea el acceso a la página desde un navegador web (**imagen2.jpg**).


