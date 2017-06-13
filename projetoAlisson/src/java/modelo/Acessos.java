package modelo;

public class Acessos {
        private int acessosTotal;
        
        public Acessos(int acessosT){
            this.setAcessosTotal(acessosT);
        }

        public int getAcessosTotal() {
            return acessosTotal;
        }

        public void setAcessosTotal(int acessosTotal) {
            this.acessosTotal = acessosTotal;
        }
}
