#!/usr/bin/perl -s


my $colour_se = "lightgray";
my $colour_if = "#6D7B8D";
my $colour_r1 = "#FFFFFF";
my $colour_r2 = "#E8EFFF";
my $rowcount = 0;

my $fwpol = 0;
my %rules = ();
my $fwid = 0;
my $order = 0;
my %addr = ();
my %addrg = ();
my %serv = ();
my %servg = ();
my %vips = ();
my %pools = ();
my %routes = ();


while( my $line = <> )
{
	chomp $line;
	# Start of address objects
	if( $line =~ /config\sfirewall\saddress/ )
	{
		my $addrid = '';
		my $mode_addr = 1;
		while( ($mode_addr == 1) && ($line = <>) )
		{
			if( $line =~ /^end/ )
			{
				$mode_addr = 0;
			}
			elsif( $line =~ /\s+edit\s\"(.*)\"/ )
			{
				$addrid = $1;
			}
			elsif( $line =~ /\s+set/ )
			{
				my($f, $v) = &cleanvalue($line);
				$addr{$addrid}->{$f} = $v;
			}
		}
	}
	# Start of address groups
	elsif( $line =~ /.*config\sfirewall\saddrgrp.*/ )
	{
		my $gn = '';
		my $mode_addrg = 1;
		while( ($mode_addrg == 1) && ($line = <>) )
		{
			if( $line =~ /^end/ )
			{
				$mode_addrg = 0;
			}
			elsif( $line =~ /\s+edit\s\"(.*)\"/ )
			{
				$gn = $1;
			}
			elsif( $line =~ /\s+set/ )
			{
				my($f, $v) = &cleanvalue($line);
				$addrg{$gn}->{$f} = $v;
			}
		}
	}
	# Start of custom services
	elsif( $line =~ /config\sfirewall\sservice\scustom/ )
	{
		my $n = '';
		my $mode_serv = 1;
		while( ($mode_serv == 1) && ($line = <>) )
		{
			if( $line =~ /^end/ )
			{
				$mode_serv = 0;
			}
			elsif( $line =~ /\s+edit\s\"(.*)\"/ )
			{
				$n = $1;
			}
			elsif( $line =~ /\s+set/ )
			{
				my($f, $v) = &cleanvalue($line);
				$serv{$n}->{$f} = $v;
			}
		}
	}
	# Start of service groups
	elsif( $line =~ /config\sfirewall\sservice\sgroup/ )
	{
		my $n = '';
		my $mode_servg = 1;
		while( ($mode_servg == 1) && ($line = <>) )
		{
			if( $line =~ /^end/ )
			{
				$mode_servg = 0;
			}
			elsif( $line =~ /\s+edit\s\"(.*)\"/ )
			{
				$n = $1;
			}
			elsif( $line =~ /\s+set/ )
			{
				my($f, $v) = &cleanvalue($line);
				$servg{$n}->{$f} = $v;
			}
		}
	}
	# Start of VIP's
	elsif( $line =~ /config\sfirewall\svip/ )
	{
		my $n = '';
		my $mode_on = 1;
		while( ($mode_on == 1) && ($line = <>) )
		{
			if( $line =~ /^end/ )
			{
				$mode_on = 0;
			}
			elsif( $line =~ /\s+edit\s\"(.*)\"/ )
			{
				$n = $1;
			}
			elsif( $line =~ /\s+set/ )
			{
				my($f, $v) = &cleanvalue($line);
				$vips{$n}->{$f} = $v;
			}
		}
	}
	# Start of IP Pools
	elsif( $line =~ /config\sfirewall\sippool/ )
	{
		my $n = '';
		my $mode_on = 1;
		while( ($mode_on == 1) && ($line = <>) )
		{
			if( $line =~ /^end/ )
			{
				$mode_on = 0;
			}
			elsif( $line =~ /\s+edit\s\"(.*)\"/ )
			{
				$n = $1;
			}
			elsif( $line =~ /\s+set/ )
			{
				my($f, $v) = &cleanvalue($line);
				$pools{$n}->{$f} = $v;
			}
		}
	}
	# Start of Static Routes
	elsif( $line =~ /config\srouter\sstatic/ )
	{
		my $n = '';
		my $mode_on = 1;
		while( ($mode_on == 1) && ($line = <>) )
		{
			if( $line =~ /^end/ )
			{
				$mode_on = 0;
			}
			elsif( $line =~ /\s+edit\s(\d+)/ )
			{
				$n = $1;
			}
			elsif( $line =~ /\s+set/ )
			{
				my($f, $v) = &cleanvalue($line);
				$routes{$n}->{$f} = $v;
			}
		}
	}
	# Start of firewall policies
	elsif( $line =~ /config\sfirewall\spolicy/ )
	{
		$fwpol = 1;
		my $idbp = 0;
		my $mode_pol = 1;
		while( ($mode_pol == 1) && ($line = <>) )
		{
			# We'll ignore the nested SSL / ID based policies for now
			if( $line =~ /\s+config identity-based-policy/ )
			{
				$idbp = 1;
			}
			elsif( $idbp && $line =~ /\s+end/ )	# End of ID based policy
			{
				$idbp = 0;
			}
			elsif( $idbp )	# Skip everything in this block
			{
				next;
			}
			elsif( $line =~ /^end/ )	# Policies done - get out
			{
				$mode_pol = 0;
			}
			elsif( $line =~ /\s+edit\s(\d+)/ )
			{
				$fwid = $1;
				$rules{$fwid}->{'order'} = $order++;
			}
			elsif( $line =~ /\s+set/ )
			{
				my($f, $v) = &cleanvalue($line);
				$rules{$fwid}->{$f} = $v;
			}
		}
	}
}

################################################################
#Print the DIV Containers
print "<div id=\"container\">\n";
print "<div id=\"show_addresses\">\n";
&show_addresses;
print "</div>\n";
print "<p><br></br><br></br></p>";
#
print "<div id=\"show_address_groups\">\n";
&show_address_groups;
print "</div>\n";
print "<p><br></br><br></br></p>";
#
print "<div id=\"show_services\">\n";
&show_services;
print "</div>\n";
print "<p><br></br><br></br></p>";
#
print "<div id=\"show_service_groups\">\n";
&show_service_groups;
print "</div>\n";
print "<p><br></br><br></br></p>";
#
print "<div id=\"show_vips\">\n";
&show_vips;
print "</div>\n";
print "<p><br></br><br></br></p>";
#
print "<div id=\"show_pools\">\n";
&show_pools;
print "</div>\n";
print "<p><br></br><br></br></p>";
#
print "<div id=\"show_routes\">\n";
&show_routes;
print "</div>\n";
print "<p><br></br><br></br></p>";
#
print "<div id=\"show_policies\">\n";
&show_policies;
print "</div>\n";
print "<p><br></br><br></br></p>";
#

print "</div>\n";


################################################################
# Spit out list of addresses
sub show_addresses
{
	print "<h1>Address</h1>\n";
	print "<table id=\"show_addresses_table\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"display\">\n";
	print "<thead><tr><th>Address</th><th>Value</th></tr></thead><tfoot><tr><th>Address</th><th>Value</th></tr></tfoot>";
	#print "<tbody>\n";
	foreach my $i (sort keys %addr)
	{
		my $rowcolour = $colour_r1;
		$rowcolour = $colour_r2 if( ($rowcount++ % 2) == 0 );
		my %a = %{ $addr{$i} };
		#my $type = $a{'type'};
		my $type = 'subnet';
		$type = $a{'type'} if( defined $a{'type'} );
		if( $type eq 'ipmask' )
		{
			my ($sn,$sm) = split(/\s+/, $a{'subnet'}, 2);
			my $cidr = sm_to_cidr($sm);
			print "<tr bgcolor=\"$rowcolour\"><td>$i</td><td>$sn/$cidr</td></tr>\n";
		}
		elsif( $type eq 'iprange' )
		{
			print "<tr bgcolor=\"$rowcolour\"><td>$i</td><td>$a{'start-ip'} -> $a{'end-ip'}</td></tr>\n";
		}
	}
	#print "</tbody>\n";
	print "</table>\n";
}

################################################################
# Spit out list of address groups
sub show_address_groups
{
	print "<h1>Address Groups</h1>\n";
	print "<table id=\"show_address_groups_table\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"display\">\n";
	print "<thead><tr><th>Address Group</th><th>Address(es)</th></tr></thead>";
	foreach my $i (sort keys %addrg)
	{
		my $rowcolour = $colour_r1;
		$rowcolour = $colour_r2 if( ($rowcount++ % 2) == 0 );
		my %a = %{ $addrg{$i} };
		print "<tr bgcolor=\"$rowcolour\"><td>$i</td><td>$a{'member'}</td></tr>\n";
	}
	print "</table>\n";
}

################################################################
# Spit out list of custom services
sub show_services
{
	print "<h1>Services</h1>\n";
	print "<table id=\"show_services_table\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"display\">\n";
	print "<thead><tr><th>Service</th><th>TCP/UDP Port(s)</th></tr></thead>";
	foreach my $i (sort keys %serv)
	{
		my $rowcolour = $colour_r1;
		$rowcolour = $colour_r2 if( ($rowcount++ % 2) == 0 );
		my %s = %{ $serv{$i} };
		my $prot = '';
		my @ports = ();
		if( defined $s{'tcp-portrange'} )
		{
			my @ps = split(/\s+/, $s{'tcp-portrange'});
			foreach my $p (@ps) { push(@ports, "TCP $p"); }
		}
		if( defined $s{'udp-portrange'} )
		{
			my @ps = split(/\s+/, $s{'udp-portrange'});
			foreach my $p (@ps) { push(@ports, "UDP $p"); }
		}
		print "<tr bgcolor=\"$rowcolour\"><td>$i</td><td>" . join('<br>', @ports) . "</td></tr>\n";
	}
	print "</table>\n";
}

################################################################
# Spit out list of service groups
sub show_service_groups
{
	print "<h1>Service Groups</h1>\n";
	print "<table id=\"show_service_groups_table\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"display\">\n";
	print "<thead><tr><th>Service Group</th><th>Services</th></tr></thead>";
	foreach my $i (sort keys %servg)
	{
		my $rowcolour = $colour_r1;
		$rowcolour = $colour_r2 if( ($rowcount++ % 2) == 0 );
		my %a = %{ $servg{$i} };
		print "<tr bgcolor=\"$rowcolour\"><td>$i</td><td>$a{'member'}</td></tr>\n";
	}
	print "</table>\n";
}

################################################################
# Spit out list of VIPS
sub show_vips
{
	print "<h1>VIPS</h1>\n";
	print "<table id=\"show_vips_table\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"display\">\n";
	print "<thead><tr><th>VIP</th><th>Source</th><th>Destination</th></tr></thead>";
	foreach my $i (sort keys %vips)
	{
		my $rowcolour = $colour_r1;
		$rowcolour = $colour_r2 if( ($rowcount++ % 2) == 0 );
		my %a = %{ $vips{$i} };
		print "<tr bgcolor=\"$rowcolour\"><td>$i</td><td>$a{'extip'}";
		print ":$a{'extport'}" if( defined $a{'extport'} );
		print "</td><td>$a{'mappedip'}";
		print ":$a{'mappedport'}" if( defined $a{'mappedport'} );
		print "</td></tr>\n";
	}
	print "</table>\n";
}

################################################################
# Spit out list of IP Pools
sub show_pools
{
	print "<h1>Address Pools</h1>\n";
	print "<table id=\"show_pools_table\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"display\">\n";
	print "<thead><tr><th>Address Pool</th><th>Start Address</th><th>End Address</th></tr></thead>";
	foreach my $i (sort keys %pools)
	{
		my $rowcolour = $colour_r1;
		$rowcolour = $colour_r2 if( ($rowcount++ % 2) == 0 );
		my %a = %{ $pools{$i} };
		print "<tr bgcolor=\"$rowcolour\"><td>$i</td><td>$a{'startip'}</td><td>$a{'endip'}</td></tr>\n";
	}
	print "</table>\n";
}

################################################################
# Spit out list of static routes
sub show_routes
{
	print "<h1>Routes</h1>\n";
	print "<table id=\"show_routes_table\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"display\">\n";
	print "<thead><tr><th>Route</th><th>Interface</th><th>Gateway</th></tr></thead>";
	foreach my $i (sort keys %routes)
	{
		my $rowcolour = $colour_r1;
		$rowcolour = $colour_r2 if( ($rowcount++ % 2) == 0 );
		my %a = %{ $routes{$i} };
		my $dst = 'default';
		$dst = $a{'dst'} if( $a{'dst'} ne '' );
		print "<tr bgcolor=\"$rowcolour\"><td>$dst</td><td>$a{'device'}</td><td>$a{'gateway'}</td></tr>\n";
	}
	print "</table>\n";
}

################################################################
# Spit out list of policies
sub show_policies
{
	print "<h1>Policies</h1>\n";
	print "<table id=\"show_policies_table\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"display\">\n";
	print "<thead><tr><th>Interface</th><th>Source</th><th>Destination</th><th>Service</th><th>NAT</th><th>Action</th></tr></thead>";
	my $prev_pair = '';
	my $first_row = 1;
	foreach my $i (sort by_interface_order keys %rules)
	{
		my %r = %{ $rules{$i} };
		my $pair = "$r{'srcintf'} -> $r{'dstintf'}";
#		if( $pair ne $prev_pair )
#		{
#			
#			# Show column headers
#			if( $first_row )
#			{
#				print "<tr bgcolor=\"$colour_if\"><td>Source and Destination Interface</td><td>Source</td><td>Destination</td><td>Service</td><td>NAT</td><td>Action</td></tr>\n";
#				$first_row = 0;
#			}
#			$prev_pair = $pair;
#			$rowcount = 0;
#                        print "<tr><td bgcolor=\"$colour_if\"><td><b>$r{'srcintf'} -> $r{'dstintf'}</b></td>\n";
#		}else

        print "<tr><td title='$line'>$r{'srcintf'} -> $r{'dstintf'}</td>";

		my $rowcolour = $colour_r1;
		$rowcolour = $colour_r2 if( ($rowcount++ % 2) == 0 );
                
		print "<td>" . &into_rows($r{'srcaddr'}) . "</td>"; #<tr bgcolor=\"$rowcolour\">
		print "<td>" . &into_rows($r{'dstaddr'}) . "</td>";
		print "<td>" .  &into_rows($r{'service'});
		my $nat = '&nbsp;';
		my $action = 'deny';
		$action = $r{'action'} if defined( $r{'action'} );
		if( $r{'nat'} eq 'enable' )
		{
			$nat = 'Enabled';
			$nat = $r{'poolname'} if( defined $r{'poolname'} );
		}else
		{
			$nat = 'N/A';
		}
		print "</td><td>$nat</td>";
		print "<td>$action</td></tr>\n";
	}
	print "</table>\n";
}

################################################################
# Sort same as FG gui, by srcintf followed by dstintf, maintain config order
sub by_interface_order
{
	my $aif = $rules{$a}->{'srcintf'};
	my $bif = $rules{$b}->{'srcintf'};
	my $rc = $aif cmp $bif;
	if( $rc == 0 )
	{
		my $adif = $rules{$a}->{'dstintf'};
		my $bdif = $rules{$b}->{'dstintf'};
		$rc = $adif cmp $bdif;

		if( $rc == 0 )
		{
			my $aord = $rules{$a}->{'order'};
			my $bord = $rules{$b}->{'order'};
			$rc = $aord <=> $bord;
		}
	}
	return($rc);
}

################################################################
# Split multiple fields into rows rather than a long string
sub into_rows
{
	return('&nbsp;') if( $_[0] eq '' );
	my @bits = split(/\s+/, $_[0]);
	if( $#bits > 0 )
	{
		return( join('<br>', @bits) );
	}
	return($bits[0]);
}

################################################################
# Clean a set line's value of un-necessary bits
sub cleanvalue
{
	my $in = $_[0];
	$in =~ s/^--More--//g;
	$in =~ s/^\s+//g;
	my @bits = split(/\s+/, $in);
	my $val = join('; ', @bits[2 .. $#bits]);
	$val =~ s/"//g;
        #my $val = join($val,";");
	return($bits[1], $val);
}

################################################################
# Debug to print out contents of a hash
sub show_hash
{
	my %h = %{ $_[0] };
	foreach my $k (keys %h)
	{
		print "$k = $h{$k}\n";
	}
}
sub sm_to_cidr
{
	my $snval = $_[0];
	my $cidr = 0;
	for (split /\./, $snval) {
        	$bin = sprintf "%b", $_;
        	$c = $bin =~ tr/1/1/;
        	$cidr = $cidr + $c;
	}
	return $cidr;
}
################################################################
# Clean a set line's value of un-necessary bits
sub cleanvalueaddress
{
	my $in = $_[0];
	$in =~ s/^--More--//g;
	$in =~ s/^\s+//g;
	my @bits = split(/\s+/, $in);
	my $val = join(' ', @bits[2 .. $#bits]);
	$val =~ s/"//g;
        #my $val = join($val,";");
	return($bits[1], $val);
}