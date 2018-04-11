function formataData(data) {
    data = data.toString();
    dataformatada = data.substring(0,10);
    split = dataformatada.split('-');
    novadata = split[2] + "/" +split[2]+"/"+split[0];
    
    return novadata;
}
$(document).ready(function() {
    //funcao para scroll suave
        $(".scroll").click(function(event){        
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top}, 600);
        });
    });

$(document).ready(function() {

    //funcao para scroll suave
    $(".scroll").click(function(event){        
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 600);
    });
        
    function showError(error) {
        var message = "An error occurred";
        if (error.message) {
            message = error.message;
        } else if (error.errors) {
            var errors = error.errors;
            message = "";
            Object.keys(errors).forEach(function(k) {
                message += k + ": " + errors[k] + "\n";
            });
        }
        alert(message);
    }

    //funcao para salvar no banco
    $('#comment-form').submit(function() {
        var name = $('#name').val();
        var comment = $('#comment').val();
        var profissao = $('#profissao').val();
        var endereco = $('#endereco').val();
        var nascimento = $('#nascimento').val();
        var telefone = $('#telefone').val();
        dpd.comments.post({
            name: name,
            comment: comment,
            profissao: profissao,
            nascimento: nascimento,
            endereco: endereco,
            telefone: telefone
            }, function(comment, error) {
                if (error) {
                    console.log(error.errors);
                    return showError(error);
                }
                else  {
                    alert("Dados salvos com sucesso!");
                    document.getElementById("comment-form").reset();
                }
        });
    
    return false;
    });

});