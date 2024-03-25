# Marvel Characters


https://github.com/manuelruelas/marvel_heroes/assets/25523918/4f5cb380-d929-49ca-8535-a152505b500c


## Librerias Utilizadas
- **Json_serializable**: Para crear los modelos de una forma mas veloz.
- **sembast**: Es una base de datos nosql de facil configuracion para persistir datos localmente. Util en este caso porque solo se requiren guardar datos de personajes.
- **flutter_dotenv**: Para mantener keys solo de manera local
- **crypto**: Utilizada en las peticiones para cumplir con los requerimientos de la api de marvel.
- **mockito**: Cuenta con varias utilidades que nos permiten "testear" casos de uso en nuestra app de una manera mas sencilla

## Estructura de proyecto
![arch drawio](https://github.com/manuelruelas/marvel_heroes/assets/25523918/bcca10fd-a798-4957-adb6-7e9b06af1369)

- **Core:** Componentes que son la base de la app clientes http, conexiones a bases de datos, interfaces base.
- **Data**
  - **Repository:** Implementacion de los repositorios que se encuentran en la carpeta domain, muy utiles para aplicar estrategias de persistencia de datos y para "traducir" los datos obtenidos a las entidades con las que trabaja la app.
  - **Local:** Archivos que hacen consultas al almacenamiento local de la app.
  - **Model:** Clases utilizadas principalmente para mapear datos remotos a una estructura manejable por la app o viceversa.
  - **Remote:** Archivos que incluyen las llamadas a las diferentes fuentes de datos que puede tener una app
- Domain
  - **Usecase:**
  - **Entity:** Son las clases con las que trabajan las vistas de la app.
  - **Repository:** En la carpeta de domain solo se declaran los "repositorios abstractos" que seran utiizados en la app.
- **Presentation**
  - **bindings:** Clases necesarias para trabajar con la inyeccion de dependencias en GetX
  - **pages:** Clases identificadas generalmente por un `Scaffold` aqui es donde se construyen las vistas principales de la app donde navegaran los usuarios
  - **widgets:** Componentes que pueden ser reutilizados en toda la app para mejorar la claridad del codigo y favorecer la reutilizacion.

## Installation


### Prerequisites

Before you begin, ensure you have the following dependencies and tools installed:

- Flutter version: 3.19.3
1. Clonar repositorio
2. Hacer `Flutter pub get` en directorio raiz
3. Crear `.env` en el directorio raiz con las siguientes variables:
  - MARVEL_PUBLIC_KEY
  - MARVEL_PRIVATE_KEY
4. Hacer `dart run build_runner build` para generar algunos archivos necesarios para la ejecucion
5. Correr la app con `flutter run` en consola o en vscode desde el apartado `run & debug`


