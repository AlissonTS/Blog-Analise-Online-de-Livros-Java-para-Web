package modelo;

public class Seguir {
        private String usuarioL;
        private String usuarioS;

        public Seguir(String l, String s){
            this.usuarioL = l;
            this.usuarioS = s;
        }
        
        public String getUsuarioL() {
            return usuarioL;
        }

        public void setUsuarioL(String usuarioL) {
            this.usuarioL = usuarioL;
        }

        public String getUsuarioS() {
            return usuarioS;
        }

        public void setUsuarioS(String usuarioS) {
            this.usuarioS = usuarioS;
        }
}
