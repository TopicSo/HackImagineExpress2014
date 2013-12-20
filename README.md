Hack Imagine Express 2014
======================

Código con el que @oriolblanc de @TopicSo ganó la Primera Plaza del Imagine Express 2014.
En el repositorio encontraréis dos carpetas con el desarrollo de cada plataforma.

imagine-ios
-----------

Corresponde a la app de iOS para hacer las speed dating con los otros participantes.

La app consta de:
* Identificarte en el sistema como **Dreamer**
* Pantalla para seleccionar nuevas citas y puntuarlas
* Ver un ranking con las citas anteriores
* Ver tu perfil, por si quieres modificar avatar, descripción.

La app se puede arrancar en dos modos, **modo_cita** y **modo_resultado**. En la aplicación final, la app se abriría en *modo_cita* durante el trayecto Barcelona-París, y en *modo_resultado* al llegar a París.

Podéis simular cada modo cambiando el valor de la variable *modo_resultado* en el **AppDelegate.m**

imagine-api
-----------

Corresponde a la API y a la Base de Datos con los participantes, las puntuaciones de cada cita, y el algoritmo de matching.

Esta desarrollado con Play! Framework. Java + MySQL
