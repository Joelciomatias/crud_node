<crud-tabela>
    <button class="ui primary button" onclick="{ opts.listarDados }" type="submit"><i class="list icon"></i>Listar Pacientes</button>
    <button class="ui secondary button"  onclick="#" type="submit"><i class="edit icon"></i>Alterar Paciente</button>
    <button class="ui negative button"  onclick="#" type="submit"><i class="trash icon"></i>Excluir Paciente</button>
    <div class="ui container">
        <table if="{ typeof opts.comentarios != 'undefined' }" class="ui celled table">
            <thead>
                <tr>
                <th>Nome</th>
                <th>Nascimento</th>
                <th>Endereco</th>
                <th>Telefone</th>
                <th>Profissao</th>
                <th>Comentrio</th>
                </tr>
            </thead>
            <tbody>
                <tr each="{ comment in opts.comentarios }">
                    <td>{ comment.name }</td>
                    <td>{ formataData(comment.nascimento) }</td>
                    <td>{ comment.endereco }</td>
                    <td>{ comment.telefone }</td>
                    <td>{ comment.profissao }</td>
                    <td>{ comment.comment }</td>
                </tr>       
            </tbody>
        </table>
    </div>
    <script>   
        opts.listarDados = function () {
            dpd.comments.get(function (result, erro) {
                if(erro) 
                    return console.log(erro);
                opts.comentarios = result;
                riot.update();
            });
        }
    </script>

</crud-tabela>
