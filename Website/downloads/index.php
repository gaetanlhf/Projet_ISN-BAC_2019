<?php
$titre = "Téléchargements";
$description = "Télécharger des fichiers du projet.";

include_once($_SERVER['DOCUMENT_ROOT']). '/assets/includes/header.php';

require('data.php');

$gallery = '';

foreach ($data as $k => $v) {

    $gallery .= '
	<div class="col-sm-6 col-md-4">
                    <div class="panel panel-default same-height-box">
                      <div class="panel-heading center vertical-center">
                          <span>'.$v['titre'].'<br/><p class="text-muted" style="font-size:14px;">'.$v['type'].'</p></span>
                      </div>
                      <div class="panel-body center">
                        <p>'.$v['description'].'</p>
                      </div>
                    <div class="panel-footer center"></a> <a href="'.$v['fichier'].'" class="btn btn-primary" role="button">Télécharger <i class="fa fa-download" aria-hidden="true"></i></a></div>
                    </div>
					</div>
				  ';
				  

};
?>
	
<div class="container">
<div class="row">
	<div class="col-lg-12">
		<ol class="breadcrumb">
			<li><a href="/"><?php echo "$nom" ?></a></li>
            <li class="active"><strong><?php echo "$titre" ?></strong></li>
		</ol>
	</div>
</div>
	
		<div class="row">
		<?php echo $gallery; ?>
                 
</div>
	
<?php include($_SERVER['DOCUMENT_ROOT']). '/assets/includes/footer.php'; ?>

