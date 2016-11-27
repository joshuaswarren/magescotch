Having trouble with MageScotch?<br/>

Please check <a href="https://github.com/joshuaswarren/magemalt/issues?utf8=✓&q=is%3Aissue%20">GitHub</a> to see if anyone else has had a similar issue.<br/>

If you've encountered a new issue, please help me improve MageScotch by opening a new issue and including the following information:
<br>
<br>

<hr>
<?php

echo 'MageMalt Version File:  ';
passthru('cat /home/vagrant/magemalt_version.txt');
echo "\n<br>\n";

echo 'MageMalt Provisioned Version: '; 
passthru('cat  /var/www/public/magemalt_provisioned_version.txt');
echo "\n<br>\n";

?>
<hr>
<br>
Please also run the following commands on your local/host machine and include the details in your bug report:<br>
<br>
vagrant --version<br>
<br>
vboxmanage --version<br>
<br>
