#eerste gedeelte day1

$array = Get-Content -path "day-1-input.txt" 
$links = @()
$rechts = @()
for($i = 0; $i -lt $array.Length; $i++) {
    $zonderSpace = $array[$i] -replace "\s+", ""
    $linksgetal =  $zonderSpace.Substring(0,5)
    $links += $linksgetal
    $rechtsgetal = $zonderSpace.Substring(5,5)
    $rechts += $rechtsgetal 
}

$linksGesorteerd = $links | Sort-Object
$rechtsGesorteerd = $rechts | Sort-Object 

$som = 0

for($i = 0 ; $i -lt $array.length; $i++) {
    Write-Host $linksGesorteerd[$i] $rechtsGesorteerd[$i]
    if($linksGesorteerd[$i]  -ge $rechtsGesorteerd[$i]) {
        $resultaat = $linksGesorteerd[$i]  - $rechtsGesorteerd[$i]
        
    } else {
       $resultaat = $rechtsGesorteerd[$i] - $linksGesorteerd[$i]
      
    }
    
    $som += $resultaat
}

write-host $som

#part 2 van day 1
$frequenties = @{}

for($i = 0 ; $i -lt $links.length; $i++) {
    $waarde = $links[$i]
    if(-not $frequenties.ContainsKey($waarde)) {
        $frequenties[$waarde] = 0
    } 
    foreach($nummer in $rechts) {
        if($nummer -eq $waarde) {
            $frequenties[$waarde]  += 1
        }
    }
}



$som = 0

foreach ($linkseWaarde in $frequenties.Keys) {
    $resultaat = [int]$linkseWaarde * [int]$frequenties[$linkseWaarde]
    $som += $resultaat

}

write-host  $som

