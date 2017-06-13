package modelo;

public class Comentario {
        private String usuario;
        private String usuarioC;
        private String data;
        private String horario;
        private String dataC;
        private String horarioC;
        private int ano;
        private int mes;
        private int dia;
        private int hora;
        private int minuto;
        private int segundo;
        private String comentario;
        
        public Comentario(String u, String uC, String d, String h, String dC, String hC, int a, int m, int di, int hr, int min, int seg, String coment){
            this.usuario = u;
            this.usuarioC = uC;
            this.data = d;
            this.horario = h;
            this.dataC = dC;
            this.horarioC = hC;
            this.ano = a;
            this.mes = m;
            this.dia = di;
            this.hora = hr;
            this.minuto = min;
            this.segundo = seg;
            this.comentario = coment;
        }
        
        public String getUsuario() {
            return usuario;
        }

        public void setUsuario(String usuario) {
            this.usuario = usuario;
        }

        public String getUsuarioC() {
            return usuarioC;
        }

        public void setUsuarioC(String usuarioC) {
            this.usuarioC = usuarioC;
        }

        public String getData() {
            return data;
        }

        public void setData(String data) {
            this.data = data;
        }

        public String getHorario() {
            return horario;
        }

        public void setHorario(String horario) {
            this.horario = horario;
        }

        public String getDataC() {
            return dataC;
        }

        public void setDataC(String dataC) {
            this.dataC = dataC;
        }

        public String getHorarioC() {
            return horarioC;
        }

        public void setHorarioC(String horarioC) {
            this.horarioC = horarioC;
        }

        public int getAno() {
            return ano;
        }

        public void setAno(int ano) {
            this.ano = ano;
        }

        public int getMes() {
            return mes;
        }

        public void setMes(int mes) {
            this.mes = mes;
        }

        public int getDia() {
            return dia;
        }

        public void setDia(int dia) {
            this.dia = dia;
        }

        public int getHora() {
            return hora;
        }

        public void setHora(int hora) {
            this.hora = hora;
        }

        public int getMinuto() {
            return minuto;
        }

        public void setMinuto(int minuto) {
            this.minuto = minuto;
        }

        public int getSegundo() {
            return segundo;
        }

        public void setSegundo(int segundo) {
            this.segundo = segundo;
        }

        public String getComentario() {
            return comentario;
        }

        public void setComentario(String comentario) {
            this.comentario = comentario;
        }
}
