
$verwijderdPattern = "(?s)don't.*?(?=do)"


$string = Get-Content "day-3-input.txt" -Raw
$string = $string -replace $verwijderdPattern, ''


$pattern = 'mul\((\b\d+),(\b\d+)\)'

$resultaten = [regex]::Matches($string, $pattern)

$opgeteld = 0
foreach ($resultaat in $resultaten) {
    $som = [int]$resultaat.Groups[1].Value * [int]$resultaat.Groups[2].Value
    $opgeteld += $som
}


Write-Host "De totale som is: $opgeteld"
