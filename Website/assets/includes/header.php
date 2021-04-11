<?php
ob_start("ob_gzhandler");

$nom = "Projet de bras manipulateur contrôlable à distance";
$ipcam = "172.16.5.20";
?>
<!DOCTYPE html>
<html lang="fr">
   <head>
      <meta charset="utf-8" />
	  <title><?php echo "$titre • $nom";?></title>
	  <link rel="shortcut icon" href="/assets/img/favicon.png">
	  <meta name="description" content="<?php echo $description; ?>" />
	  <meta property="og:title" content="<?php echo "$titre • $nom";?>" />
	  <meta property="og:description" content="<?php echo $description; ?>" />
	  <meta property="og:image" content="/assets/img/logo.png" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
	  
      <link href="/assets/css/style.css" rel="stylesheet">
	  <?php if ($titre == "Galerie") {echo '<link href="/assets/css/ekko-lightbox.min.css" rel="stylesheet">';}?>
	
   </head>
   <body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
      
       <div class="navbar-header">
               <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
          <a class="navbar-brand mobiletitle" href="/"><img src="/assets/img/logonoback.svg" alt="Logo" class="hidden-xs"></img> <?php echo "$nom" ?></a>
        </div>

       <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">    
          <ul class="nav navbar-nav navbar-right">
			<?php if ($titre == "Accueil") {echo '<li class="active"><a href="#">';} else {echo '<li><a href="/">';} ?><b class="fa fa-home" aria-hidden="true"></b> Accueil</a></li>
			<?php if ($titre == "Téléchargements") {echo '<li class="active"><a href="#">';} else {echo '<li><a href="/downloads/">';} ?><b class="fa fa-download" aria-hidden="true"></b> Téléchargements</a></li>
			<?php if ($titre == "Galerie") {echo '<li class="active"><a href="#">';} else {echo '<li><a href="/gallery/">';} ?><b class="fa fa-image" aria-hidden="true"></b> Galerie</a></li>
			<?php if ($titre == "Flux vidéo") {echo '<li class="active"><a href="#">';} else {echo '<li><a href="http://'.$ipcam.':8081">';} ?><b class="fa fa-video" aria-hidden="true"></b> Flux vidéo</a></li>
          </ul>
        </div>
        
      </div>
    </nav>