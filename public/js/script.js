function formataData(data) {
    data = data.toString();
    dataformatada = data.substring(0,10);
    split = dataformatada.split('-');
    novadata = split[2] + "/" +split[2]+"/"+split[0];
    
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
        //adicionado para o backend
        function loadComments() {
            dpd.comments.get(function(comments, error) { //Use dpd.js to access the API
                $('#comments').empty(); //Empty the list
                comments.forEach(function(comment) { //Loop through the result
                    addComment(comment); //Add it to the DOM.
                });
            });
        }
        //funcao para salvar no banco
        $('#comment-form').submit(function() {
            //Get the data from the form
            var name = $('#name').val();
            var comment = $('#comment').val();
            var profissao = $('#profissao').val();
            var endereco = $('#endereco').val();
            var nascimento = $('#nascimento').val();
            var telefone = $('#telefone').val();
            //Clear the form elements
            dpd.comments.post({
                name: name,
                comment: comment,
                profissao: profissao,
                nascimento: nascimento,
                endereco: endereco,
                telefone: telefone
            }, function(comment, error) {
                if (error) {
                    console.log(error);
                    return showError(error);
                }
                if(comments) {alert("Dados salvos com sucesso!");
            }
            addComment(comment);
            $('#name').val('');
            $('#comment').val('');
            $('#profissao').val('');
            $('#nascimento').val('');
            $('#endereco').val('');
            $('#telefone').val('');  
        });
        
        return false;
    });

});



