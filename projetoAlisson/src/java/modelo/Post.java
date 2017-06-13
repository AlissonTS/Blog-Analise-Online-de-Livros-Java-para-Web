package modelo;

public class Post {
    
        private String usuario;
        private String titulo;
        private String subtitulo;
        private String autorlivro; 
        private int anolivro;
        private String categoria;
        private String assunto;
        private int paginas;
        private String idioma;
        private String analise;
        private String hora;
        private String data;
        private int ano;
        private int mes;
        private int dia;
        private int hora1;
        private int minuto;
        private int segundo;
        private String horaM;
        private String dataM;
        
        public Post(String usuario, String titulo, String subtitulo, String autorlivro, int anolivro, String categoria, String assunto, 
                int paginas, String idioma, String analise, String hora, String data, int ano, 
                int mes, int dia, int hora1, int minuto, int segundo, String horaM, String dataM){
            this.usuario = usuario;
            this.titulo = titulo;
            this.subtitulo = subtitulo;
            this.autorlivro = autorlivro;
            this.anolivro = anolivro;
            this.categoria = categoria;
            this.assunto = assunto;
            this.paginas = paginas;
            this.idioma = idioma;
            this.analise = analise;
            this.hora = hora;
            this.data = data;
            this.ano = ano;
            this.mes = mes;
            this.dia = dia;
            this.hora = hora;
            this.minuto = minuto;
            this.segundo = segundo;
            this.horaM = horaM;
            this.dataM = dataM;
        }
        public Post(String usuario, String titulo, String subtitulo, String autorlivro, int anolivro, String categoria, String assunto, 
                int paginas, String idioma, String analise, String hora, String data, String horaM, String dataM){
            this.usuario = usuario;
            this.titulo = titulo;
            this.subtitulo = subtitulo;
            this.autorlivro = autorlivro;
            this.anolivro = anolivro;
            this.categoria = categoria;
            this.assunto = assunto;
            this.paginas = paginas;
            this.idioma = idioma;
            this.analise = analise;
            this.hora = hora;
            this.data = data;
            this.dataM = dataM;
            this.horaM = horaM;
        }
        
        public String getUsuario() {
            return usuario;
        }

        public void setUsuario(String usuario) {
            this.usuario = usuario;
        }

        public String getTitulo() {
            return titulo;
        }

        public void setTitulo(String titulo) {
            this.titulo = titulo;
        }

        public String getSubtitulo() {
            return subtitulo;
        }

        public void setSubtitulo(String subtitulo) {
            this.subtitulo = subtitulo;
        }

        public String getAutorlivro() {
            return autorlivro;
        }

        public void setAutorlivro(String autorlivro) {
            this.autorlivro = autorlivro;
        }

        public int getAnolivro() {
            return anolivro;
        }

        public void setAnolivro(int anolivro) {
            this.anolivro = anolivro;
        }

        public String getCategoria() {
            return categoria;
        }

        public void setCategoria(String categoria) {
            this.categoria = categoria;
        }

        public String getAssunto() {
            return assunto;
        }

        public void setAssunto(String assunto) {
            this.assunto = assunto;
        }

        public int getPaginas() {
            return paginas;
        }

        public void setPaginas(int paginas) {
            this.paginas = paginas;
        }

        public String getIdioma() {
            return idioma;
        }

        public void setIdioma(String idioma) {
            this.idioma = idioma;
        }

        public String getAnalise() {
            return analise;
        }

        public void setAnalise(String analise) {
            this.analise = analise;
        }

        public String getHora() {
            return hora;
        }

        public void setHora(String hora) {
            this.hora = hora;
        }

        public String getData() {
            return data;
        }

        public void setData(String data) {
            this.data = data;
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

        public int getHora1() {
            return hora1;
        }

        public void setHora1(int hora1) {
            this.hora1 = hora1;
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

        public String getHoraM() {
            return horaM;
        }

        public void setHoraM(String horaM) {
            this.horaM = horaM;
        }

        public String getDataM() {
            return dataM;
        }

        public void setDataM(String dataM) {
            this.dataM = dataM;
        }
}
