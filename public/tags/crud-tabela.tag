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
                <tr each="{ comment in this.pacientes }">
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

        _self = this;
        
        _self.listarDados = function () {
            dpd.comments.get(function (result, erro) {
                if(erro) {
                    console.log(erro);
                    alert('Houve um erro ao buscar pacientes.')
                }
                opts.comentarios = result;
                _self.pacientes = result;
                riot.update();    
            });
        }

        _self.excluirPaciente = function (event){
            _self.listarDados();
            id = event.target.dataset.commentid;
            
            if (id != undefined) {
                dpd.comments.del(id, function (err) {
                if(err) console.log(err + " Registro excluído: " + id);  
                _self.listarDados();
                riot.update();
                });  
            }
            _self.listarDados();
            
        }  
        _self.alterarPaciente = function (event){ 
              
               _self.listarDados(); 
            id = (event.target.dataset.commentid)  

            if(id != undefined){
                _self.popularCampos(id);
                _self.scroolSuave(event);
                  _self.listarDados();
            
            }  else{
            
            
              _self.listarDados();
            
                console.log('SEM LOG');
            }

            <!--  TODO  -->
            <!--  dpd.comments.put(id, {"name":"foobar","comment":"foobar","profissao":"foobar","endereco":"foobar","telefone":123}
                    , function(result, err) { 
                    if(err) return console.log(err);
            console.log(result, result.id);  
            _self.listarDados();
            riot.update();
            });   -->

        }  

        _self.popularCampos = function(id){

            this.id = id
            var array = _self.pacientes;
            
            for (var i = 0; i < array.length; i++) { 
                if(array[i].id == id) {
                $('#name').val(array[i].name);
                $('#nascimento').val(formataDataParaFormulario(array[i].nascimento));
                $('#endereco').val(array[i].endereco);
                $('#telefone').val(array[i].telefone);
                $('#profissao').val(array[i].profissao);
                $('#comment').val(array[i].comment);
                $('#id').val(array[i].id);
                }
            }
            _self.update();
        }

        _self.scroolSuave = function (e) {    
            e.preventDefault();
            var targetOffset = _self.root.offsetTop;  
            $('html, body').animate({ 
                scrollTop: targetOffset - 2000
            }, 1500);  
        }

        _self.scroolSuaveParaBaixo = function (e) {    
            e.preventDefault();
            var targetOffset = this.root.offsetTop;  
            $('html, body').animate({ 
                scrollTop: targetOffset + 1000
            }, 1000);  
        }
    </script>
</crud-tabela>
