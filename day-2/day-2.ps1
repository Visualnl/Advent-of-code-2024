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



$array = Get-Content -path "day-2-input.txt"
$levels = @{}
$index = 1

foreach($level in $array) {
    $levels[$index] = $level.Split(' ') | ForEach-Object { [int]$_ }
    $index++
}


# Toon de uitkomst van de controle
Write-Host "Level 1 is increasing: $(Is-Increasing -array $levels[1])"
Write-Host "Level 1 is decreasing: $(Is-Decreasing -array $levels[923])"