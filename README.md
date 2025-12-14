
# Proyecto 2: Tipos dependientes y demostraciones computacionales

## Integrantes:

### López Rodríguez Leslie Renée - 321171915
### Marentes Mosqueda Bruno Sebastián - 321260606

Este proyecto implementa una demostración formal en Agda para 
verificar que la función de invertir listas (reverse) preserva 
la longitud de la lista original (length).



## Instalación de Agda


### 1. Visual Studio Code y GHC
Se debe tener instalado Visual Studio  junto con GHC y Cabal.
Después de la instalación lo puedes verificar con:

#### ghc --version
#### cabal --version



### 2. Instalar Agda 
En nuestro caso utilizamos Windows y para instalar Agda usamos Cabal,
ejecutando el siguiente comando en la terminal:
#### cabal install Agda

y lo podemos comprobar se instaló correctamente instalado con:
#### agda --version



### 3. Configuración del stdlib

Agda necesita la biblioteca para poder trabajar, entonces descargamos el .zip
con la versión v2.3 de Agda

#### https://github.com/agda/agda-stdlib/releases

Después de descargarlo, se le debe decir a Agda la ruta del archivo
.agda-lib que corresponde a la biblioteca que necesitamos. Esto puede hacerse
creando o editando (ponemos la ruta donde se encuentra el .agda-lib) los archivos:

#### .../.agda/libraries

y

#### .../.agda/defaults



### 4. Configurar Agda en Visual Studio

Escribe:
#### Ctrl + Shift + P 

y luego escribe:
##### Preferences: Open User Settings (JSON)

te abrirá una nueva ventana y dentro de las llaves, agregale el siguiente
texto sin borrar nada de lo que ya esta

#### texto:

,
"agda.path": "C:\\cabal\\bin\\agda.exe",
"agda.languageServerEnabled": false,
"agda.mode": "auto",
"agda.linterEnabled": true,
"terminal.integrated.env.windows": {
    "PATH": "C:\\cabal\\bin;${env:PATH}"
}


después de todo, cierra el Visual Studio y ya debería funcionar todo bien \^o^/



### 5. Ejecución de Agda en Visual Studio 

Para trabajar con Agda en Visual Studio se debe instalar la
extensión Agda Mode.

Los archivos .agda se "corren" con los comandos:

#### Ctrl + c

y luego

#### Ctrl + l


