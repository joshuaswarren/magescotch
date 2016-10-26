<?php
echo "Current working directory: " . getcwd() ."\n<br>\n";
echo "Uptime: "; 
passthru ('uptime');
echo "\n<br>\n";
phpinfo();
