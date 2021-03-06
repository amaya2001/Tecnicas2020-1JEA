#include "Archivos.h"

FILE* abrirArchivo(char path[], char modo[]) {
	if (path != NULL) {
		FILE* pFile = fopen(path, modo);
		return pFile;
	}
	else{
		printf("No se pudo abrir correctamente el archivo");
	}
	return NULL;	
}


void leerArchivoFScanf(FILE* pFile) {
	//Sirve para poner el apuntador nuevamente al inicio del archivo
	rewind(pFile);
	empleado_t empleado;
	while (!feof(pFile)) {
		fscanf(pFile, "%s\t%d\t%f\n",empleado.nombre_empleado, 
			&empleado.edad,	&empleado.salario);
		printf("\nValores leidos: nombre: %s, Edad: %d, Salario:%6.0f\n",
				empleado.nombre_empleado, empleado.edad, empleado.salario);
	}
}

void guardarArchivoFPrint(FILE* pFile, int numEmpleados) {
	int cont = 0;
	empleado_t empleado;
	while (cont < numEmpleados) {
		printf("Ingrese un nombre:\n ");
		scanf("%s", empleado.nombre_empleado);
		printf("Ingrese la edad:\n ");
		scanf("%d", &empleado.edad);
		printf("Ingrese el salario:\n ");
		scanf("%f", &empleado.salario);
		//Se imprime en el archivo
		fprintf(pFile, "%s\t%d\t%f\n", empleado.nombre_empleado, empleado.edad,
				empleado.salario);
		cont++;
	}
}

void leerConFGetc(FILE* pFile) {
	char caracter;
	printf("\nEl contenido del archivo de prueba es \n\n");
	//Sirve para poner el apuntador nuevamente al inicio del archivo
	rewind(pFile);
	do {
		caracter=fgetc(pFile);
		printf("%c",caracter);	
	}while(!feof(pFile));
}

int contarNumLineas(FILE* pFile) {
   int cont = 0;
   char c;
   while(!feof(pFile)){
      c = fgetc(pFile);
      if(c=='\n'){
         cont ++;
      }
   }
   return cont;
}

void leerConFGets(FILE* pFile) {
	char caracteres[100];
	printf("\nEl contenido del archivo de prueba es \n\n");
        rewind(pFile);
        while(!feof(pFile)){
           fgets( caracteres, 100, pFile);
           printf("%s", caracteres);
        }
}


void guardarFPuts(FILE * pFile){
	// Imprimir con Fputs en un archivo un texto que tenga el siguiente contenido 

	/*El lenguaje C es un lenguaje de programación de propósito general, 
		es uno de los más rápidos y potentes que existen. 
	El lenguaje C ha demostrado ser un lenguaje extremadamente eficaz, hasta como para crear sistemas operativos, como Linux que fue creado en este lenguaje*/
}
