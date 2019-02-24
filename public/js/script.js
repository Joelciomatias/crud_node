let pacientEditing = false;
let currentEditingId = null;
var formataDataParaTabela = (data) => {
    var novadata = "";
    if(typeof(data) != "undefined"){
        data = data.toString();
        var dataformatada = data.substring(0,10);
        var split = dataformatada.split('-');
        novadata = split[2] + "/" +split[1]+"/"+split[0];
    } 
    return novadata;
}
var formataDataParaFormulario = (data) => {
    var novadata = "";
    if(typeof(data) != "undefined"){
        data = data.toString();
        var dataformatada = data.substring(0,10);
        var split = dataformatada.split('-');
        novadata = split[0] + "-" +split[1]+"-"+split[2];
    }
    return novadata; 
}
var showError = (error) => {
    var message = "houve um erro!";
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

