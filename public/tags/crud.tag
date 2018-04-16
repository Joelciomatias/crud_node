<crud>
    <div id="comments">
        <form ref="crud" onsubmit={ submit } id="comment-form">
            <h2 class="ui header"><i class="heartbeat icon"/>{ opts.titulo }</h2> 
            <div class="ui divider"></div>       
            <div class="ui form">  
                { opts.campo  }<input ref="username" onkeyup={ edit } oninput={validate}><p>{nome}{eh_valido || ''}</p></br>
                { opts.campo2 }<input ref="nascimento"></br>
                { opts.campo3 }<input ref="endereco"></br>
                { opts.campo4 }<input ref="telefone"></br>
                { opts.campo5 }<input ref="profissao"></br>
                { opts.campo6 }<input ref="comentario"></br>
                <input type="hidden" id="id" name="id">
                <div class="ui divider"></div>
                <button type="submit" ref="submit" class="ui primary button"><i class="save icon"></i>Gravar</button>
                <button onclick={clique} class="ui secondary button" type="reset" name="limpa" id="limpa"><i class="eraser icon"></i>Limpar dados</button> 
            </div> 
        </form>
    </div>  
<script>

    validate(e){
        this.eh_valido = (e.target.value.length > 1) ? ' OK' : ' Inválido';
    }

    clique(e){
        console.log(e);
    }

    submit(e) {
        <!-- var form = this.refs.crud,
        username = this.refs.username.value,
        nascimento = this.refs.nascimento.value,
        endereco = this.refs.endereco.value,
        telefone = this.refs.telefone.value,
        profissao = this.refs.profissao.value,
        comentario = this.refs.comentario.value,    
        button = this.refs.submit-->
        e.preventDefault();
        console.log(e.target.elements[0].value);
    }
    
    edit(e) {
    this.text = e.target.value
    this.nome = this.text
    }

    carregarDadosNoBanco(e)  {
        e.preventDefault()       
    }
    
    $(this.root).click(function(){

    });
    <!--  this.on('before-mount', function() {console.log('1:(before-mount)');})
    this.on('mount', function() {console.log('2:(mount)');})
    this.on('update', function() {console.log('3:(update)');})
    this.on('updated', function() { console.log('4:(updated)');})
    this.on('before-unmount', function() { console.log('5:(before-mount)'); })
    this.on('unmount', function() { console.log('6:(unmount)');});  -->
</script>
<style>
    h2 {
        font-style:italic;
    } 
</style>
</crud>
