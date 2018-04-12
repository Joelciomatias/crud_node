<crud>

    <div id="comments">
        <form ref="crud" onsubmit={ submeter } id="comment-form">
            <h2 class="ui header"><i class="heartbeat icon"/>{ opts.title }</h2> 
            <div class="ui divider"></div>       
            <div class="ui form">
                 { opts.campo}{nome}<input ref="username" onkeyup={ edit }></br>
                 { opts.campo2 }<input ref="nascimento" onkeyup={ edit }></br>
                 { opts.campo3 }<input ref="endereco" onkeyup={ edit }></br>
                 { opts.campo4 }<input ref="telefone" onkeyup={ edit }></br>
                 { opts.campo5 }<input ref="profissao" onkeyup={ edit }></br>
                 { opts.campo6 }<input ref="comentario" onkeyup={ edit }></br>
                 


                <!--  <label for="nascimento">Nascimento: 
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
                </label>  -->
                
                <div class="ui divider"></div>
                <button ref="submit" class="ui primary button"><i class="save icon"></i>Gravar</button>
                <button class="ui secondary button" type="reset" name="limpa" id="limpa"><i class="eraser icon"></i>Limpar dados</button> 
            </div>
        </form>
    </div>  
<script>
 submeter(e) {
    var form = this.refs.crud,

        username = this.refs.username.value,
        nascimento = this.refs.nascimento.value,
        endereco = this.refs.endereco.value,
        telefone = this.refs.telefone.value,
        profissao = this.refs.profissao.value,
        comentario = this.refs.comentario.value,
        button = this.refs.submit
      
       console.log(username);
 }
  
    edit(e) {
      this.text = e.target.value
      this.nome = this.text
     
    }


    carregarDadosNoBanco(e)  {
        e.preventDefault()    
        
       
    }



     

 




    <!--  this.on('before-mount', function() {console.log('1:(before-mount)');})
    this.on('mount', function() {console.log('2:(mount)');})
    this.on('update', function() {console.log('3:(update)');})
    this.on('updated', function() { console.log('4:(updated)');})
    this.on('before-unmount', function() { console.log('5:(before-mount)'); })
    this.on('unmount', function() { console.log('6:(unmount)');});  -->

</script>
</crud>
