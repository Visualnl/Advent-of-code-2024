function Is-Increasing {
    param (
       [int[]]$array 
    )
    for($i = 1 ; $i -lt $array.length; $i++) {
        if($array[$i] -le $array[$i - 1]) {
           return $false
        }
    }
    return $true
}

function Is-Decreasing {
    param (
       [int[]]$array 
    )
    for($i = 1 ; $i -lt $array.length; $i++) {
        if($array[$i] -ge $array[$i - 1]) {
           return $false
        }
    }
    return $true
}

function Verschil-Tussen1en3 {
    param(
        [int[]]$array
    )
    for($i = 0 ; $i -lt $array.length - 1; $i++) {
        $verschil =  $array[$i] - $array[$i + 1] 
        if($verschil -notin -1,-2,-3,1,2,3) {
           return $false
        }
    }
    return $true

}


$array = Get-Content -path "day-2-input.txt"
$levels = @{}
$index = 1

foreach($level in $array) {
    $levels[$index] = $level.Split(' ') | ForEach-Object { [int]$_ }
    $index++
}


$safe = 0

for ($i = 1; $i -le $levels.Keys.Count; $i++) {
    # Haal het array op voor de huidige key
    $level = $levels[$i]

    # Controleer of het array oplopend is
    $isIncreasing = Is-Increasing -array $level

    # Controleer of het array aflopend is
    $isDecreasing = Is-Decreasing -array $level

    # Controleer of het verschil tussen opeenvolgende getallen geldig is
    $isValidDifference = Verschil-Tussen1en3 -array $level

    # Als het array oplopend of aflopend is en het verschil valide is, verhoog dan $safe
    if (($isIncreasing -or $isDecreasing) -and $isValidDifference) {
        $safe += 1
    }
}


Write-Host $safe
