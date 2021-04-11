<?php
$titre = "Erreur 404";
$description = "La page demandée est introuvable.";

include_once($_SERVER['DOCUMENT_ROOT']). '/assets/includes/header.php';
?>


    <div class="container">

      <div class="row">

        <div class="col-lg-12">
          <ol class="breadcrumb">
            <li><a href="/"><?php echo "$nom" ?></a></li>
            <li class="active"><strong>La page que vous avez demandée n'existe pas</strong></li>
          </ol>
        </div>

      </div>

      <div class="row">

        <div class="col-lg-12 text-center">
          <p class="error-404"><i class="fa fa-exclamation-triangle"></i> Erreur 404</p>
          <p class="lead">Page non trouvée</p>
          <p><a class="btn btn-primary btn-lg" href="javascript:history.back()"><i class="fa fa-arrow-circle-left"></i> Retour</a></p>
        </div>

      </div>

    </div>
	  
<?php include($_SERVER['DOCUMENT_ROOT']). '/assets/includes/footer.php'; ?>