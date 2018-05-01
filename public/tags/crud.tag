<crud>
    <div id="comments">
        <form ref="crud" onsubmit={ carregarDadosNoBanco } id="comment-form">
            <h2 class="ui header"><i class="heartbeat icon"/>{ opts.titulo }</h2> 
            <div class="ui divider"></div>       
            <div class="ui form">  
                { opts.campo }<input ref="username" type="text"></br>
                { opts.campo2 }<input ref="nascimento" type="date"></br>
                { opts.campo3 }<input ref="endereco"></br>
                { opts.campo4 }<input ref="telefone" type="number" ></br>
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
        <!--  TODO
        this.eh_valido = (e.target.value.length > 1) ? ' OK' : ' Inválido';  -->
    }

    clique(e){
        <!--  TODO  -->
       
    }

    
    carregarDadosNoBanco(e)  {
        // console.log(e.target.elements[0].value);
        var form = this.refs.crud,
        button = this.refs.submit
        e.preventDefault();
        var dados = {
            name: this.refs.username.value,
            nascimento:this.refs.nascimento.value,
            endereco: this.refs.endereco.value,
            telefone: this.refs.telefone.value,
            profissao: this.refs.profissao.value,
            comment: this.refs.comentario.value
            };
            dpd.comments.post(dados
            , function(comment, error) {
                if (error) {
                    var message = "Houve um erro: "
                    var errors = error.errors;
                    message = "";
                    Object.keys(errors).forEach(function(k) {
                        message += k + ": " + errors[k] + "\n";
                    });
                    alert(message);  
                }
                else  {
                    alert("Dados salvos com sucesso!");
                    document.getElementById("comment-form").reset();  
                }
        });         
    }

    <!--  TODO  -->
    $(this.root).click(function(){
        
    });
    /*FUNCÇÃO PARA MOSTRAR EVENROS DO RIOT*/
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
