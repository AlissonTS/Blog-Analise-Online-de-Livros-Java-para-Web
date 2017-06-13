package modelo;


public class Logar {
            private String usuario;
            private String senha;
            private String emailUsuario;
            private String nacionalidade;
            private String ocupacao;
            private String informacao;
            private String horaC;
            private String dataC;
            private String horaM;
            private String dataM;
            private int idade;
            private int estadoC;
            
            public Logar(String u, String s, String e, String n, String o, String inf, 
                    String hc, String dc, String hm, String dm, int id, int estado){
                this.usuario = u;
                this.senha = s;
                this.emailUsuario = e;
                this.nacionalidade = n;
                this.ocupacao = o;
                this.informacao = inf;
                this.horaC = hc;
                this.dataC = dc;
                this.horaM = hm;
                this.dataM = dm;
                this.idade = id;
                this.estadoC = estado;
            }
              
            public String getUsuario() {
                return usuario;
            }

            public void setUsuario(String usuario) {
                this.usuario = usuario;
            }

            public String getSenha() {
                return senha;
            }

            public void setSenha(String senha) {
                this.senha = senha;
            }

            public String getEmailUsuario() {
                return emailUsuario;
            }

            public void setEmailUsuario(String emailUsuario) {
                this.emailUsuario = emailUsuario;
            }

            public String getNacionalidade() {
                return nacionalidade;
            }

            public void setNacionalidade(String nacionalidade) {
                this.nacionalidade = nacionalidade;
            }

            public String getOcupacao() {
                return ocupacao;
            }

            public void setOcupacao(String ocupacao) {
                this.ocupacao = ocupacao;
            }

            public String getInformacao() {
                return informacao;
            }

            public void setInformacao(String informacao) {
                this.informacao = informacao;
            }

            public String getHoraC() {
                return horaC;
            }

            public void setHoraC(String horaC) {
                this.horaC = horaC;
            }

            public String getDataC() {
                return dataC;
            }

            public void setDataC(String dataC) {
                this.dataC = dataC;
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

            public int getIdade() {
                return idade;
            }

            public void setIdade(int idade) {
                this.idade = idade;
            }

            public int getEstadoC() {
                return estadoC;
            }

            public void setEstadoC(int estadoC) {
                this.estadoC = estadoC;
            }
}
