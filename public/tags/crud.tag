<crud>
  <div id="comments">
        <form id="comment-form">
            <h3>Cadastro de pacientes</h3>
            <div class="form-element">
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
                <input type="submit" value="Salvar"/>
                <input type="reset" name="limpa" id="limpa" value="Limpar Dados" />
            </div>
        </form>
        <button onclick="listarDados()" type="submit">Listar Pacientes</button>
        <button onclick="#" type="submit">Alterar Paciente</button>
        <button onclick="#" type="submit">Excluir Paciente</button>
    </div>
</crud>
