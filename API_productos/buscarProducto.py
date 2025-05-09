import requests
import json

def extraer_campo(json_str, campo):
    try:
        data = json.loads(json_str)
        return str(data.get(campo, "No encontrado"))
    except json.JSONDecodeError:
        return "No encontrado"

def main():
    opcion = 1  # Inicialización de la variable opcion
    
    while opcion == 1:
        codigo = input("\nIntroduce el código del producto: ").strip()
        
        if not codigo:
            print("Código no puede estar vacío.")
            continue
            
        try:
            api_url = f"http://localhost/API_productos/buscar_producto.php?codigo={codigo}"
            
            response = requests.get(api_url, headers={"Accept": "application/json"})
            
            if response.status_code == 200:
                response_data = response.text
                
                if '"status":200' in response_data:
                    nombre = extraer_campo(response_data, "producto_nombre")
                    precio = extraer_campo(response_data, "producto_precio")
                    imagen = extraer_campo(response_data, "producto_imagen")
                    
                    print("Producto encontrado...")
                    print(f"  Nombre: {nombre}")
                    print(f"  Precio: ${precio}")
                    print(f"  Imagen: {imagen}")
                else:
                    print("Producto no encontrado.")
            else:
                print(f"Error en la solicitud: {response.status_code}")
                
        except Exception as e:
            print("Error al conectar con la API:")
            print(str(e))
            
        input_opcion = input("¿Deseas consultar otro artículo? (1 = Sí, 2 = No): ").strip()
        opcion = 1 if input_opcion == "1" else 2
    
    print("Fin de consulta")

if __name__ == "__main__":
    main()