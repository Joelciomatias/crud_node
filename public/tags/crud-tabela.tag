<crud-tabela>
    <button class="ui primary button" onclick="{ listarDados }"><i class="list icon"></i>Listar Pacientes</button>
    <button class="ui secondary button"  onclick="#" type="submit"><i class="edit icon"></i>Alterar Paciente</button>
    <button class="ui negative button"  onclick="#" type="submit"><i class="trash icon"></i>Excluir Paciente</button>
    <div class="ui container">
        <table if="{ typeof opts.comentarios != 'undefined' }" class="ui celled table">
            <thead>
                <tr>
                <th>Nome</th>
                <th>Nascimento</th>
                <th>Endereço</th>
                <th>Telefone</th>
                <th>Profissão</th>
                <th>Comentário</th>
                <th>id</th>
                 <th>button</th>
                </tr>
            </thead>
            <tbody>
                <tr each="{ comment in opts.comentarios }">
                    <td>{ comment.name }</td>
                    <td>{ formataData(comment.nascimento) }</td>
                    <td>{ comment.endereco }</td>
                    <td>{ comment.telefone }</td>
                    <td>{ comment.profissao }</td>
                    <td>{ comment.comment}</td>
                    <td>{ comment.id}</td>
                    <td>  
                       <div class="ui icon buttons">
                            <button type="submit" onclick="{ alterarPaciente }" class="ui black button">
                              <i class="edit icon"></i><a class="scroll" href="#comments">
                            </button>
                            <button type="submit" data-commentid="{ comment.id }" onclick="{ excluirPaciente }" class="ui red button">
                                <i class="trash icon"></i>
                            </button>
                       </div>                 
                    <td>
            </tbody>
        </table>
        
    </div>
    <script>   

        this.listarDados = function () {
            dpd.comments.get(function (result, erro) {
                if(erro) 
                
                    return console.log(erro);
                opts.comentarios = result;
                riot.update();
            });
        }

        this.excluirPaciente = function (event){
             
           
           console.log(event.target.dataset);
        }  
          
        this.alterarPaciente = function (event){
             
           
           console.log("alterar");
        }    
    </script>
</crud-tabela>
