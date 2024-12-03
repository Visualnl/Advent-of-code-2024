#dag 3

$string = Get-Content "day-3-input.txt" -Raw



$pattern = 'mul\((\b\d+),(\b\d+)\)'


$resultaten = [regex]::Matches($string,$pattern)

$opgeteld  = 0
foreach($resultaat in $resultaten){
    $som = [int] $resultaat.Groups[1].value * [int] $resultaat.Groups[2].value
    $opgeteld += $som
 
}

Write-Host $opgeteld
