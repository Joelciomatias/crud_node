$(document).ready(function() {
    

//funcao para mostrar erros
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
              //  alert(error.errosname);
                console.log(error);
                return showError(error);
            }
                
            if(comments) alert("Dados Salvos com sucesso!")

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
    //funcao para imprimir  na tela
    // function addComment(comment) {
    //     $('<div class="comment">')
    //         .append('<div class="author">Postado por: ' + comment.name + '</div>')
    //         .append('<p>Comentário:' + comment.comment + '</p></br>comentário adiconado ao banco!')
    //         .appendTo('#comments');
    // }

});






function listarDados(){
    dpd.comments.get(function (result, err) {
        if(err) return console.log(err);
        var myObj = result;
        document.getElementById("cabecalho").innerHTML = "";
        document.getElementById("demo").innerHTML = "";

       // console.log(result);
        for (x in myObj) {
            if(x == 0){
                document.getElementById("cabecalho").innerHTML +=  "<h4> Nome | Nascimento | Endereço | Telefone | Profissao |Comentario</h4> ------------------------------------------------------------------------------------ </br> ";    
            }          
            document.getElementById("demo").innerHTML += myObj[x].name + " | ";
            document.getElementById("demo").innerHTML += formataData(myObj[x].nascimento) + " | ";
            document.getElementById("demo").innerHTML += myObj[x].endereco + " |  ";
            document.getElementById("demo").innerHTML += myObj[x].telefone + " | ";
            document.getElementById("demo").innerHTML += myObj[x].profissao + " | ";
            document.getElementById("demo").innerHTML += myObj[x].comment + "</br> ";
        }
      });
function formataData(data){
    data = data.toString();
    dataformatada = data.substring(0,10);
    split = dataformatada.split('-');
    novadata = split[2] + "/" +split[2]+"/"+split[0];

    return novadata;
}

}