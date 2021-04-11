<?php
$titre = "Accueil";
$description = "Page d'accueil de notre projet Bac d'ISN";

include_once($_SERVER['DOCUMENT_ROOT']). '/assets/includes/header.php';
?>


    <div id="myCarousel" class="carousel slide">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <div class="carousel-inner">
          <div class="item active">          
            <div class="fill" style="background-image:url('/assets/img/slider/1.jpg');"></div>
          <div class="header-text">
						<div class="col-md-12 text-center">
							<h2><span>Téléchargements</span></h2><br>
							<h3><span>Télécharger le dossier de présentation ou le programme de gestion du bras</span></h3><br>
							<div>
								<a class="btn btn-large btn-primary" href="/downloads/"><b class="fa fa-download" aria-hidden="true"></b> Accéder aux téléchargements</a>
							</div>
						</div>
					</div>
          </div>
          <div class="item">
            <div class="fill" style="background-image:url('/assets/img/slider/2.jpg');"></div>
			<div class="header-text">
						<div class="col-md-12 text-center">
							<h2><span>Code source</span></h2><br>
							<h3><span>Retrouvez le code source du projet sur GitHub</span></h3><br>
							<div>
								<a class="btn btn-large btn-primary" href="https://github.com/Atnode/Project_ISN_2019"><b class="fab fa-github" aria-hidden="true"></b> Accéder au code source</a>
							</div>
						</div>
					</div>
          </div>
          <div class="item">
            <div class="fill" style="background-image:url('/assets/img/slider/3.jpg');"></div>
			<div class="header-text">
						<div class="col-md-12 text-center">
							<h2><span>Photos</span></h2><br>
							<h3><span>Accédez à diverses photographies du projet</span></h3><br>
							<div>
								<a class="btn btn-large btn-primary" href="/gallery/"><b class="fa fa-image" aria-hidden="true"></b> Accéder à la galerie</a>
							</div>
						</div>
					</div>
          </div>

        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
          <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
          <span class="icon-next"></span>
        </a>
    </div>
        

    
        <br/>
        <div class="container">
        <div class="row">
        <div class="col-md-4">
          <h2><b class="fa fa-user-graduate"></b> Un projet Bac en ISN...</h2>
           <p>Vous vous trouvez actuellement sur le site de présentation du projet de bras manipulateur contrôlable à distance développé par Jonathan Bruneau et Gaëtan LE HEURT-FINOT.</p>
        </div>
        <div class="col-md-4">
          <h2><b class="fa fa-robot" aria-hidden="true"></b> ...utilisant un Arduino...</h2>
		     <p>Nous utilisons un Arduino afin que le robot interprète les ordres envoyés via l'interface de contrôle.</p>	   
		</div>
		<div class="col-md-4">
          <h2><b class="fab fa-java"></b> ...alliant programmation en Java...</h2>
          <p>Nous utilisons le langage Java pour la programmation de l'interface de contrôle du bras à l'aide de l'environnement de développement Processing.</p>
        </div>
	   </div>
		 <div class="row">
     <div class="col-md-4">
          <h2><b class="fab fa-python" aria-hidden="true"></b> ...en Python...</h2>
          <p>Nous utilisons un script Python qui nous sert de passerelle entre l'interface de contrôle et la carte Arduino du robot.</p>
        </div>
    <div class="col-md-4">
          <h2><b class="fab fa-php" aria-hidden="true"></b> ...et en langages du Web...</h2>
          <p>Outre l'utilisation du langage de balisation HTML et des feuilles de style en cascade (CSS), le site de présentation utilise le langage PHP.</p>
        </div>
	    <div class="col-md-4">
          <h2><b class="fab fa-linux" aria-hidden="true"></b> ...avec l'utilisation d'un système GNU/Linux et d'un Raspberry Pi...</h2>
          <p>Le Raspberry Pi nous sert à la fois de serveur web pour afficher ce site internet, de serveur de caméra pour récupérer les images du la caméra et de support pour notre script Python.</p>
	    </div>
      </div>
          

        </div>

      

 
   
<?php include_once($_SERVER['DOCUMENT_ROOT']). '/assets/includes/footer.php';
?>