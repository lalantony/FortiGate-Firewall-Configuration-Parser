<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FortiGate Firewall Processing Tool</title>
        <style type="text/css" title="currentStyle">
			@import "media/css/demo_page.css";
			@import "media/css/demo_table.css";
			@import "media/css/TableTools.css";
		</style>
		<script type="text/javascript" charset="utf-8" src="media/js/jquery.js"></script>
		<script type="text/javascript" charset="utf-8" src="media/js/jquery.dataTables.js"></script>
		<script type="text/javascript" charset="utf-8" src="media/js/ZeroClipboard.js"></script>
		<script type="text/javascript" charset="utf-8" src="media/js/TableTools.js"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready( function () {
				$('#show_interfaces_table').dataTable( {
					"sDom": 'T<"clear">lfrtip',
					"oTableTools": {
                                                "sSwfPath": "media/swf/copy_csv_xls_pdf.swf",
						"aButtons": [
							{
								"sExtends": "csv",
								"sButtonText": "Save to CSV",
                                                                "sTitle": "Interface Table"
							},
							{
								"sExtends": "pdf",
								"sButtonText": "Download As PDF",
                                                                "sTitle": "Interface Table"
							},
                                                        {
                                                                "sExtends": "print",
                                                                "sButtonText": "Print Table",
                                                                "sTitle": "Interface Table"
                                                        }
						]
					}
				} );
                                $('#show_addresses_table').dataTable( {
					"sDom": 'T<"clear">lfrtip',
					"oTableTools": {
                                                "sSwfPath": "media/swf/copy_csv_xls_pdf.swf",
						"aButtons": [
							{
								"sExtends": "csv",
								"sButtonText": "Save to CSV",
                                                                "sTitle": "Address Table"
							},
							{
								"sExtends": "pdf",
								"sButtonText": "Download As PDF",
                                                                "sTitle": "Address Table"
							},
                                                        {
                                                                "sExtends": "print",
                                                                "sButtonText": "Print Table",
                                                                "sTitle": "Address Table"
                                                        }
						]
					}
				} );
                                $('#show_address_groups_table').dataTable( {
					"sDom": 'T<"clear">lfrtip',
					"oTableTools": {
                                                "sSwfPath": "media/swf/copy_csv_xls_pdf.swf",
						"aButtons": [
							{
								"sExtends": "csv",
								"sButtonText": "Save to CSV",
                                                                "sTitle": "Address Group Table"
							},
							{
								"sExtends": "pdf",
								"sButtonText": "Download As PDF",
                                                                "sTitle": "Address Group Table"
							},
                                                        {
                                                                "sExtends": "print",
                                                                "sButtonText": "Print Table",
                                                                "sTitle": "Address Group Table"
                                                        }
						]
					}
				} );
                                $('#show_services_table').dataTable( {
					"sDom": 'T<"clear">lfrtip',
					"oTableTools": {
                                                "sSwfPath": "media/swf/copy_csv_xls_pdf.swf",
						"aButtons": [
							{
								"sExtends": "csv",
								"sButtonText": "Save to CSV",
                                                                "sTitle": "Services Table"
							},
							{
								"sExtends": "pdf",
								"sButtonText": "Download As PDF",
                                                                "sTitle": "Services Table"
							},
                                                        {
                                                                "sExtends": "print",
                                                                "sButtonText": "Print Table",
                                                                "sTitle": "Services Table"
                                                        }
						]
					}
				} );
                                $('#show_service_groups_table').dataTable( {
					"sDom": 'T<"clear">lfrtip',
					"oTableTools": {
                                                "sSwfPath": "media/swf/copy_csv_xls_pdf.swf",
						"aButtons": [
							{
								"sExtends": "csv",
								"sButtonText": "Save to CSV",
                                                                "sTitle": "Services Group Table"
							},
							{
								"sExtends": "pdf",
								"sButtonText": "Download As PDF",
                                                                "sTitle": "Services Group Table"
							},
                                                        {
                                                                "sExtends": "print",
                                                                "sButtonText": "Print Table",
                                                                "sTitle": "Services Group Table"
                                                        }
						]
					}
				} );
                                $('#show_vips_table').dataTable( {
					"sDom": 'T<"clear">lfrtip',
					"oTableTools": {
                                                "sSwfPath": "media/swf/copy_csv_xls_pdf.swf",
						"aButtons": [
							{
								"sExtends": "csv",
								"sButtonText": "Save to CSV",
                                                                "sTitle": "VIP Table"
							},
							{
								"sExtends": "pdf",
								"sButtonText": "Download As PDF",
                                                                "sTitle": "VIP Table"
							},
                                                        {
                                                                "sExtends": "print",
                                                                "sButtonText": "Print Table",
                                                                "sTitle": "VIP Table"
                                                        }
						]
					}
				} );
                                $('#show_pools_table').dataTable( {
					"sDom": 'T<"clear">lfrtip',
					"oTableTools": {
                                                "sSwfPath": "media/swf/copy_csv_xls_pdf.swf",
						"aButtons": [
							{
								"sExtends": "csv",
								"sButtonText": "Save to CSV",
                                                                "sTitle": "Address Pool Table"
							},
							{
								"sExtends": "pdf",
								"sButtonText": "Download As PDF",
                                                                "sTitle": "Address Pool Table"
							},
                                                        {
                                                                "sExtends": "print",
                                                                "sButtonText": "Print Table",
                                                                "sTitle": "Address Pool Table"
                                                        }
						]
					}
				} );
                                $('#show_routes_table').dataTable( {
					"sDom": 'T<"clear">lfrtip',
					"oTableTools": {
                                                "sSwfPath": "media/swf/copy_csv_xls_pdf.swf",
						"aButtons": [
							{
								"sExtends": "csv",
								"sButtonText": "Save to CSV",
                                                                "sTitle": "Route Table"
							},
							{
								"sExtends": "pdf",
								"sButtonText": "Download As PDF",
                                                                "sTitle": "Route Table"
							},
                                                        {
                                                                "sExtends": "print",
                                                                "sButtonText": "Print Table",
                                                                "sTitle": "Route Table"
                                                        }
						]
					}
				} );
                                $('#show_policies_table').dataTable( {
					"sDom": 'T<"clear">lfrtip',
					"oTableTools": {
                                                "sSwfPath": "media/swf/copy_csv_xls_pdf.swf",
						"aButtons": [
							{
								"sExtends": "csv",
								"sButtonText": "Save to CSV",
                                                                "sTitle": "Policy Table"
							},
							{
								"sExtends": "pdf",
								"sButtonText": "Download As PDF",
                                                                "sTitle": "Policy Table"
							},
                                                        {
                                                                "sExtends": "print",
                                                                "sButtonText": "Print Table",
                                                                "sTitle": "Policy Table"
                                                        }
						]
					}
				} );
			} );
		</script>
    </head>
    <body>
    <div align ="left" width="50%" id="UploadForm" style="border:1px solid blue">
        <form enctype="multipart/form-data"  action="?" method="POST">
          <input type="file" name="fr" id="fr"> <br><br>
          <input type="submit" name="submit" value="Read">
        </form>
    </div>
        <?php
			$file = 'count.txt';
			// Open the file to get existing content
			$nffpp = file_get_contents($file);
			echo "<div class=\"counter\"><span>".$nffpp."</span></div>";
			
			if(isset($_POST['submit']))
			{
				$filename = $_FILES['fr']['tmp_name'];
				$exccommandline = 'perl ffaddressfromcsv.pl ' . $filename;
				system($exccommandline, $output); //'perl fg-fw-rules.pl BAT_V01-EQ.txt'
				print_r($output);
				$nffpp++;
				file_put_contents($file, $nffpp);
			}
        ?>
    </body>
</html>
