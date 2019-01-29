<crud-tabela>
    <button class="ui primary button" onclick="{ listarDados }"><i class="list icon"></i>Listar Pacientes</button>
    <div class="ui divider"></div>
    <div class="ui container">
        <table if="{ typeof this.pacientes != 'undefined' }" class="ui celled table">
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
                <tr each="{ paciente in this.pacientes }">
                    <td>{ paciente.name }</td>
                    <td>{ formataDataParaTabela(paciente.nascimento) }</td>
                    <td>{ paciente.endereco }</td>
                    <td>{ paciente.telefone }</td>
                    <td>{ paciente.profissao }</td>
                    <td>{ paciente.comment}</td>
                    <td>  
                    <div class="ui icon buttons">
                        <span data-pacienteId="{ paciente.id }" onclick="{ alterarPaciente }">
                            <button class="ui black button change">
                            <i class="edit icon"/>
                            </button>
                        </span>
                        <span data-pacienteId="{ paciente.id }" onclick="{ excluirPaciente }">
                            <button type="submit" class="ui red button">
                                <i class="trash icon"></i>
                            </button>
                        </span>
                    </div>               
                    <td>
                </tr>
            </tbody>
        </table>
        <div class="ui divider"></div>
    </div>
    <script>   
        var _self = this;
        _self.listarDados = () => {
            dpd.patients.get(function (result, error) {
                if(error) {
                    showError(error);
                    alert('Houve um erro ao buscar pacientes!')
                }
                _self.pacientes = result;
                riot.update();    
            });
        }
        _self.excluirPaciente = (e) => {
            e.preventDefault();
            var id = e.item.paciente.id;
            if (typeof(id) != "undefined") {
                dpd.patients.del(id, function (error) {
                    if(error) {
                        showError(error);
                    } 
                    _self.listarDados();
                    riot.update();
                });  
            }
            _self.listarDados();
        }  
        _self.alterarPaciente = (e) => { 
            e.preventDefault();
            var id = e.item.paciente.id;
            if(typeof(id) != "undefined"){
                _self.popularCampos(id);
                _self.scroolSuave(e);
                _self.listarDados();
            
            } else {
                _self.listarDados();
            }
            <!--  TODO  -->
            <!--  dpd.patients.put(id, {"name":"foobar","comment":"foobar","profissao":"foobar","endereco":"foobar","telefone":123}
                    , function(result, err) { 
                    if(err) return console.log(err);
            console.log(result, result.id);  
            _self.listarDados();
            riot.update();
            });   -->
        }  
        _self.popularCampos = (id) => {
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
        _self.scroolSuave = (e) => {    
            e.preventDefault();
            var targetOffset = _self.root.offsetTop;  
            $('html, body').animate({ 
                scrollTop: targetOffset - 2000
            }, 1500);  
        }
        _self.scroolSuaveParaBaixo = (e) => {
            e.preventDefault();
            var targetOffset = this.root.offsetTop;  
            $('html, body').animate({ 
                scrollTop: targetOffset + 1000
            }, 1000);  
        }
    </script>
</crud-tabela>
