<crud>
    <div id="comments">
        <form ref="crud" onsubmit={ carregarDadosNoBanco } id="comment-form">
            <h2 class="ui header"><i class="heartbeat icon"/>{ opts.titulo }</h2> 
            <div class="ui divider"></div>       
            <div class="ui form">  
                { opts.campo }<input ref="username" id='name' type="text"></br>
                { opts.campo2 }<input ref="nascimento" id="nascimento" type="date"></br>
                { opts.campo3 }<input ref="endereco" id="endereco"></br>
                { opts.campo4 }<input ref="telefone" id="telefone" type="number" ></br>
                { opts.campo5 }<input ref="profissao" id="profissao"></br>
                { opts.campo6 }<input ref="comentario" id="comment"></br>
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
            dpd.patients.post(dados
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


</script>
<style>
    h2 {
        font-style:italic;
    } 
</style>
</crud>
