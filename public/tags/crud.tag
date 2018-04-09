<crud>
  <div id="comments">
        <form id="comment-form">
            <h2 class="ui header"><i class="user icon"></i>Cadastro de Pacientes</h2> 
            <div class="ui divider"></div>       
            <div class="ui form">
                <label for="name">Nome do Paciente: 
                    <input type="text" id="name" name="name" />
                </label>
                <label for="nascimento">Nascimento: 
                    <input type="date" id="nascimento" name="nascimento" />
                </label>
                <label for="endereco">Endereço: 
                    <input type="text" id="endereco" name="endereco">
                </label>
                <label for="telefone">Telefone: 
                    <input type="number" id="telefone" name="telefone">
                </label>
                <label for="profissao">Profissão:
                    <input type="text" id="profissao" name="profissao" />
                </label>
                <label for="comment">Comentário: 
                    <input type="text" id="comment" name="comment">
                </label>
                <div class="ui divider"></div>
                <button class="ui primary button" type="submit" value="Salvar"><i class="save icon"></i>Gravar</button>
                <button class="ui secondary button"type="reset" name="limpa" id="limpa" value="Limpar Dados"><i class="eraser icon"></i>Limpar dados</button>
                
            </div>
        </form>
        <button class="ui primary button" onclick="listarDados()" type="submit"><i class="list icon"></i>Listar Pacientes</button>
        <button class="ui secondary button"  onclick="#" type="submit"><i class="edit icon"></i>Alterar Paciente</button>
        <button class="ui negative button"  onclick="#" type="submit"><i class="trash icon"></i>Excluir Paciente</button>
    </div>
</crud>
