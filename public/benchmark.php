<?php

function isPrime($num) {
    //1 is not prime. See: http://en.wikipedia.org/wiki/Prime_number#Primality_of_one
    if($num == 1)
        return false;

    //2 is prime (the only even number that is prime)
    if($num == 2)
        return true;

    /**
     * if the number is divisible by two, then it's not prime and it's no longer
     * needed to check other even numbers
     */
    if($num % 2 == 0) {
        return false;
    }

    /**
     * Checks the odd numbers. If any of them is a factor, then it returns false.
     * The sqrt can be an aproximation, hence just for the sake of
     * security, one rounds it to the next highest integer value.
     */
    for($i = 3; $i <= ceil(sqrt($num)); $i = $i + 2) {
        if($num % $i == 0)
            return false;
    }

    return true;
}

function microtime_float()
{
    list($usec, $sec) = explode(" ", microtime());
    return ((float)$usec + (float)$sec);
}

$start = microtime_float();
$startPrime = microtime_float();

$i = 0;
while ($i < 100000) {

        $rand = rand(1147483647, 2147483647);
        if(isPrime($rand)) {
                echo "+";
        } else {
                echo "-";
        }
        $i++;
}

$endPrime = microtime_float();

$startWrite = microtime_float();

$x = 0;
while ($x < 100) {
	$i = 0; 
	$longString = '';
	while ($i < 10000) {
        	$rand = rand();
        	$longString .= $rand; 
        	$i++;
	}

	file_put_contents('/var/www/html/benchmark.tmp', $longString); 
	$x++;
}
$endWrite = microtime_float();

$startRead = microtime_float();

$contents = file_get_contents('/var/www/html/benchmark.tmp');

$endRead = microtime_float();

$end = microtime_float();

$primeDuration = round($endPrime - $startPrime, 4); 
$writeDuration = round($endWrite - $startWrite, 4); 
$readDuration = round($endRead - $startRead, 4); 
$totalDuration = round($end - $start, 4);


echo "\n\n";

echo "Prime number benchmark: $primeDuration seconds\n";
echo "File write benchmark: $writeDuration seconds\n";
echo "File read benchmark: $readDuration seconds\n";
echo "Total time for all benchmarks: $totalDuration seconds\n";








