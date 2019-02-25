<crud>
    <div id="comments">
        <form ref="crud" onsubmit={ carregarDadosNoBanco } id="comment-form">
            <h2 class="ui header"><i class="heartbeat icon"/>{ opts.titulo }</h2> 
            <div class="ui divider"></div>       
            <div class="ui form error">  
                { opts.campo } <input ref="username" autofocus class="ui input error" required onblur={ checkInput } minlength="3" id='name' name="name" type="text">
                { opts.campo2 }<input ref="nascimento" id="nascimento" name="nascimento" required type="date" min='1900-01-01' max="2019-12-31"></br>
                { opts.campo3 }<input ref="endereco" id="endereco"></br>
                { opts.campo4 }<input ref="telefone" id="telefone" type="number" ></br>
                { opts.campo5 }<input ref="profissao" id="profissao"></br>
                { opts.campo6 }<input ref="comentario" id="comment"></br>
                <input type="hidden" id="id" name="id">
                <div class="ui error message"></div>
                <div class="ui divider"></div>
                <button type="submit" ref="submit" class="ui submit button"><i class="save icon"></i>Gravar paciente</button>
                <button class="ui secondary button" onclick={ novoPaciente } type="reset" name="limpa" id="limpa"><i class="eraser icon"></i>Novo paciente</button> 
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
        if(input.id == 'name' && input.value.length < 3){
            console.log('este campo é obrigatorio');
            return;
        }
    }
    novoPaciente(e){
        document.getElementById("comment-form").reset();
        $('#listar').trigger("click");
        pacientEditing = false;
        currentEditingId = null;
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
        if(!pacientEditing && currentEditingId == null){
            dpd.patients.post(dados,function(result, error) {
                if (error) {
                    var errorMessage = showError(error);
                    iziToast.error({
                        position:'center',
                        title: 'Houve um erro',
                        message: errorMessage
                    }); 
                    return;
                }
                else {
                    iziToast.success({
                        position: 'center',
                        title: 'OK',
                        message: 'Registro salvo com sucesso!',
                    });
                    document.getElementById("comment-form").reset();
                    $('#listar').trigger("click");
                    pacientEditing = false;
                    currentEditingId = null;
                }
            }); 
        } else if (pacientEditing && currentEditingId != null){
            dpd.patients.put(currentEditingId,dados,function(result, error) { 
                if (error) {
                    var errorMessage = showError(error);
                    iziToast.error({
                        position:'center',
                        title: 'Houve um erro',
                        message: errorMessage
                    }); 
                    return;
                } else {
                    iziToast.success({
                        position: 'center',
                        title: 'OK',
                        message: 'Registro alterado com sucesso!',
                    });
                    document.getElementById("comment-form").reset();
                    $('#listar').trigger("click");
                    pacientEditing = false;
                    currentEditingId = null;
                }
            }); 
        } else {
            console.error('erro ao enviar dados');
        }
    }
</script>
<style>
    h2 {
        font-style:italic;
    } 
</style>
</crud>
