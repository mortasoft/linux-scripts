function doGet() {
  
  // Creacion de la aplicacion
  var app = UiApp.createApplication();
   
  // Texbox de entrada del Link
  var labelentrada = app.createLabel("URL del archivo en Google Drive").setId("labelentrada").setStyleAttribute("fontSize", "16");
  var txtentrada = app.createTextBox().setName("entrada").setSize(550, 25);
  
  // Textbox de Salida del Link
  var labelsalida = app.createLabel("URL para utilizar").setId("labelsalida").setStyleAttribute("fontSize", "16"); 
  var txtsalida = app.createTextBox().setId("salida").setName("salida").setSize(550, 25).setEnabled(false);
  
  // El el evento que maneja el click
  var handler = app.createServerHandler("generar").addCallbackElement(txtentrada);
    
  // Label del resultado y el boton de generar
  var labelresultado = app.createLabel("labelresultado").setId("labelresultado").setStyleAttribute("fontSize", "16").setStyleAttribute("color", "Red").setVisible(false); 
  var boton = app.createButton("Generar Link", handler);
  
  // Se agregan los elementos a la aplicacion 
   app.add(labelentrada);
   app.add(txtentrada);
   app.add(labelsalida);
   app.add(txtsalida);
   app.add(boton);
   app.add(labelresultado);
  return app;
 }

// Funcion del click al boton generar
 function generar(evento) {
   var app = UiApp.getActiveApplication();
   //var link = "https://docs.google.com/uc?export=download&id=";
   var link = "https://docs.google.com/uc?export=view&id=";
   var arreglo = [{}]; 

   
   // Se divide el texto de entrada en un arreglo
   arreglo = evento.parameter.entrada.split("/");
     
   if(arreglo[4] == "cgr.go.cr"){ // Si son solo para la cgr.go.cr
   //https://drive.google.com/a/cgr.go.cr/file/d/0B4rCaATC7rCnRFNfY2k5cHl3RG8/edit?usp=sharing
     app.getElementById("salida").setText(link+arreglo[7]);
     app.getElementById("labelresultado").setVisible(true);
     app.getElementById("labelresultado").setText("Se creó correctamente");
   } else if(arreglo[3] == "file")
      {  // Si es un link de Documentos de Word o Imagenes
      app.getElementById("salida").setText(link+arreglo[5]);// Ej: https://drive.google.com/file/d/0B4rCaATC7rCnYjhpbTRZT1BMMFk/edit?usp=sharing
      app.getElementById("labelresultado").setVisible(true);
      app.getElementById("labelresultado").setText("Se creó correctamente");
    }
    else{
      app.getElementById("labelresultado").setVisible(true);
      app.getElementById("labelresultado").setText("Ocurrio un error revise el URL");
    }
   
   return app;
   
 }