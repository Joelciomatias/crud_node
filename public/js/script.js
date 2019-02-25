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

var sampleData = [
    {
		"name": "Chaim",
		"comment": "pellentesque. Sed dictum. Proin eget odio. Aliquam",
		"profissao": "Orci Consectetuer Inc.",
		"nascimento": "07/03/1994",
		"endereco": "7389 Lacus. Ave",
		"telefone": "32-11725-7004"
	},
	{
		"name": "Tarik",
		"comment": "massa. Suspendisse eleifend.",
		"profissao": "Eleifend Non Dapibus Foundation",
		"nascimento": "05/01/1989",
		"endereco": "2496 Eu Av.",
		"telefone": "95-20686-2768"
	},
	{
		"name": "Deacon",
		"comment": "dui. Cum sociis natoque penatibus et magnis dis",
		"profissao": "Mi Limited",
		"nascimento": "24/11/1998",
		"endereco": "3301 Magna. Ave",
		"telefone": "61-72181-7087"
	},
	{
		"name": "Blaze",
		"comment": "non ante bibendum ullamcorper. Duis",
		"profissao": "Ultricies Institute",
		"nascimento": "31/05/1988",
		"endereco": "3829 Interdum. Rd.",
		"telefone": "32-62190-7464"
	},
	{
		"name": "Neil",
		"comment": "libero nec ligula consectetuer rhoncus. Nullam velit dui, semper",
		"profissao": "Sodales Purus Consulting",
		"nascimento": "15/03/1985",
		"endereco": "5774 Est. Rd.",
		"telefone": "78-48977-3697"
	},
	{
		"name": "Todd",
		"comment": "augue malesuada malesuada. Integer id magna et ipsum cursus",
		"profissao": "Ullamcorper Velit In Consulting",
		"nascimento": "13/08/1991",
		"endereco": "P.O. Box 963, 8829 Nunc Av.",
		"telefone": "12-35567-7554"
	},
	{
		"name": "Channing",
		"comment": "fermentum risus, at fringilla purus mauris",
		"profissao": "Cras LLP",
		"nascimento": "01/08/1978",
		"endereco": "194-1424 Velit St.",
		"telefone": "85-69171-3528"
	},
	{
		"name": "Peter",
		"comment": "ante dictum cursus. Nunc mauris elit, dictum eu,",
		"profissao": "Mauris Corp.",
		"nascimento": "02/06/1977",
		"endereco": "Ap #785-3649 Curabitur Road",
		"telefone": "43-27278-4225"
	},
	{
		"name": "Warren",
		"comment": "malesuada fames ac turpis egestas. Aliquam fringilla",
		"profissao": "Amet Inc.",
		"nascimento": "02/02/1998",
		"endereco": "1245 Vehicula Street",
		"telefone": "97-10164-9569"
	},
	{
		"name": "Keefe",
		"comment": "dis parturient montes, nascetur ridiculus mus. Aenean eget",
		"profissao": "Aenean Eget Metus LLC",
		"nascimento": "24/03/1981",
		"endereco": "Ap #665-660 Interdum. Rd.",
		"telefone": "71-34860-7203"
	},
	{
		"name": "Zane",
		"comment": "nibh. Donec",
		"profissao": "Vitae Mauris Consulting",
		"nascimento": "23/02/1991",
		"endereco": "Ap #320-6848 Sed Avenue",
		"telefone": "90-32430-5639"
	},
	{
		"name": "Patrick",
		"comment": "interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus",
		"profissao": "Turpis Consulting",
		"nascimento": "03/09/1996",
		"endereco": "489-3698 Duis St.",
		"telefone": "35-90547-5048"
	},
	{
		"name": "Garrison",
		"comment": "orci,",
		"profissao": "Molestie LLC",
		"nascimento": "25/02/1995",
		"endereco": "358-9019 Tortor. Rd.",
		"telefone": "10-24373-2254"
	},
	{
		"name": "Victor",
		"comment": "Donec sollicitudin",
		"profissao": "Arcu Vel Associates",
		"nascimento": "19/08/1983",
		"endereco": "872 Nunc, Ave",
		"telefone": "33-86771-1893"
	}
];
var insertSample = () =>{
    sampleData.forEach(function(data){
        dpd.patients.post(data,function(result,error){
            if(result)console.log(result);
            if(error)console.log(error);
        })
    })
}

