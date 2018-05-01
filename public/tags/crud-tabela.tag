<crud-tabela>
    <button class="ui primary button" onclick="{ listarDados }"><i class="list icon"></i>Lista Paciente</button>
    <div class="ui divider"></div>
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
                <th>Editar</th>
                </tr>
            </thead>
            <tbody>
                <tr each="{ comment in opts.comentarios }">
                    <td>{ comment.name }</td>
                    <td>{ formataDataParaFormulario(comment.nascimento) }</td>
                    <td>{ comment.endereco }</td>
                    <td>{ comment.telefone }</td>
                    <td>{ comment.profissao }</td>
                    <td>{ comment.comment}</td>
                    <td>  
                    <div class="ui icon buttons">
                        <button type="submit" data-commentid="{ comment.id }" onclick="{ alterarPaciente }" class="ui black button">
                            <i class="edit icon"></i></a>
                        </button>
                        <button type="submit" data-commentid="{ comment.id }" onclick="{ excluirPaciente }" class="ui red button">
                            <i class="trash icon"></i>
                        </button>
                    </div>               
                    <td>
            </tbody>
        </table>
        <div class="ui divider"></div>
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
            this.listarDados();
            id = event.target.dataset.commentid;
            
            if (id != undefined) {
                dpd.comments.del(id, function (err) {
                if(err) console.log(err + " Registro excluído: " + id);  
                this.listarDados();
                riot.update();
                });  
            }
            this.listarDados();
            
        }  
        this.alterarPaciente = function (event){  
            id = (event.target.dataset.commentid)  

            if(id != undefined){
                this.popularCampos(id);
                this.scroolSuave(event);
            } 
            <!--  TODO  -->
            <!--  dpd.comments.put(id, {"name":"foobar","comment":"foobar","profissao":"foobar","endereco":"foobar","telefone":123}
                    , function(result, err) { 
                    if(err) return console.log(err);
            console.log(result, result.id);  
            this.listarDados();
            riot.update();
            });   -->

        }  

        this.popularCampos = function(id){

            this.id = id
            console.log("Alterando o registro com o id: "+id);
            var arr = opts.comentarios;
            var i;
            for (i = 0; i < arr.length; i++) { 
                if(arr[i].id === this.id) {
                document.getElementById('name').value = arr[i].name;
                document.getElementById('nascimento').value = formataDataParaFormulario(arr[i].nascimento);
                document.getElementById('endereco').value = arr[i].endereco;
                document.getElementById('telefone').value = arr[i].telefone;
                document.getElementById('profissao').value = arr[i].profissao;
                document.getElementById('comment').value = arr[i].comment;
                document.getElementById('id').value = arr[i].id;
                }
            }
        }

        this.scroolSuave = function (e) {    
            e.preventDefault();
            var targetOffset = this.root.offsetTop;  
            $('html, body').animate({ 
                scrollTop: targetOffset - 2000
            }, 1500);  
        }

        this.scroolSuaveParaBaixo = function (e) {    
            e.preventDefault();
            var targetOffset = this.root.offsetTop;  
            $('html, body').animate({ 
                scrollTop: targetOffset + 1000
            }, 1000);  
        }
    </script>
</crud-tabela>
