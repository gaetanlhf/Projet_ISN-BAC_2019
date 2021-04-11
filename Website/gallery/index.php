<?php
$titre = "Galerie";
$description = "La galerie photos du projet.";

include_once($_SERVER['DOCUMENT_ROOT']). '/assets/includes/header.php';
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
        <div class="photocontainer">
            <div class="gallery">
              
            <?php 
            $img_ext = array("png","jpg","jpeg","gif");

            $dir = 'images/';
            if (is_dir($dir)){
                
                if ($dh = opendir($dir)){
                    $count = 1;

                    while (($file = readdir($dh)) !== false){

                        if($file != '' && $file != '.' && $file != '..'){
                            

                            $thumbs = "images/thumbnail/".$file;

                            $img = "images/".$file;
                            
                            $thumbnail_ext = pathinfo($thumbs, PATHINFO_EXTENSION);
                            $ext = pathinfo($img, PATHINFO_EXTENSION);

                            if(!is_dir($img) && 
                                in_array($thumbnail_ext,$img_ext) && 
                                in_array($ext,$img_ext)){
                                ?>

                                <a data-toggle="lightbox" data-gallery="gallery" href="<?php echo $img; ?>">
                                    <img src="<?php echo $thumbs; ?>" data-gallery="example-gallery"/>
                                </a>
                                <?php

                                if( $count%4 == 0){   
                                }
                                $count++;
                            }
                        }
                            
                    }
                    closedir($dh);
                }
            }
            ?>
            </div>
        </div>
		</div>

<?php include($_SERVER['DOCUMENT_ROOT']). '/assets/includes/footer.php'; ?>
