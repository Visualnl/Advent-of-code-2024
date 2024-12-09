$input = Get-Content -Path "day-6-input.txt" 


$matrix = @()
foreach ($line in $input) {
    $matrix += ,@($line.ToCharArray())
}

$deltaX = @(0, 1, 0, -1)  
$deltaY = @(-1, 0, 1, 0)  


$huidigeRichting = 0  
$posities = @()
for ($rijIndex = 0; $rijIndex -lt $matrix.Count; $rijIndex++) {
    $rij = $matrix[$rijIndex]
    for ($positieIndex = 0; $positieIndex -lt $rij.Length; $positieIndex++) {
        if ($rij[$positieIndex] -eq '^') {
            $posities = @($rijIndex, $positieIndex)
        }
    }
}


$bezochtePosities = @{}
$bezochtePosities["$($posities[0]),$($posities[1])"] = $true

Write-Host "Beginposities: $($posities[0]) $($posities[1])"
$inMatrix = $true

while ($inMatrix) {
  
    $volgendepositieX = $posities[1] + $deltaX[$huidigeRichting]
    $volgendepositieY = $posities[0] + $deltaY[$huidigeRichting]

    if ($volgendepositieY -lt 0 -or $volgendepositieY -ge $matrix.Count -or $volgendepositieX -lt 0 -or $volgendepositieX -ge $matrix[$volgendepositieY].Length) {
        Write-Host "Buiten matrix! Stoppen."
        $inMatrix = $false
        break
    }

   
    if ($matrix[$volgendepositieY][$volgendepositieX] -eq '#') {
        Write-Host "Obstakel gevonden op $volgendepositieY $volgendepositieX"
        
  
        $huidigeRichting = ($huidigeRichting + 1) % 4
    } else {

        $posities = @($volgendepositieY, $volgendepositieX)
        $bezochtePosities["$($posities[0]),$($posities[1])"] = $true
        Write-Host "Nieuwe positie: $($posities[0]) $($posities[1])"
    }
}


$aantalStappen = $bezochtePosities.Count
Write-Host "Aantal verschillende bezochte posities: $aantalStappen"
