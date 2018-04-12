<crud>
  <div id="comments">
        <form id="comment-form">
            <h2 class="ui header"><i class="heartbeat icon"></i>Cadastro de Pacientes</h2> 
            <div class="ui divider"></div>       
            <div class="ui form">
                <label for="name">Nome do Paciente: 
                    <input type="text" id="name" name="name" value="Nome_teste"/>
                </label>
                <label for="nascimento">Nascimento: 
                    <input type="date" id="nascimento" name="nascimento" value="1990-06-16"/>
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
                
                <label for="id"> 
                    <input type="hidden" id="id" name="id">
                </label>
                
                <div class="ui divider"></div>
                <button type="submit" class="ui primary button"><i class="save icon"></i>Gravar</button>
                <button class="ui secondary button" type="reset" name="limpa" id="limpa"><i class="eraser icon"></i>Limpar dados</button> 
            </div>
        </form>
    </div>
</crud>
<script>
    
</script>