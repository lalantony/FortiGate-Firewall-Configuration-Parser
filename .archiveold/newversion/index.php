<!doctype html>
<html><head>
          
          <meta charset="utf-8" />
          <title>FortiGate Firewall Configuration Processing Tool</title>
          <meta name="description" content="FortiGate Firewall Configuration Processing Tool" />
          <link rel='shortcut icon' href='design/layout/favicon.png' type='image/x-icon' />
          <link rel='stylesheet' href='css/default.css' media='screen'  type='text/css' />
          <link rel='stylesheet' href='font-awesome/css/font-awesome.css' media='screen'  type='text/css' />
          <link rel='stylesheet' href='css/social-buttons.css' media='screen'  type='text/css' />
          <link rel='stylesheet' href='dist/css/bootstrap.css' media='screen'  type='text/css' />
          <link rel='stylesheet' href='dist/css/bootstrap.min.css' media='screen'  type='text/css' />
          <link rel='stylesheet' href='css/shadowbox.css' media='screen'  type='text/css' />
          <link href='http://fonts.googleapis.com/css?family=Pathway+Gothic+One' rel='stylesheet' type='text/css'>
          <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" /> 
		  
  </head>
  
<body> 
<?php
			$file = 'count.txt';
			// Open the file to get existing content
			$nffpp = file_get_contents($file);
			$len=str_split($nffpp);
			print "<div class=\"counter\">";
			for ($i = 0; $i < count($len); ++$i) {
				echo "<span>".$len[$i]."</span>";
			}
            print "</div>";
?>
<!-- START OF HEADER -->

                   <div id="header">

                         <div id="get-app">
                               <h1>FortiGate Firewall Configuration Processor</h1>
                               <h2>By Lal Antony</h2>
                               
                               <form id="myform" enctype="multipart/form-data"  action="FirewallRuleProcessor.php" method="POST">
                               <div class="inputWrapper" style="text-align: center;">
                               Select File
							   <br>
							   <input class="fileInput" type="file" name="file" id="file"><br>
							   </div>
							   <!-- get the app button -->
                               <a onclick="submit()" href="javascript:this.document.myform.submit();" title="Upload File" class="getAppBtn">
                                        <span class="text">Process File</span>
                                        <span class="hover"></span>
                                        <span class="normal"></span>
                               </a>
                               
                               </form>                  
                         </div>
                   </div>
                   <!-- END HEADER -->
        
                    
                   <!-- START OF BACKGROUND -->
                   <div class="background">
                
                           <!-- START OF COLUMNS -->
                           <div class="container">
                                 <ul id="columns">
                                        
                                        <!-- COLUMN 1 -->
                                        <li class="phone">
                                            <h3>Easy Upload</h3>
                                            <p>Easy to upload the configuration file that you require the document processing to be carried out</p>
                              </li>
                                        
                                        <!-- COLUMN 2 -->
                                        <li class="brush">
                                            <h3>Instant Output</h3>
                                            <p>All processing is done in the cloud and output is directed to your browser using HTML</p>
                                        </li>
                                        
                                        
                                        <!-- COLUMN 3 -->
                                        <li class="wheel">
                                            <h3>Easy Ouput Download</h3>
                                            <p>HTML table manipulation tools for each of the configuration output section to quickly download the processed output</p>
                                        </li>
                                 </ul>
                           </div>
                            <!-- END COLUMNS -->
                         
                           
                          
                            
                     <!-- END BACKGROUND -->
                     <!-- START FOOTER -->
                     <div  class="background" id="footer">
                            <div class="container">
                            
                                      <span id="copyright">&copy; 2013 www.lalantony.com <br> Design by techandall </span>

                                      <ul id="social">
                                          
                                          <!-- Twitter link -->
                                      <button class="btn btn-twitter"><i class="icon-twitter"></i></button>
                                        <button class="btn btn-linkedin"><i class="icon-linkedin"></i></button>
                                          
                                          <!-- Facebook link -->
                                          <li class="facebook">
                                              <a href="#" title="Follow me on Facebook">
                                                <span class="hover"></span>
                                                <span class="normal"></span>
                                              </a>
                                        </li>
                                          
                                          <!-- Google link -->
                                          <li class="google">
                                              <a href="#" title="Follow me on Google+">
                                                <span class="hover"></span>
                                                <span class="normal"></span>
                                              </a>
                                          </li>                                                                        
      </ul>  
                     
                            </div>
                     </div>
                     <!-- END FOOTER -->
          
                     
                     <!-- Javascript -->
<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/backstretch.js"></script>
<script type="text/javascript" src="scripts/shadowbox-3.0.3/shadowbox.js"></script>
<script type="text/javascript" src="scripts/custom.js"></script>

</body>
</html>