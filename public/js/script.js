function formataDataParaTabela(data) {
    data = data.toString();
    dataformatada = data.substring(0,10);
    split = dataformatada.split('-');
    novadata = split[2] + "/" +split[1]+"/"+split[0];
    
    return novadata;
}
function formataDataParaFormulario(data) {
    data = data.toString();
    dataformatada = data.substring(0,10);
    split = dataformatada.split('-');
    novadata = split[0] + "-" +split[1]+"-"+split[2];

    return novadata; 
}
$(document).ready(function() {

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

     

    $('#').submit(function() {
        
      
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
  

