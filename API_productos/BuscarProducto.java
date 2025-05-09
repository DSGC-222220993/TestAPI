import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

public class BuscarProducto {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int opcion = 1;  // Inicialización de la variable opcion

        do {
            System.out.print("\nIntroduce el código del producto: ");
            String codigo = scanner.nextLine().trim();

            if (codigo.isEmpty()) {
                System.out.println("Código no puede estar vacío.");
                continue;
            }

            try {
                String apiUrl = "http://localhost/API_productos/buscar_producto.php?codigo=" + codigo;
                URL url = new URL(apiUrl);

                HttpURLConnection con = (HttpURLConnection) url.openConnection();
                con.setRequestMethod("GET");
                con.setRequestProperty("Accept", "application/json");

                int status = con.getResponseCode();
                InputStream inputStream = (status < 400) ? con.getInputStream() : con.getErrorStream();

                BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
                StringBuilder responseText = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    responseText.append(line);
                }
                reader.close();
                con.disconnect();

                String response = responseText.toString();

                if (response.contains("\"status\":200")) {
                    String nombre = extraerCampo(response, "producto_nombre");
                    String precio = extraerCampo(response, "producto_precio");
                    String imagen = extraerCampo(response, "producto_imagen");

                    System.out.println("Producto encontrado:");
                    System.out.println("Nombre: " + nombre);
                    System.out.println("Precio: $" + precio);
                    System.out.println("Imagen: " + imagen);
                } else {
                    System.out.println("Producto no encontrado.");
                }

            } catch (Exception e) {
                System.out.println("Error al conectar con la API:");
                e.printStackTrace();
            }

            System.out.print("¿Deseas consultar otro artículo? (1 = Sí, 2 = No): ");
            String input = scanner.nextLine().trim();
            opcion = input.equals("1") ? 1 : 2;

        } while (opcion == 1);

        scanner.close();  // Cerrar el scanner al final del programa

        System.out.println("Fin de consulta");
    }

    private static String extraerCampo(String json, String campo) {
        String clave = "\"" + campo + "\":\"";
        int inicio = json.indexOf(clave);
        if (inicio == -1) return "No encontrado";

        inicio += clave.length();
        int fin = json.indexOf("\"", inicio);
        if (fin == -1) return "No encontrado";

        return json.substring(inicio, fin);
    }
}
