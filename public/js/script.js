/*SCRIPT GLOBAL PARA TODAS AS TAGS*/


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

/*Função para formatar e mostrar mensagems de erro*/
// TODO
        function showError(error) {
        var message = "houve um  erro!";
        if (error.message) {
            message = error.message;
        } else if (error.errors) {
            var errors = error.errors;
            message = "";
            Object.keys(errors).forEach(function(k) {
                message += k + ": " + errors[k] + "\n";
            });
        }
        return message;
    }  
});   

