package co.edu.konradlorenz.modelo;

public class Usuario {

    private int id;  // ← AGREGAR ESTO
    private int identificacion;
    private String nombre;
    private String apellido;
    private String email;
    private String telefono;
    private String usuario;
    private String clave;
    private int perfil;

    // Constructor vacío
    public Usuario() {
    }

    // ← AGREGAR estos dos métodos
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // ... el resto de tus getters y setters
    public int getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(int identificacion) {
        this.identificacion = identificacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getPerfil() {
        return perfil;
    }

    public void setPerfil(int perfil) {
        this.perfil = perfil;
    }
}
