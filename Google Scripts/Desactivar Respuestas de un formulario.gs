function desactivarRespuestas() {
  
  var hoja = SpreadsheetApp.getActive();
  var ultimaFila= hoja.getActiveSheet().getLastRow();
  var cantidadRespuestas = 25;
  var correoAlerta = "mario.andres.zamora@cgr.go.cr";
  
  var form = FormApp.openById("1-Di-pp_IQzLIqb8ncZSnicJy7nz80suGnF6e4QrPKFc");
  
  if(form.isAcceptingResponses()){
    if(ultimaFila > cantidadRespuestas){
     form.setAcceptingResponses(false);
     GmailApp.sendEmail(correoAlerta, "Cupo lleno", "Ya se lleno el cupo del curso")
  }
 }
  
}