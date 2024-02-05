
package interfaces;
import modelo.*;
import java.util.*;
public interface Itienda {
    List<categoria> listCat();
    List<producto> lisProducto(int id);
    producto busProducto(int id);
    UserCliente busCli(String usr);
    void grabaFac(String id_cliente, List<compra> lista);
}