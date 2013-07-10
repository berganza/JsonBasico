//
//  ViewController.m
//  JsonBasico
//
//  Created by LLBER on 10/07/13.
//  Copyright (c) 2013 LLBER. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



//En Xcode podemos cargar JSON a partir de tres maneras:
//    (1) Un archivo alojado en el proyecto de Xcode (Bundle)
//    (2) Leerlo directamente desde Internet
//    (3) Creando nuestro propio uso de NSDictionary, NSArray y NSString.




//  (1) ***************************************************
- (IBAction)local:(id)sender {
    
    // Suponemos que tenemos un archivo en local de tipo Json y le damos una ruta de acceso
    NSString *nombreArchivo = [[NSBundle mainBundle] pathForResource:@"ejemplo" ofType:@"json"];
    // Leemos un archivo json en local: ejemplo.json

    // Podemos incluir el tipo de error
    NSError *error = nil; 

    // Una vez que tenemos la ruta, creamos un puntero al objeto NSData para cargar el archivo en un objeto (NSData) llamado JSONDatos
    NSData *JSONDatos = [NSData dataWithContentsOfFile:nombreArchivo options:NSDataReadingMappedIfSafe error:&error];
    
    NSLog(@"%@",JSONDatos);
}


//*********************************************************



//  (2) ***************************************************
- (IBAction)internet:(id)sender {
    
    // Le damos la ruta a la dirección que tenga el archivo en Internet
    NSURL *rutaInternet = [NSURL URLWithString:@"http://nombreDeLaDireccionEnInternet=json"];

    // Y lo podemos convertir a objeto de la misma manera:

    // Podemos incluir el tipo de error
    NSError *error = nil;

    // Esto carga el archivo json de la web en un objeto NSData al que llamamos JSONDatos
    NSData *JSONDatos = [NSData dataWithContentsOfURL:rutaInternet options:NSDataReadingMappedIfSafe error:&error];
    
    NSLog(@"%@",JSONDatos);
    
}



//*********************************************************

//  (3) ***************************************************
    //Para crear nuestro propio JSON en Xcode, tendremos que crear primero un NSDictionary o NSArray para convertirlo en json con "NSJSONSerialization dataWithJSONObject:".
- (IBAction)crearPropio:(id)sender {
    
    NSError *error = nil; // error

    NSDictionary *diccionario = [[NSDictionary alloc]init]; // ejemplo con diccionario
    
    NSData *JSONDatos = [NSJSONSerialization dataWithJSONObject:diccionario
                         // Convertimos los datos de NSString, NSArray o NSDictionary a JSON
                                                        options:NSJSONWritingPrettyPrinted
                                                          error:&error];
    
    // Convertimos el JSON en algo con lo que Xcode pueda trabajar transformándolo en un objeto de clase con el método "NSJSONSerialization" llamada "JSONObjectWithData:"
    
    id JSONObject = [NSJSONSerialization JSONObjectWithData:JSONDatos
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    // Una vez tenemos nuestro objeto JSON transformado en algo con lo que podemos trabajar en Xcode, podemos utilizar la introspección para saber lo que tenemos y luego extraer el contenido, como lo hariamos normalmente desde una NSDictionary o NSArray.
    
    NSLog(@"%@",JSONObject);
}
//*********************************************************










- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];    
}


@end
