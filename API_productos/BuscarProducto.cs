using System;
using System.Net;
using System.IO;
using System.Text;

class BuscarProducto
{
    static void Main()
    {
        int opcion = 1; // Inicialización de la variable opcion

        do
        {
            Console.Write("\nIntroduce el código del producto: ");
            string codigo = Console.ReadLine().Trim();

            if (string.IsNullOrEmpty(codigo))
            {
                Console.WriteLine("Código no puede estar vacío.");
                continue;
            }

            try
            {
                string apiUrl = "http://localhost/API_productos/buscar_producto.php?codigo=" + codigo;
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(apiUrl);
                request.Method = "GET";
                request.Accept = "application/json";

                using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                using (Stream stream = response.GetResponseStream())
                using (StreamReader reader = new StreamReader(stream))
                {
                    string responseText = reader.ReadToEnd();

                    if (responseText.Contains("\"status\":200"))
                    {
                        string nombre = ExtraerCampo(responseText, "producto_nombre");
                        string precio = ExtraerCampo(responseText, "producto_precio");
                        string imagen = ExtraerCampo(responseText, "producto_imagen");

                        Console.WriteLine("Producto encontrado:");
                        Console.WriteLine("Nombre: " + nombre);
                        Console.WriteLine("Precio: $" + precio);
                        Console.WriteLine("Imagen: " + imagen);
                    }
                    else
                    {
                        Console.WriteLine("Producto no encontrado.");
                    }
                }
            }
            catch (WebException ex)
            {
                Console.WriteLine("Error al conectar con la API:");
                Console.WriteLine(ex.Message);
            }

            Console.Write("¿Deseas consultar otro artículo? (1 = Sí, 2 = No): ");
            string input = Console.ReadLine().Trim();
            opcion = input == "1" ? 1 : 2;

        } while (opcion == 1);

        Console.WriteLine("Fin de consulta");
    }

    private static string ExtraerCampo(string json, string campo)
    {
        string clave = "\"" + campo + "\":\"";
        int inicio = json.IndexOf(clave);
        if (inicio == -1) return "No encontrado";

        inicio += clave.Length;
        int fin = json.IndexOf("\"", inicio);
        if (fin == -1) return "No encontrado";

        return json.Substring(inicio, fin - inicio);
    }
}