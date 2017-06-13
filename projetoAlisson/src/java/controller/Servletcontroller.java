/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; //
import modelo.ComentarioService;
import modelo.Logar;
import modelo.LogarService;
import modelo.Post;
import modelo.PostService;
import modelo.SeguirService;

/**
 *
 * @author Alisson
 */
public class Servletcontroller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servletcontroller</title>");
            out.println("<meta http-equiv=\"refresh\" content=0;url=\"erro.jsp\">");
            out.println("</head>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
            
            String opcao = request.getParameter("opcao");
            
            if(opcao.equals("Logar")){
                
                String usuario = request.getParameter("login");
                String senha = request.getParameter("senha");
                
                LogarService autentificar = new LogarService();
                
                boolean autentificado = autentificar.autenticarUsuario(usuario, senha);
                if(autentificado){      
                    // Código acrescentado
                    HttpSession sessao = request.getSession();
                    // setando um atributo da sessao
                    sessao.setAttribute("login", request.getParameter("login"));
                    // como obtive sucesso, chamo a página principal
                    //
                    
                    // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                    // rd.forward(request, response);
                    
                    String pagina;
                    pagina = "principal.jsp";
                    response.sendRedirect(pagina);

                    System.out.println("Usuario: " +usuario+ ", Senha: "+senha+".");
                }   
                else{
                    System.out.println("Erro!");
                    //RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    //rd.forward(request, response);
                    String pagina;
                    pagina = "erroSenha.jsp";
                    response.sendRedirect(pagina);
                }
            }
            //
            else if(opcao.equals("Logout")) {
			// no logout invalido a sessao
			HttpSession sessao = request.getSession();
			sessao.invalidate();
			// chamo novamente a pagina principal, que deve chamar a página index
			// que ira mostrar o formulario para o usuário logar
                        
                        String pagina;
                        pagina = "index.jsp";
                        response.sendRedirect(pagina);

                        System.out.println("Usuario deslogado!");
            }
            else if(opcao.equals("Pagina do Usuario")){
                        // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                        // rd.forward(request, response);
                        String pagina;
                        System.out.println("Ir para página do Usuário!");
                        pagina = "principal.jsp";
			response.sendRedirect(pagina);
            }
            //
            else if(opcao.equals("Cadastrar Usuario")){
                String us = request.getParameter("nome");
                String email = request.getParameter("email");
                String inf = request.getParameter("informacao");
                String se = request.getParameter("senha");
                String na = request.getParameter("nacionalidade");
                String ocup = request.getParameter("ocupacao");
                String id = request.getParameter("idade");
                String et = request.getParameter("estado");
                
                Locale locale = new Locale("pt","BR");
                GregorianCalendar calendar = new GregorianCalendar();
                
                SimpleDateFormat formatador = new SimpleDateFormat("HH':'mm':'ss",locale);
                System.out.println("HORA: "+formatador.format(calendar.getTime()));

                String hc = formatador.format(calendar.getTime());
                String hm = formatador.format(calendar.getTime());
                
                formatador = new SimpleDateFormat("dd'/'MM'/'yyyy",locale);
                System.out.println("DATA: "+formatador.format(calendar.getTime()));
                
                String dc = formatador.format(calendar.getTime());
                String dm = formatador.format(calendar.getTime());
                
                int idade = Integer.parseInt(id);
                int estado = Integer.parseInt(et);
                
                LogarService lg = new LogarService();
              
                try{  
                    boolean autenticado = lg.inserirUsuario(us, email, se, na, ocup, inf, idade, estado, dc, hc, dm, hm);
                  
                    if(autenticado){
                        // RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                        // rd.forward(request, response);
                        
                        String pagina;
                        pagina = "index.jsp";
			response.sendRedirect(pagina);
                        
                        System.out.println("Usuario Autenticado...");
                    }              
                }catch(Exception e){
                    // RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    // rd.forward(request, response);
                    String pagina;
                    pagina = "erroUsuario.jsp";
                    response.sendRedirect(pagina);
                    System.out.println("ERRO!");
                    e.printStackTrace();
                } 
            }
            else if(opcao.equals("Fazer uma Postagem")){
                // RequestDispatcher rd = request.getRequestDispatcher("cadastrarSugestao.jsp");
                // rd.forward(request, response);
                String pagina;
                pagina = "cadastrarPost.jsp";
		response.sendRedirect(pagina);
                
                System.out.println("Ir para cadastrar Post...");
            }
            else if(opcao.equals("Cadastrar Post")){
                
              String us = request.getParameter("nome");
              String t = request.getParameter("titulo");
              String st = request.getParameter("subtitulo"); 
              String at = request.getParameter("autor");
              String ano = request.getParameter("ano1");
              String cat = request.getParameter("tipos");
              String as = request.getParameter("assunto");
              String pag = request.getParameter("paginas");
              String id = request.getParameter("idioma");
              String anl = request.getParameter("analise");          
              
              Locale locale = new Locale("pt","BR");
              GregorianCalendar calendar = new GregorianCalendar();

              SimpleDateFormat formatador = new SimpleDateFormat("HH':'mm':'ss",locale);
              System.out.println("HORA: "+formatador.format(calendar.getTime()));

              String hora = formatador.format(calendar.getTime());
              String horaM = formatador.format(calendar.getTime());

              formatador = new SimpleDateFormat("HH",locale);
              
              String h = formatador.format(calendar.getTime());
              
              formatador = new SimpleDateFormat("mm",locale);
              
              String mi = formatador.format(calendar.getTime());
              
              formatador = new SimpleDateFormat("ss",locale);
              
              String seg = formatador.format(calendar.getTime());
               
              formatador = new SimpleDateFormat("dd'/'MM'/'yyyy",locale);
              System.out.println("DATA: "+formatador.format(calendar.getTime()));

              String data = formatador.format(calendar.getTime());
              String dataM = formatador.format(calendar.getTime());
              
              formatador = new SimpleDateFormat("yyyy",locale);
              String a = formatador.format(calendar.getTime());
              formatador = new SimpleDateFormat("MM",locale);
              String m = formatador.format(calendar.getTime());
              formatador = new SimpleDateFormat("dd",locale);
              String d = formatador.format(calendar.getTime());
              
              int an = Integer.parseInt(ano);
              int pg = Integer.parseInt(pag);
              
              int anu = Integer.parseInt(a);
              int mis = Integer.parseInt(m);
              int di = Integer.parseInt(d);
              int hour = Integer.parseInt(h);
              int min = Integer.parseInt(mi);
              int segun = Integer.parseInt(seg);
              
              PostService cs = new PostService();
              
              // System.out.println("Data: "+data+", Hora: "+hora+".");
              // System.out.println("Data: "+di+"/"+mis+"/"+anu+", Hora: "+hour+"/"+min+"/"+segun+".");
              
              try{
                  boolean autenticado = cs.inserirPost(us, t, st, at, an, cat, as, pg, id, anl, hora, data, anu, mis, di, hour, min, segun, horaM, dataM);
                  
                  if(autenticado){
                       // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                       // rd.forward(request, response);
                        String pagina;
                        pagina = "principal.jsp";
                        response.sendRedirect(pagina);
                      
                   System.out.println("Post Autenticado!");
                  }
              }catch(Exception e){
                  String pagina;
                  pagina = "erro.jsp";
                  response.sendRedirect(pagina);
                  // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                  System.out.println("Post não Autenticado!");
                  // rd.forward(request, response);
                  e.printStackTrace();
              }       
            }
            else if(opcao.equals("Mostrar")){
                List<Post> listaDePosts = 
                new PostService().getPosts();
                
                System.out.println("Mostrar Postagens!");
                request.setAttribute("posts", listaDePosts);
                RequestDispatcher rd = 
                        request.getRequestDispatcher("index.jsp");

                rd.forward(request, response);
            }
            else if(opcao.equals("Filtrar Categoria")){
                String cat = request.getParameter("tipos");
                
                List<Post> listaDePosts = 
                new PostService().getPosts(cat);

                request.setAttribute("posts", listaDePosts);
                RequestDispatcher rd = 
                       request.getRequestDispatcher("listarFiltro.jsp");
                
                System.out.println("Filtrar por Categoria!");
                rd.forward(request, response);
                // String pagina;
                // pagina = "filtroPosts.jsp";
                // response.sendRedirect(pagina);
            }
            else if(opcao.equals("Filtrar Pesquisa")){
                String pesq = request.getParameter("pesquisa");
                String pesq2 = request.getParameter("pesq");
                
                System.out.println("Filtrar por Pesquisa!");
                List<Post> listaDePosts = null;
                if(pesq.equals("Autor do Livro")){
                    
                    listaDePosts = 
                    new PostService().getPosts4(pesq2);
                }
                else if(pesq.equals("Titulo do Livro")){
                    
                    listaDePosts = 
                    new PostService().getPosts5(pesq2);
                }
                else if(pesq.equals("Assunto do Livro")){
                    
                    listaDePosts = 
                    new PostService().getPosts6(pesq2);
                }
                else if(pesq.equals("Nome do Usuario")){
                    
                    listaDePosts = 
                    new PostService().getPosts2(pesq2);
                }
                
                request.setAttribute("posts", listaDePosts);
                RequestDispatcher rd = 
                       request.getRequestDispatcher("listarFiltro.jsp");

                rd.forward(request, response);
            }    
            else if(opcao.equals("Listar Postagens")){
                // String nome = request.getParameter("nome");
                
                // List<Post> listaDePosts = 
                // new PostService().getPosts2(nome);

                // request.setAttribute("posts", listaDePosts);
                System.out.println("Listar Postagens!");
                String pagina;
                pagina = "listarPost.jsp";
                response.sendRedirect(pagina);
            }
            else if(opcao.equals("Alterar/Excluir Postagens")){
                String pagina;
                System.out.println("Ir para alterar Excluir Postagens!");
                pagina = "alterarExcluirPost.jsp";
                response.sendRedirect(pagina);
            }
            else if(opcao.equals("Excluir")){
                String nome = request.getParameter("nome");
                String data = request.getParameter("data");
                String hora = request.getParameter("hora");
               
                System.out.println(nome);
                System.out.println(data);
                System.out.println(hora);
                
                PostService post = new PostService();
                ComentarioService coment = new ComentarioService();
                
                try{
                  boolean autenticado = post.excluirPost(nome, data, hora);
                  boolean aut = coment.excluirComent2(nome, data, hora);
                  
                  if(autenticado || aut){
                       // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                       // rd.forward(request, response);
                        String pagina;
                        pagina = "principal.jsp";
                        response.sendRedirect(pagina);
                      
                   System.out.println("Post Excluido!");
                  }
                }catch(Exception e){
                    String pagina;
                    pagina = "erro.jsp";
                    response.sendRedirect(pagina);
                    // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                    System.out.println("Post não Excluido!");
                    // rd.forward(request, response);
                    e.printStackTrace();
                } 
            }
            else if(opcao.equals("Alterar")){
                String nome = request.getParameter("nome");
                String data = request.getParameter("data");
                String hora = request.getParameter("hora");
               
                System.out.println(nome);
                System.out.println(data);
                System.out.println(hora);
                
                List<Post> listaDePosts = 
                new PostService().getPosts3(nome, data, hora);
                
                System.out.println("Ir para alterar a Postagem!");
                
                request.setAttribute("posts", listaDePosts);
                RequestDispatcher rd = 
                        request.getRequestDispatcher("alterarPost.jsp");

                rd.forward(request, response);
            }
            else if(opcao.equals("Alterar Postagem")){
                String us = request.getParameter("nome");
                String t = request.getParameter("titulo");
                String st = request.getParameter("subtitulo"); 
                String at = request.getParameter("autor");
                String ano = request.getParameter("ano");
                String cat = request.getParameter("tipos");
                String as = request.getParameter("assunto");
                String pag = request.getParameter("paginas");
                String id = request.getParameter("idioma");
                String anl = request.getParameter("analise");
                String data = request.getParameter("data");
                String hora = request.getParameter("horario");

                int an = Integer.parseInt(ano);
                int pg = Integer.parseInt(pag);
                
                Locale locale = new Locale("pt","BR");
                GregorianCalendar calendar = new GregorianCalendar();
                SimpleDateFormat formatador = new SimpleDateFormat("HH':'mm':'ss",locale);
                System.out.println("HORA: "+formatador.format(calendar.getTime()));
                
                String horaM = formatador.format(calendar.getTime());
                
                formatador = new SimpleDateFormat("dd'/'MM'/'yyyy",locale);
                System.out.println("DATA: "+formatador.format(calendar.getTime()));
                
                String dataM = formatador.format(calendar.getTime());
                
                PostService cs = new PostService();

                System.out.println("Data Modificação: "+dataM+", Hora Modificação: "+horaM+".");

                try{
                    boolean autenticado = cs.alterarPost(us, t, st, at, an, cat, as, pg, id, anl, hora, data, horaM, dataM);

                    if(autenticado){
                         // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                         // rd.forward(request, response);
                          String pagina;
                          pagina = "principal.jsp";
                          response.sendRedirect(pagina);

                     System.out.println("Postagem Alterada!");
                    }
                }catch(Exception e){
                    String pagina;
                    pagina = "erro.jsp";
                    response.sendRedirect(pagina);
                    // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                    System.out.println("Postagem não Alterada!");
                    // rd.forward(request, response);
                    e.printStackTrace();
                }       
            }
            else if(opcao.equals("Alterar Conta")){
                String pagina;
                System.out.println("Ir para alterar Conta!");
                pagina = "alterarUsuario.jsp";
                response.sendRedirect(pagina);    
            }
            else if(opcao.equals("Alterar Usuario")){
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String senha = request.getParameter("senha"); 
                String nac = request.getParameter("nacionalidade");
                String ocup = request.getParameter("ocupacao");
                String inf = request.getParameter("informacao");
                String id = request.getParameter("idade");
                String dc = request.getParameter("data");
                String hc = request.getParameter("horario");
                String et = request.getParameter("estado");
                
                int idade = Integer.parseInt(id);
                int estado = Integer.parseInt(et);
                
                Locale locale = new Locale("pt","BR");
                GregorianCalendar calendar = new GregorianCalendar();
                SimpleDateFormat formatador = new SimpleDateFormat("HH':'mm':'ss",locale);
                System.out.println("HORA: "+formatador.format(calendar.getTime()));
                
                String hm = formatador.format(calendar.getTime());
                
                formatador = new SimpleDateFormat("dd'/'MM'/'yyyy",locale);
                System.out.println("DATA: "+formatador.format(calendar.getTime()));
                
                String dm = formatador.format(calendar.getTime());
                
                System.out.println("Data Modificação: "+dm+", Hora Modificação: "+hm+".");
                
                LogarService cs = new LogarService();
                
                try{
                    boolean autenticado = cs.alterarUsuario(nome, senha, email, nac, ocup, inf, idade, estado, 
                            dc, hc, dm, hm);

                    if(autenticado){
                         // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                         // rd.forward(request, response);
                          String pagina;
                          pagina = "principal.jsp";
                          response.sendRedirect(pagina);

                     System.out.println("Usuario Alterado!");
                    }
                }catch(Exception e){
                    String pagina;
                    pagina = "erro.jsp";
                    response.sendRedirect(pagina);
                    // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                    System.out.println("Usuario não Alterado!");
                    // rd.forward(request, response);
                    e.printStackTrace();
                } 
            }
            else if(opcao.equals("Pagina de Cadastro")){
                String pagina;
                System.out.println("Ir para Página de Cadastro!");
                pagina = "cadastrarUsuario.jsp";
                response.sendRedirect(pagina);
            }
            else if(opcao.equals("Pagina Principal")){
                String pagina;
                pagina = "index.jsp";
                System.out.println("Ir para Página Principal da Aplicação!");
                response.sendRedirect(pagina);
            }
            else if(opcao.equals("Pagina de Filtro")){
                String pagina;
                pagina = "filtroPosts.jsp";
                System.out.println("Ir para Página de Filtro!");
                response.sendRedirect(pagina);
            }
            else if(opcao.equals("Mostrar Postagem")){
                String nome = request.getParameter("nome");
                String data = request.getParameter("data");
                String hora = request.getParameter("hora");
               
                System.out.println(nome);
                System.out.println(data);
                System.out.println(hora);
                
                System.out.println("Mostrar Postagem!");
                List<Post> listaDePosts = 
                new PostService().getPosts3(nome, data, hora);

                request.setAttribute("posts", listaDePosts);
                RequestDispatcher rd = 
                        request.getRequestDispatcher("verPost.jsp");
                
                rd.forward(request, response);
            }
            else if(opcao.equals("Mostrar Postagem Usuario")){
                String nome = request.getParameter("nome");
                String data = request.getParameter("data");
                String hora = request.getParameter("hora");
               
                System.out.println(nome);
                System.out.println(data);
                System.out.println(hora);
                
                System.out.println("Mostrar Postagem do Usuario!");
                List<Post> listaDePosts = 
                new PostService().getPosts3(nome, data, hora);

                request.setAttribute("posts", listaDePosts);
                RequestDispatcher rd = 
                        request.getRequestDispatcher("verPostLog.jsp");
                
                rd.forward(request, response);
            }
            else if(opcao.equals("Ver Usuario")){
                String nome = request.getParameter("nome");
                
                List<Post> listaDePosts = 
                new PostService().getPosts2(nome);
                
                System.out.println("Ver Usuario!");
                
                List<Logar> usuario = new LogarService().getUsuario(nome);
                
                request.setAttribute("posts", listaDePosts);
                request.setAttribute("usuario", usuario);
                
                RequestDispatcher rd = 
                        request.getRequestDispatcher("verUsuario.jsp");

                rd.forward(request, response);
            }
            else if(opcao.equals("Follow")){
                String nomeS = request.getParameter("nome");
                String nomeL = request.getParameter("nomeL");
                
                SeguirService seg = new SeguirService();
                
                try{
                    boolean autentificado = seg.Seguir(nomeL, nomeS);
                
                    if(autentificado){     
                        String pagina;
                        pagina = "principal.jsp";
                        response.sendRedirect(pagina);

                        System.out.println("Autor Seguido!");
                    }      
                }catch(Exception e){
                    System.out.println("Erro ao Seguir!");
                    //RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    //rd.forward(request, response);
                    String pagina;
                    pagina = "erro.jsp";
                    response.sendRedirect(pagina);
                    e.printStackTrace();
                }
            }
            else if(opcao.equals("unFollow")){
                String nomeS = request.getParameter("nome");
                String nomeL = request.getParameter("nomeL");
                
                SeguirService seg = new SeguirService();
                
                try{
                    boolean autentificado = seg.deSeguir(nomeL, nomeS);
                
                    if(autentificado){     
                        String pagina;
                        pagina = "principal.jsp";
                        response.sendRedirect(pagina);

                        System.out.println("unFollow!");
                    }   
                }catch(Exception e){
                    System.out.println("Erro ao unFollow!");
                    //RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    //rd.forward(request, response);
                    String pagina;
                    pagina = "erro.jsp";
                    response.sendRedirect(pagina);
                    e.printStackTrace();
                }
            }
            else if(opcao.equals("Mostrar Usuarios")){
                String pagina;
                pagina = "verSeg.jsp";
                System.out.println("Mostrar usuários que você segue!");
                response.sendRedirect(pagina);
            }
            else if(opcao.equals("Listar Usuarios")){
                String pagina;
                System.out.println("Lista de usuários cadastrados na página!");
                pagina = "listarUsuariosLog.jsp";
                response.sendRedirect(pagina);   
            }
            else if(opcao.equals("Ver Inf Usuario")){
                String nome = request.getParameter("nome");
                
                List<Post> listaDePosts = 
                new PostService().getPosts2(nome);
                
                List<Logar> usuario = new LogarService().getUsuario(nome);
                
                request.setAttribute("posts", listaDePosts);
                request.setAttribute("usuario", usuario);
                
                System.out.println("Ver Usuario!");
                
                RequestDispatcher rd = 
                        request.getRequestDispatcher("verUsuarioLog.jsp");

                rd.forward(request, response);
            }
            else if(opcao.equals("Comentar Postagem")){
                String us = request.getParameter("nome");
                String usA = request.getParameter("nomeA");
                String dataP = request.getParameter("dataP");
                String horaP = request.getParameter("horarioP");
                String coment = request.getParameter("comentario");
                
                Locale locale = new Locale("pt","BR");
                GregorianCalendar calendar = new GregorianCalendar();
                SimpleDateFormat formatador = new SimpleDateFormat("HH':'mm':'ss",locale);
                System.out.println("HORA: "+formatador.format(calendar.getTime()));

                String horaC = formatador.format(calendar.getTime());
                
                formatador = new SimpleDateFormat("dd'/'MM'/'yyyy",locale);
                System.out.println("DATA: "+formatador.format(calendar.getTime()));
                
                String dataC = formatador.format(calendar.getTime());
                
                formatador = new SimpleDateFormat("yyyy",locale);
                String a = formatador.format(calendar.getTime());
                formatador = new SimpleDateFormat("MM",locale);
                String m = formatador.format(calendar.getTime());
                formatador = new SimpleDateFormat("dd",locale);
                String d = formatador.format(calendar.getTime());
                
                formatador = new SimpleDateFormat("HH",locale);           
                String h = formatador.format(calendar.getTime());
                formatador = new SimpleDateFormat("mm",locale);
                String mi = formatador.format(calendar.getTime());
                formatador = new SimpleDateFormat("ss",locale);
                String seg = formatador.format(calendar.getTime());                
                
                int anu = Integer.parseInt(a);
                int mis = Integer.parseInt(m);
                int di = Integer.parseInt(d);
                int hour = Integer.parseInt(h);
                int min = Integer.parseInt(mi);
                int segun = Integer.parseInt(seg);

                ComentarioService cs = new ComentarioService();

                System.out.println("Data do Comentário: "+dataC+", Hora: "+horaC+".");
                System.out.println("Data do Comentário: "+di+"/"+mis+"/"+anu+", Hora: "+hour+"/"+min+"/"+segun+".");

                try{
                    boolean autenticado = cs.inserirComent(usA, us, dataP, horaP, dataC, horaC, anu, mis, di, hour, min, segun, coment);

                    if(autenticado){
                            System.out.println("Postagem Comentada!");
                         // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                         // rd.forward(request, response);
                          String pagina;
                          pagina = "index.jsp";
                          response.sendRedirect(pagina);
                    }
                }catch(Exception e){
                    System.out.println("Postagem não Comentada!");
                    String pagina;
                    pagina = "erro.jsp";
                    response.sendRedirect(pagina);
                    // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                    // rd.forward(request, response);
                    e.printStackTrace();
                }
            }
            else if(opcao.equals("Excluir Comentario")){
                String us = request.getParameter("nome");
                String dataC = request.getParameter("data");
                String horaC = request.getParameter("horario"); 
                
                System.out.println(us);
                System.out.println(dataC);
                System.out.println(horaC);
                
                ComentarioService coment = new ComentarioService();
                
                try{
                  boolean autenticado = coment.excluirComent(us, dataC, horaC);
                  
                  if(autenticado){
                      System.out.println("Comentário Excluido!");
                       // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                       // rd.forward(request, response);
                        String pagina;
                        pagina = "index.jsp";
                        response.sendRedirect(pagina);
                  }
                }catch(Exception e){
                    System.out.println("Comentário não Excluido!");
                    String pagina;
                    pagina = "erro.jsp";
                    response.sendRedirect(pagina);
                    // RequestDispatcher rd = request.getRequestDispatcher("principal.jsp");
                    
                    // rd.forward(request, response);
                    e.printStackTrace();
                } 
            }
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
