    <div class="container">

      <hr>

      
          
          <ul class="list-unstyled list-inline  pull-left">
              <li>Projet de bras manipulateur contrôlable à distance réalisé par Jonathan Bruneau et Gaëtan LE HEURT-FINOT © 2018 - <?php echo date('Y');?></li>	                  
          </ul>
          
          <ul class="list-unstyled list-inline list-social-icons pull-right">
              <li class="tooltip-social"><a style="font-size: 20px" data-toggle="tooltip" data-placement="top" href="#" title="Haut de page"><i class="fa fa-chevron-circle-up"></i></a></li>
          </ul> 
           
          </div>
        </div>
      </footer>

    </div>
	<script src="/assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="/assets/js/bootstrap.min.js" type="text/javascript"></script>
	<?php if ($titre == "Galerie") {echo '<script src="/assets/js/ekko-lightbox.min.js" type="text/javascript"></script>';}?>
    <script>
    $('.tooltip-social').tooltip({
      selector: "a[data-toggle=tooltip]"
    });
    $('.carousel').carousel({
       interval: 3000
    });      	     
    </script>
	<script type='text/javascript'>
	$(document).on('click', '[data-toggle="lightbox"]', function(event) {
        event.preventDefault();
       $(this).ekkoLightbox();
    });
    </script>
	    </body>
</html>