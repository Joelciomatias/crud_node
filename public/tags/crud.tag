<crud>
    <div id="comments">
        <form ref="crud" onsubmit={ carregarDadosNoBanco } id="comment-form">
            <h2 class="ui header"><i class="heartbeat icon"/>{ opts.titulo }</h2> 
            <div class="ui divider"></div>       
            <div class="ui form error">  
                <div class="field">
                { opts.campo } <input ref="username" class="ui input error" onblur={ checkInput } id='name' name="name" type="text"></div>
                { opts.campo2 }<input ref="nascimento" id="nascimento" name="nascimento" type="date"></br>
                { opts.campo3 }<input ref="endereco" id="endereco"></br>
                { opts.campo4 }<input ref="telefone" id="telefone" type="number" ></br>
                { opts.campo5 }<input ref="profissao" id="profissao"></br>
                { opts.campo6 }<input ref="comentario" id="comment"></br>
                <input type="hidden" id="id" name="id">
                <div class="ui error message"></div>
                <div class="ui divider"></div>
                <button type="submit" ref="submit" class="ui submit button"><i class="save icon"></i>Gravar</button>
                <button class="ui secondary button" type="reset" name="limpa" id="limpa"><i class="eraser icon"></i>Limpar dados</button> 
            </div> 
        </form>
    </div>  
<script>
    var _self = this;
    checkInput(e){
        $('#name').blur(function(){
        console.log('foi');
        });
        
        let input = e.target;
        if(input.id == 'name' && input.value.length < 1){
            console.log('este campo é obrigatorio');
        }
    }  
    carregarDadosNoBanco(e)  {
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
        dpd.patients.post(dados,function(result, error) {
            if (error) {
                showError(error);
            }
            else {
                alert("Dados salvos com sucesso!");
                document.getElementById("comment-form").reset();
                $('#listar').trigger("click");
                <!--  console.log(_self);  -->
            }
        });         
    }

</script>
<style>
    h2 {
        font-style:italic;
    } 
</style>
</crud>
